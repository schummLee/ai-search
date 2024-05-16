// Copyright (c) 2023, Dart | Windows. Please see the AUTHORS file for details.
// All rights reserved. Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:win32_registry/win32_registry.dart';

void main() {
  final hkcu = Registry.currentUser;
  const subkeyName = 'DemoTestKey';
  final subkey = hkcu.createKey(subkeyName);

  const dword = RegistryValue('TestDWORD', RegistryValueType.int32, 0xFACEFEED);
  subkey.createValue(dword);

  const qword =
      RegistryValue('TestQWORD', RegistryValueType.int64, 0x0123456789ABCDEF);
  subkey.createValue(qword);

  const string = RegistryValue(
    'TestString',
    RegistryValueType.string,
    'The human race has one really effective weapon, and that is laughter.',
  );
  subkey
    ..createValue(string)
    ..close();

  hkcu.close();
}
