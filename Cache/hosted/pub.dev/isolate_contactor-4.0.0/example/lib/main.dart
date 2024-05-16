// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:isolate_contactor/isolate_contactor.dart';

void main() {
  runApp(const MyApp());
}

/// This must be a static or top-level function
///
/// This function is very expensive to calculate, so I can test for un-blocking UI feature
Future<int> fibonacciRescusiveFuture(int n) async {
  if (n == 0) return 0;
  if (n <= 2) return 1;

  // Magic code: This is only for non-blocking UI on Web platform
  await Future.delayed(Duration.zero);

  return await fibonacciRescusiveFuture(n - 1) +
      await fibonacciRescusiveFuture(n - 2);
}

/// This must be a static or top-level function
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

void isolateFunction(dynamic params) {
  final channel = IsolateContactorController<int, int>(params);
  channel.onIsolateMessage.listen((message) async {
    // Do more stuff here

    final result = await fibonacciFuture(message);

    // Send the result to your [onMessage] stream
    channel.sendResult(result);
  });
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late IsolateContactor isolateContactor1;
  late IsolateContactor isolateContactor2;
  late IsolateContactor isolateContactor3;
  int value1 = 2;
  int value2 = 3;
  int value3 = 4;

  bool isLoading = true;
  Random rad = Random();

  @override
  void initState() {
    initial();
    super.initState();
  }

  @override
  void dispose() {
    isolateContactor1.dispose();
    isolateContactor2.dispose();
    isolateContactor3.dispose();
    super.dispose();
  }

  Future<void> initial() async {
    isolateContactor1 = await IsolateContactor.create<int, int>(
      fibonacciFuture,
      workerName: 'fibonacci',
      debugMode: true,
    );
    isolateContactor2 = await IsolateContactor.createOwnIsolate(
      isolateFunction,
      workerName: 'fibonacciRescusive',
      debugMode: true,
    );
    isolateContactor3 = await IsolateContactor.create<int, int>(
      fibonacciRescusiveFuture,
      debugMode: true,
    );
    setState(() => isLoading = false);
  }

  void calculateValue1([int max = 100]) {
    value1 = rad.nextInt(max);
    print('Isolate 1: Calculate fibonancci at F$value1');
    isolateContactor1.sendMessage(value1);
  }

  void calculateValue2([int max = 100]) {
    value2 = rad.nextInt(max);
    print('Isolate 2: Calculate fibonancci at F$value2');
    isolateContactor2.sendMessage(value2);
  }

  void calculateValue3([int max = 30]) {
    value3 = rad.nextInt(max);
    print('Isolate 3: Calculate fibonancci at F$value3');
    isolateContactor3.sendMessage(value3);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Multi Isolate Fibonacci'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: isLoading
                ? const CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 8),
                      StreamBuilder(
                        stream: isolateContactor1.onMessage,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            isolateContactor1.sendMessage(value1);
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return Text(
                              'Isolate1: Fibonacci at F$value1 = ${snapshot.data}');
                        },
                      ),
                      StreamBuilder(
                          stream: isolateContactor1.onComputeState,
                          builder: (context, snapshot) {
                            return ListTile(
                              title: ElevatedButton(
                                onPressed: () => calculateValue1(),
                                child: Text(snapshot.data != null &&
                                        snapshot.data == ComputeState.computing
                                    ? 'Computing F$value1..'
                                    : 'Calculate new Fibonacci'),
                              ),
                            );
                          }),
                      ListTile(
                        title: ElevatedButton(
                          onPressed: () {
                            isolateContactor1.restart();
                          },
                          child: const Text('Restart isolate 1'),
                        ),
                      ),
                      ListTile(
                        title: ElevatedButton(
                          onPressed: () {
                            isolateContactor1.terminate();
                          },
                          child: const Text('Terminate isolate 1'),
                        ),
                      ),
                      StreamBuilder(
                        stream: isolateContactor2.onMessage,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            isolateContactor2.sendMessage(value2);
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return Text(
                              'Isolate2: Fibonacci at F$value2 = ${snapshot.data}');
                        },
                      ),
                      StreamBuilder(
                          stream: isolateContactor2.onComputeState,
                          builder: (context, snapshot) {
                            return ListTile(
                              title: ElevatedButton(
                                onPressed: () => calculateValue2(),
                                child: Text(snapshot.data != null &&
                                        snapshot.data == ComputeState.computing
                                    ? 'Computing F$value2..'
                                    : 'Calculate new Fibonacci'),
                              ),
                            );
                          }),
                      ListTile(
                        title: ElevatedButton(
                          onPressed: () {
                            isolateContactor2.restart();
                          },
                          child: const Text('Restart isolate 2'),
                        ),
                      ),
                      ListTile(
                        title: ElevatedButton(
                          onPressed: () {
                            isolateContactor2.terminate();
                          },
                          child: const Text('Terminate isolate 2'),
                        ),
                      ),
                      StreamBuilder(
                        stream: isolateContactor3.onMessage,
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            isolateContactor3.sendMessage(value3);
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return Text(
                              'Isolate3: Fibonacci at F$value3 = ${snapshot.data}');
                        },
                      ),
                      StreamBuilder(
                          stream: isolateContactor3.onComputeState,
                          builder: (context, snapshot) {
                            return ListTile(
                              title: ElevatedButton(
                                onPressed: () => calculateValue3(),
                                child: Text(snapshot.data != null &&
                                        snapshot.data == ComputeState.computing
                                    ? 'Computing F$value3..'
                                    : 'Calculate new Fibonacci'),
                              ),
                            );
                          }),
                      ListTile(
                        title: ElevatedButton(
                          onPressed: () {
                            isolateContactor3.restart();
                          },
                          child: const Text('Restart isolate 3'),
                        ),
                      ),
                      ListTile(
                        title: ElevatedButton(
                          onPressed: () {
                            isolateContactor3.terminate();
                          },
                          child: const Text('Terminate isolate 3'),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
