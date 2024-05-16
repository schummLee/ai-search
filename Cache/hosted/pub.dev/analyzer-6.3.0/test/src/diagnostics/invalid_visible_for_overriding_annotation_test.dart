// Copyright (c) 2021, the Dart project authors. Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:analyzer/src/error/codes.g.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

import '../dart/resolution/context_collection_resolution.dart';

void main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(InvalidVisibleForOverridingAnnotationTest);
  });
}

@reflectiveTest
class InvalidVisibleForOverridingAnnotationTest
    extends PubPackageResolutionTest {
  @override
  void setUp() {
    super.setUp();
    writeTestPackageConfigWithMeta();
  }

  test_invalid_class() async {
    await assertErrorsInCode('''
import 'package:meta/meta.dart';
@visibleForOverriding
class C {}
''', [error(WarningCode.INVALID_VISIBLE_FOR_OVERRIDING_ANNOTATION, 33, 21)]);
  }

  test_invalid_constructor() async {
    await assertErrorsInCode(r'''
import 'package:meta/meta.dart';
class C {
  @visibleForOverriding
  C();
}
''', [
      error(WarningCode.INVALID_VISIBLE_FOR_OVERRIDING_ANNOTATION, 45, 21),
    ]);
  }

  test_invalid_extension_unnamed() async {
    await assertErrorsInCode('''
import 'package:meta/meta.dart';
@visibleForOverriding
extension on double {}
''', [error(WarningCode.INVALID_VISIBLE_FOR_OVERRIDING_ANNOTATION, 33, 21)]);
  }

  test_invalid_extensionMember() async {
    await assertErrorsInCode(r'''
import 'package:meta/meta.dart';
extension E on String {
  @visibleForOverriding
  void foo() {}
}
''', [
      error(WarningCode.INVALID_VISIBLE_FOR_OVERRIDING_ANNOTATION, 59, 21),
    ]);
  }

  test_invalid_extensionType() async {
    await assertErrorsInCode('''
import 'package:meta/meta.dart';
@visibleForOverriding
extension type E(int i) {}
''', [error(WarningCode.INVALID_VISIBLE_FOR_OVERRIDING_ANNOTATION, 33, 21)]);
  }

  test_invalid_extensionType_member() async {
    await assertErrorsInCode('''
import 'package:meta/meta.dart';

extension type E(int i) { 
  @visibleForOverriding
  void f() { }
}
''', [error(WarningCode.INVALID_VISIBLE_FOR_OVERRIDING_ANNOTATION, 63, 21)]);
  }

  test_invalid_staticMember() async {
    await assertErrorsInCode(r'''
import 'package:meta/meta.dart';
class C {
  @visibleForOverriding
  static void m() {}
}
''', [
      error(WarningCode.INVALID_VISIBLE_FOR_OVERRIDING_ANNOTATION, 45, 21),
    ]);
  }

  test_invalid_topLevelFunction() async {
    await assertErrorsInCode(r'''
import 'package:meta/meta.dart';
@visibleForOverriding void foo() {}
''', [
      error(WarningCode.INVALID_VISIBLE_FOR_OVERRIDING_ANNOTATION, 33, 21),
    ]);
  }

  test_invalid_topLevelVariable() async {
    await assertErrorsInCode(r'''
import 'package:meta/meta.dart';
@visibleForOverriding final a = 1;
''', [
      error(WarningCode.INVALID_VISIBLE_FOR_OVERRIDING_ANNOTATION, 33, 21),
    ]);
  }

  test_invalid_topLevelVariable_multi() async {
    await assertErrorsInCode(r'''
import 'package:meta/meta.dart';
@visibleForOverriding var a = 1, b;
''', [
      error(WarningCode.INVALID_VISIBLE_FOR_OVERRIDING_ANNOTATION, 33, 21),
    ]);
  }

  test_valid() async {
    await assertNoErrorsInCode(r'''
import 'package:meta/meta.dart';

class C {
  @visibleForOverriding
  void m() {}
  @visibleForOverriding
  int x = 3;
  @visibleForOverriding
  int get y => 5;
}
''');
  }
}
