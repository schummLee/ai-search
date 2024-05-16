// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:convert';

import 'package:isolate_contactor/isolate_contactor.dart';
import 'package:test/test.dart';

//  dart test
//  dart test --platform=chrome,vm

void main() {
  test('Test multi listener of stream', () async {
    StreamController streamController = StreamController.broadcast();

    final stream1 = streamController.stream.listen((event) {
      print('1: $event');

      expect(event, 'adb');
    });

    final stream2 = streamController.stream.listen((event) {
      print('2: $event');

      expect(event, 'adb');
    });

    streamController.add('adb');

    await Future.delayed(const Duration(seconds: 3));
    stream1.cancel();
    stream2.cancel();
  });

  test('Exception converter', () {
    final exception = IsolateException(
      'Some thing',
      StackTrace.fromString('Some stack trace'),
    );

    final json = exception.toJson();
    expect(IsolateException.isValidObject(json), equals(true));

    expect(IsolateException.fromJson(json), isA<IsolateException>());
  });

  test('Basic use', () async {
    // Just for waiting till the result has come
    bool valueExit = false;

    // Create IsolateContactor
    IsolateContactor isolateContactor =
        await IsolateContactor.create<int, int>(fibonacci);

    // Listen to the result
    isolateContactor.onMessage.listen((event) {
      print('isolate 1: $event');
      expect(event, 55);

      valueExit = true;
    });

    // Send 10 to fibonacci isolate function
    isolateContactor.sendMessage(10);

    // Only for waiting the result in Console app. Don't need to use in your real app
    while (!valueExit) {
      await Future.delayed(const Duration(milliseconds: 10));
    }

    // Dispose
    isolateContactor.dispose();
  });

  test('Create isolate with build-in function', () async {
    bool value1Exit = false;
    bool value2Exit = false;

    IsolateContactor<int, int> isolateContactor1 =
        await IsolateContactor.create(fibonacci);
    IsolateContactor<double, List<double>> isolateContactor2 =
        await IsolateContactor.create(subtract);
    IsolateContactor<int, int> isolateContactor3 =
        await IsolateContactor.create(fibonacciFuture);

    // Listen to f10
    isolateContactor1.onMessage.listen((event) {
      print('isolate 1: $event');
      expect(event, 55);

      value1Exit = true;
    });

    // Listen to f20
    isolateContactor2.onMessage.listen((event) {
      print('isolate 2: $event');

      expect(event, 10);

      value2Exit = true;
    });

    // Listen to f13
    isolateContactor3.onMessage.listen((event) {
      print('isolate 3: $event');
      expect(event, 233);

      value1Exit = true;
    });

    // Send 10 to [fibonacci]
    isolateContactor1.sendMessage(10);

    // Send 20 and 10 to [subtract]
    isolateContactor2.sendMessage([10.0, 20.0]);

    // Send 13 to [fibonacciFuture]
    isolateContactor3.sendMessage(13);

    // Only for waiting the result in Console app. Don't need to use in your real app
    while (!value1Exit && !value2Exit) {
      await Future.delayed(const Duration(milliseconds: 10));
    }

    isolateContactor1.dispose();
    isolateContactor2.dispose();
    isolateContactor3.dispose();
  });
  test('Create isolate with your own function', () async {
    bool valueExit1 = false;
    bool valueExit2 = false;

    late IsolateContactor isolateContactor;
    late IsolateContactor isolateContactorFuture;

    isolateContactor = await IsolateContactor.createOwnIsolate(
      isolateFunction,
      debugMode: true,
    );
    isolateContactorFuture = await IsolateContactor.createOwnIsolate(
      isolateFunctionFuture,
      debugMode: true,
    );

    // Listen to 10 + 20
    isolateContactor.onMessage.listen((event) {
      print('isolate: $event');

      expect(event, 30.0);

      valueExit1 = true;
    });

    // Listen to 15 + 20
    isolateContactorFuture.onMessage.listen((event) {
      print('isolate: $event');

      expect(event, 35.0);

      valueExit2 = true;
    });

    // Send 10 and 20 to [isolateFunction]
    isolateContactor.sendMessage([10.0, 20.0]);

    // Send 10 and 20 to [isolateFunction]
    isolateContactorFuture.sendMessage([15.0, 20.0]);

    // Only for waiting the result in Console app. Don't need to use in your real app
    while (!valueExit1 && !valueExit2) {
      await Future.delayed(const Duration(milliseconds: 10));
    }

    isolateContactor.dispose();
    isolateContactorFuture.dispose();
  });

  test('Test receive result from sendMessage', () async {
    // Create IsolateContactor
    IsolateContactor isolateContactor =
        await IsolateContactor.create<int, int>(fibonacci);

    // Listen to the result
    isolateContactor.onMessage.listen((event) {
      print('isolate 1: $event');
      expect(event, 55);
    });

    // Send 10 to fibonacci isolate function
    final result = await isolateContactor.sendMessage(10);
    print('Result from sendMessage: $result');
    expect(result, 55);

    // Dispose
    isolateContactor.dispose();
  });

  test('Test for Worker (Web only with flag --platform=chrome)', () async {
    // Create IsolateContactor
    IsolateContactor<int, int> isolateContactor = await IsolateContactor.create(
      fibonacci,
      workerName: 'fibonacci',
      // converter: (result) => int.parse(result.toString()),
    );

    IsolateContactor<double, List<double>> isolateContactor1 =
        await IsolateContactor.create(
      add,
      workerName: 'add',
    );

    // Listen to the result
    isolateContactor.onMessage.listen((event) {
      print('isolate 1: $event');
      expect(event, 55);
    });

    // Send 10 to fibonacci isolate function
    final result = await isolateContactor.sendMessage(10);
    print('Result from fibonacci.js: $result');
    expect(result, 55);

    final result1 = await isolateContactor1.sendMessage([10.0, 15.0]);
    print('Result from add.js: $result1');
    expect(result1, 25);

    // Dispose
    isolateContactor.dispose();
  });

  test('Test for Worker with Map result (Web only with flag --platform=chrome)',
      () async {
    // Create IsolateContactor
    IsolateContactor<Map<int, double>, double> isolateContactor =
        await IsolateContactor.create(
      convertToMap,
      workerName: 'map_result',
      workerConverter: (result) {
        print(result);

        final Map<int, double> convert = {};

        (jsonDecode(result) as Map).forEach((key, value) =>
            convert.addAll({int.parse(key): double.parse(value)}));

        print('convert: $convert');
        return convert;
      },
    );

    // Listen to the result
    isolateContactor.onMessage.listen((event) {
      print('isolate 1: $event');
      expect(event, convertToMap(10.0));
    });

    // Send 10 to fibonacci isolate function
    final result = await isolateContactor.sendMessage(10.0);
    print('Result from fibonaccijs: $result');
    expect(result, convertToMap(10.0));

    // Dispose
    isolateContactor.dispose();
  });

  test('Test with exception method', () async {
    final isolateContactor = await IsolateContactor.create(
      errorFunction,
      workerName: 'error_function',
      debugMode: true,
    );

    int currentCount = 0;
    try {
      for (currentCount = 0; currentCount < 50; currentCount++) {
        expect(await isolateContactor.sendMessage(currentCount), currentCount);
      }
    } on StateError catch (e) {
      // This catch is for other platform
      expect(e.message, equals('This is an error function, error value is 10'));
    } catch (e) {
      // This catch is for Worker because we cannot pass the Exception object to
      // our main app from the Worker
      expect(e, equals('This is an error function, error value is 10'));
    } finally {
      isolateContactor.dispose();
    }
  });
}

int fibonacci(int n) {
  if (n <= 2) return 1;

  int n1 = 0, n2 = 1, n3 = 1;

  for (int i = 2; i <= n; i++) {
    n3 = n1 + n2;
    n1 = n2;
    n2 = n3;
  }

  return n3.round();
}

Future<int> fibonacciFuture(int n) async {
  if (n == 0) return 0;
  if (n <= 2) return 1;

  double n1 = 0, n2 = 1, n3 = 1;

  for (int i = 2; i <= n; i++) {
    n3 = n1 + n2;
    n1 = n2;
    n2 = n3;

    // Magic code: This is only for non-blocking UI in Web platform
    await Future.delayed(Duration.zero);
  }

  return n3.round();
}

// single parameter
@pragma('vm:entry-point')
double subtract(List<double> n) => n[1] - n[0];

// multi parameters as an dynamic
@pragma('vm:entry-point')
double add(List<double> message) => message[0] + message[1];

// multi parameters as an dynamic
@pragma('vm:entry-point')
Future<double> addFuture(double a, double b) async {
  await null;

  return a + b;
}

// Create your own function here
@pragma('vm:entry-point')
void isolateFunction(dynamic params) {
  final channel =
      IsolateContactorController<double, List<double>>(params, onDispose: () {
    print('Dispose isolateFunction');
  });
  channel.onIsolateMessage.listen((message) {
    // Do your stuff here

    // Send value back to your main process in stream [onMessage]
    channel.sendResult(add(message));
  });
}

// Create your own function here
@pragma('vm:entry-point')
void isolateFunctionFuture(dynamic params) {
  final channel =
      IsolateContactorController<double, List<double>>(params, onDispose: () {
    print('Dispose isolateFunctionFuture');
  });
  channel.onIsolateMessage.listen((message) async {
    channel.sendResult(await addFuture(message[0], message[1]));
  });
}

/// This must be a static or top-level function
@pragma('vm:entry-point')
Map<int, double> convertToMap(double n) => {1: n * 1.112, 2: n * 1.112};

@pragma('vm:entry-point')
int errorFunction(dynamic value) {
  if (value == 10) {
    return throw StateError('This is an error function, error value is $value');
  }

  return value;
}
