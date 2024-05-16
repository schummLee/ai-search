# Isolate Manager

## **Features**

- An easy way to create multiple isolates for a function and keep it active to send and receive data multiple times.

- Supports `Worker` on the Web (`Worker` is the real Isolate on the Web). The plugin will use `Future` (and `Stream`) if `Worker` is unavailable in the working browser or is not configured.

- Multiple `compute` operations are allowed because the plugin will queue the input data and send it to a free isolate later.

- Supports `try-catch` blocks.

- If you don't need to control your own function, you can use [isolates_helper](https://pub.dev/packages/isolates_helper) - a simpler version of this package that allows you to compute with multiple functions.

## **Basic Usage** (Use built-in function)

There are multiple ways to use this package. The only thing to notice is that the `function` has to be a `static` or `top-level` function to work.

### **Step 1:** Create a top-level or static function

``` dart
@pragma('vm:entry-point')
Future<Map<String, dynamic>> fetchAndDecode(String url) async {
  final response = await http.Client().get(Uri.parse(url));
  return jsonDecode(response.body);
}
```

**You must add `@pragma('vm:entry-point')` annotation to all methods that you want to use for isolation since Flutter 3.3.0. Without this annotation, the Dart compiler could strip out unused functions, inline them, shrink names, etc., and the native code would fail to call it.**

### **Step 2:** Create an IsolateManager instance for that function

``` dart
final isolateFetchAndDecode = IsolateManager.create(
  fetchAndDecode, // Function you want to compute
  concurrent: 4, // Number of concurrent isolates. Default is 1
);
```

### **Step 3 [Optional]:** Initialize the instance; this step is not required because it's automatically called when you use `.compute` for the first time

``` dart
await isolateManager.start();
```

You can also run this method when creating the instance:

``` dart
final isolateManager = IsolateManager.create(
  fetchAndDecode, // Function you want to compute
  concurrent: 4, // Number of concurrent isolates. Default is 1
)..start();
```

### **Step 4:** Send and receive data

``` dart
final result = await isolateManager.compute('https://path/to/json.json');
```

You can send even more times than `concurrent` because the plugin will queue the input data and send it to a free isolate later.

You can listen to the result as a `stream`:

``` dart
isolateManager.stream.listen((result) => print(result));
```

Build your widget with `StreamBuilder`:

``` dart
StreamBuilder(
  stream: isolateManager.stream,
  builder: (context, snapshot) {
    if (!snapshot.hasData) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text('Data: ${snapshot.data}');
  },
),
```

### **Step 5:** Restart the `IsolateManager` if needed

``` dart
await isolateManager.restart();
```

### **Step 6:** Stop `IsolateManager` when it finishes work

``` dart
await isolateManager.stop();
```

## **Advanced Usage** (Use your own function)

You can control everything with this method when you want to create multiple isolates for a function. With this method, you can also do one-time stuff when the isolate is started or each-time stuff when you call `compute` or `sendMessage`.

### **Step 1:** Create a function of this form

``` dart
/// Create your own function here. This function will be called when your isolate starts.
@pragma('vm:entry-point')
void isolateFunction(dynamic params) {
  // Initialize the controller for the child isolate. This function will be declared
  // with `Map<String, dynamic>` as the return type (.sendResult) and `String` as the parameter type (.sendMessage).
  final controller = IsolateManagerController<Map<String, dynamic>, String>(
    params, 
    onDispose: () {
      print('Dispose isolateFunction');
    }
  );

  // Get your initialParams.
  // Notice that these `initialParams` are different from the `params` above.
  final initialParams = controller.initialParams;

  // Do your one-time stuff here; this code will be called only once when you `start`
  // this instance of `IsolateManager`.

  // Listen to messages received from the main isolate; this code will be called each time
  // you use `compute` or `sendMessage`.
  controller.onIsolateMessage.listen((message) {
    // Create a completer
    Completer completer = Completer();

    // Handle the result and exceptions
    completer.future.then(
      (value) => controller.sendResult(value),
      // Send the exception to your main app
      onError: (err, stack) =>
          controller.sendResultError(IsolateException(err, stack)),
    );

    // Use try-catch to send the exception to the main app
    try {
      // Do your stuff here. 
      completer.complete(fetchAndDecode(message));

    } catch (err, stack) {
      // Send the exception to your main app
      controller.sendResultError(IsolateException(err, stack));
    }
  });
}
```

### **Step 2:** Create an IsolateManager instance for your own function

``` dart
final isolateManager = IsolateManager.createOwnIsolate(
    isolateFunction,
    initialParams: 'This is initialParams',
    debugMode: true,
  );
```

### **Step 3:**

Now you can use everything as above from this step.

### Additional features

- You can use `try-catch` to catch exceptions:

``` dart
try {
  final result = await isolateManager.compute('https://path/to/json.json');
} on Exception catch (e1) {
  print(e1);
} catch (e2) {
  print(e2);
}
```

- You can even manage the final result by using this callback, useful when you create your own function that needs to send the progress value before returning the final result (look at the example in the method `isolateProgressFunction` for more details):

``` dart
final result = await isolateManager.compute('https://path/to/json.json',
      callback: (value) {
        // Condition to recognize the progress value. Ex:
        final decoded = jsonDecode(value);
        if (decoded.containsKey('progress')) {
          print(decoded['progress']);

          // Mark this value as not the final result
          return false;
        }

        print('The final result is: $value');
        // Mark this value as the final result and send it into the `result`.
        return true;
      }
    )
```

## Worker Configuration

- **Step 1:** Download [isolate_manager/worker/worker.dart](https://raw.githubusercontent.com/lamnhan066/isolate_manager/main/worker/worker.dart) or copy the below code to the file named `worker.dart`:

  <details>
  
  <summary>worker.dart</summary>

  ``` dart
  // ignore_for_file: avoid_web_libraries_in_flutter, depend_on_referenced_packages

  import 'dart:async';
  import 'dart:convert';
  import 'dart:html' as html;
  import 'dart:js' as js;

  import 'package:isolate_manager/isolate_manager.dart';
  import 'package:js/js.dart' as pjs;
  import 'package:js/js_util.dart' as js_util;

  @pjs.JS('self')
  external dynamic get globalScopeSelf;

  /// dart compile js worker.dart -o worker.js -O4

  /// In most cases you don't need to modify this function
  main() {
    callbackToStream('onmessage', (html.MessageEvent e) {
      return js_util.getProperty(e, 'data');
    }).listen((message) async {
      final Completer completer = Completer();
      completer.future.then(
        (value) => jsSendMessage(value),
        onError: (err, stack) => jsSendMessage(IsolateException(err, stack).toJson()),
      );
      try {
        completer.complete(worker(message));
      } catch (err, stack) {
        jsSendMessage(IsolateException(err, stack).toJson());
      }
    });
  }

  /// TODO: Modify your function here:
  ///
  ///  Do this if you need to throw an exception
  ///
  ///  You should only throw the `message` instead of a whole Object because it may
  ///  not show as expected when sending back to the main app.
  ///
  /// ``` dart
  ///  return throw 'This is an error that you need to catch in your main app';
  /// ```
  FutureOr<dynamic> worker(dynamic message) {
    // Best way to use this method is encoding the result to JSON
    // before sending to the main app, then you can decode it back to
    // the return type you want with `workerConverter`.
    return jsonEncode(message);
  }

  /// Internal function
  Stream<T> callbackToStream<J, T>(String name, T Function(J jsValue) unwrapValue) {
    var controller = StreamController<T>.broadcast(sync: true);
    js_util.setProperty(js.context['self'], name, js.allowInterop((J event) {
      controller.add(unwrapValue(event));
    }));
    return controller.stream;
  }

  /// Internal function
  void jsSendMessage(dynamic m) {
    js.context.callMethod('postMessage', [m]);
  }
  ```

  </details>

- **Step 2:** Modify the function `FutureOr<dynamic> worker(dynamic message)` in the script to serves your purposes. You can also use the `top-level or static function` that you have created above. Look at these [examples](https://github.com/lamnhan066/isolate_manager/tree/main/example/lib/web_workers) to learn more.

  **You should copy that function to separated file or copy to `worker.dart` file to prevent the `dart compile js` error because some other functions depend on flutter library.**

- **Step 3:** Run `dart compile js worker.dart -o worker.js -O4` to compile dart to js (-O0 to -O4 is the obfuscated level of `js`).
- **Step 4:** Copy `worker.js` to web folder (the same folder with `index.html`).
- **Step 5:** Now you can add `worker` to `workerName` like below:

  ``` dart
  final isolateManager = IsolateManager.create(
      add,
      workerName: 'worker', // Don't need to add the extension
    );
  ```

  Now the plugin will handle all other action to make the real isolate works on Web.

  **Note:** If you want to use Worker more effectively, convert all parameters and results to JSON (or String) before sending them.

## Additional

- Use `queuesLength` to get the current number of queued computation.

- Use `ensureStarted` to able to wait for the `start` method to finish when you want to call the `start` method manually without `await` and wait for it later.

- Use `isStarted` to check if the `start` method is completed or not.

- If the `worker.dart` show errors for `js` package, you can add `js` to `dev_dependencies`:
  
  ``` dart
  dev_dependencies:
    js:
  ```

- The result that you get from the isolate (or Worker) is sometimes different from the result that you want to get from the return type in the main app, you can use `converter` and `workerConverter` parameters to convert the result received from the `Isolate` (converter) and `Worker` (workerConverter). Example:

  ``` dart
  final isolateManager = IsolateManager.create(
    convertToMap,
    // Ex: 'worker' if the name is 'worker.js'
    workerName: 'worker',
    // Convert the data from worker to fix the issue related to the different data type between dart and js
    workerConverter: (result) {
      final Map<int, double> convert = {};

      // Convert Map<String, String> (received from Worker) to Map<int, double>
      final decodedMap = jsonDecode(result) as Map;
      decodedMap.forEach((key, value) => convert.addAll({int.parse(key): double.parse(value)}));

      return convert;
    },
  );
  ```

  **Data flow:** Main -> Isolate or Worker -> **Converter** -> Result

- If you want to use Worker more effectively, convert all parameters and results to JSON (or String) before sending them.

## Contributions

- This plugin is an enhanced plugin for `isolate_contactor`: [pub](https://pub.dev/packages/isolate_contactor) | [git](https://github.com/lamnhan066/isolate_contactor)
- If you encounter any problems or feel the library is missing a feature, feel free to open an issue. Pull requests are also welcome.

- If you like my work or the free stuff on this channel and want to say thanks, or encourage me to do more, you can buy me a coffee. Thank you so much!
</br>

<p align='center'><a href="https://www.buymeacoffee.com/lamnhan066"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=&slug=lamnhan066&button_colour=5F7FFF&font_colour=ffffff&font_family=Cookie&outline_colour=000000&coffee_colour=FFDD00" alt="Buy me a coffee" width="200"></a></p>

## To-do list

- Find the best way to prevent using `dart compile js`.
