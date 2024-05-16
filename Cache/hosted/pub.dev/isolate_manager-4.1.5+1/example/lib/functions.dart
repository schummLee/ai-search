import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:isolate_manager/isolate_manager.dart';

import 'models/complex_model.dart';

@pragma('vm:entry-point')
int countEven(int num) {
  int count = 0;
  while (num > 0) {
    if (num % 2 == 0) {
      count++;
    }
    num--;
  }
  return count;
}

/// This must be a static or top-level function
///
/// This function is very expensive to calculate, so I can test for un-blocking UI feature
@pragma('vm:entry-point')
Future<int> fibonacciRescusiveFuture(int n) async {
  if (n == 0) return 0;
  if (n <= 2) return 1;

  // Magic code: This is only for non-blocking UI on Web platform
  await Future.delayed(Duration.zero);

  return await fibonacciRescusiveFuture(n - 1) +
      await fibonacciRescusiveFuture(n - 2);
}

/// This must be a static or top-level function
@pragma('vm:entry-point')
Future<int> fibonacciFuture(int n) async {
  if (n == 0) return 0;
  if (n <= 2) return 1;

  double n1 = 0, n2 = 1, n3 = 1;

  for (int i = 2; i <= n; i++) {
    n3 = n1 + n2;
    n1 = n2;
    n2 = n3;

    // Magic code: This is only for non-blocking UI on Web platform
    await Future.delayed(Duration.zero);
  }

  return n3.round();
}

/// This must be a static or top-level function
@pragma('vm:entry-point')
int fibonacci(int n) {
  if (n == 0) return 0;
  if (n == 1 || n == 2) return 1;

  int n1 = 0, n2 = 1, n3 = 1;

  for (int i = 2; i <= n; i++) {
    n3 = n1 + n2;
    n1 = n2;
    n2 = n3;
  }

  return n3.round();
}

@pragma('vm:entry-point')
int error(int n) {
  if (n == 0) throw StateError('n == 0');
  return n;
}

/// Write an own function to calculate the `fibonacciFuture`.
@pragma('vm:entry-point')
void isolateFunction(dynamic params) {
  final channel = IsolateManagerController(params);
  channel.onIsolateMessage.listen((message) async {
    // Do more stuff here

    final result = await fibonacciFuture(message);

    // Send the result to your [onMessage] stream
    channel.sendResult(result);
  });
}

/// Send the progress value before sending the final result
@pragma('vm:entry-point')
void isolateProgressFunction(dynamic params) {
  final channel = IsolateManagerController<String, String>(params);
  channel.onIsolateMessage.listen((message) async {
    // Send the progress value
    for (int i = 0; i < 100; i++) {
      final progress = {'progress': i};
      await Future.delayed(const Duration(milliseconds: 100));
      channel.sendResult(jsonEncode(progress));
    }

    // Send the result to your [onMessage] stream
    final result = {'result': message};
    channel.sendResult(jsonEncode(result));
  });
}

@pragma('vm:entry-point')
dynamic functionName(dynamic message) => message;

@pragma('vm:entry-point')
String complexFunction(String param) {
  final parsed = ComplexModelParam.fromJson(param);
  final result = <String>[];

  for (final hobby in parsed.hobbies) {
    result.add(
      "My name is ${parsed.name}, I'm ${parsed.age} years old, My hobby is $hobby",
    );
  }

  return ComplexModelResult(result).toJson();
}

@pragma('vm:entry-point')
Future<Map<String, dynamic>> fetchAndDecode(String url) async {
  final response = await http.Client().get(Uri.parse(url));
  return jsonDecode(response.body);
}
