// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
//
// VMOptions=--async-debugger --verbose-debug

import 'dart:developer';
import 'package:test/test.dart';
import 'package:vm_service/vm_service.dart';

import 'common/service_test_common.dart';
import 'common/test_helper.dart';

const LINE_A = 30;
const LINE_B = 36;
const LINE_C = 40;

const LINE_0 = 29;

notCalled() async {
  await null;
  await null;
  await null;
  await null;
}

foobar() async {
  await null;
  debugger(); // LINE_0.
  print('foobar'); // LINE_A.
}

helper() async {
  await null;
  print('helper');
  await foobar(); // LINE_B.
}

testMain() async {
  helper(); // LINE_C.
}

var tests = <IsolateTest>[
  hasStoppedAtBreakpoint,
  stoppedAtLine(LINE_0),
  stepOver,
  hasStoppedAtBreakpoint,
  stoppedAtLine(LINE_A),
  (VmService service, IsolateRef isolate) async {
    final isolateId = isolate.id!;
    // Verify awaiter stack trace is the current frame + the awaiter.
    Stack stack = await service.getStack(isolateId);
    expect(stack.asyncCausalFrames, isNotNull);
    List<Frame> asyncCausalFrames = stack.asyncCausalFrames!;
    expect(asyncCausalFrames.length, greaterThanOrEqualTo(4));
    expect(asyncCausalFrames[0].function!.name, 'foobar');
    expect(asyncCausalFrames[1].kind, FrameKind.kAsyncSuspensionMarker);
    expect(asyncCausalFrames[2].function!.name, 'helper');
    expect(asyncCausalFrames[3].kind, FrameKind.kAsyncSuspensionMarker);
  },
];

main(args) => runIsolateTestsSynchronous(
      args,
      tests,
      'awaiter_async_stack_contents_2_test.dart',
      testeeConcurrent: testMain,
      extraArgs: extraDebuggingArgs,
    );
