import 'dart:async' as _i7;
import 'dart:collection' as _i2;
import 'dart:convert' as _i15;
import 'dart:io' as _i6;
import 'dart:typed_data' as _i5;

import 'package:hive/hive.dart' as _i3;
import 'package:hive/src/backend/storage_backend.dart' as _i10;
import 'package:hive/src/binary/frame.dart' as _i9;
import 'package:hive/src/box/change_notifier.dart' as _i8;
import 'package:hive/src/box/default_compaction_strategy.dart';
import 'package:hive/src/box/default_key_comparator.dart';
import 'package:hive/src/box/keystore.dart' as _i11;
import 'package:hive/src/hive_impl.dart' as _i12;
import 'package:hive/src/io/frame_io_helper.dart' as _i16;
import 'package:hive/src/object/hive_list_impl.dart' as _i14;
import 'package:hive/src/object/hive_object.dart' as _i4;
import 'package:hive/src/registry/type_registry_impl.dart' as _i13;
import 'package:mockito/mockito.dart' as _i1;

class _FakeType extends _i1.Fake implements Type {}

class _FakeListQueue<E> extends _i1.Fake implements _i2.ListQueue<E> {}

class _FakeBox<E> extends _i1.Fake implements _i3.Box<E> {}

class _FakeLazyBox<E> extends _i1.Fake implements _i3.LazyBox<E> {}

class _FakeBoxBase<E> extends _i1.Fake implements _i3.BoxBase<E> {}

class _FakeHiveList<E extends _i4.HiveObjectMixin> extends _i1.Fake
    implements _i3.HiveList<E> {}

class _FakeIterator<E> extends _i1.Fake implements Iterator<E> {}

class _FakeHiveObject extends _i1.Fake implements _i4.HiveObject {}

class _FakeUint8List extends _i1.Fake implements _i5.Uint8List {}

class _FakeRandomAccessFile extends _i1.Fake implements _i6.RandomAccessFile {}

class _FakeFile extends _i1.Fake implements _i6.File {}

class _FakeDateTime extends _i1.Fake implements DateTime {}

class _FakeIOSink extends _i1.Fake implements _i6.IOSink {}

/// A class which mocks [Box].
///
/// See the documentation for Mockito's code generation for more information.
class MockBox<E> extends _i1.Mock implements _i3.Box<E> {
  Iterable<E> get values =>
      (super.noSuchMethod(Invocation.getter(#values), []) as Iterable<E>);
  Iterable<E> valuesBetween({dynamic startKey, dynamic endKey}) =>
      (super.noSuchMethod(
          Invocation.method(
              #valuesBetween, [], {#startKey: startKey, #endKey: endKey}),
          []) as Iterable<E>);
  E? getAt(int? index) =>
      (super.noSuchMethod(Invocation.method(#getAt, [index])) as E?);
  Map<dynamic, E> toMap() =>
      (super.noSuchMethod(Invocation.method(#toMap, []), <dynamic, E>{})
          as Map<dynamic, E>);
  String get name =>
      (super.noSuchMethod(Invocation.getter(#name), '') as String);
  bool get lazy =>
      (super.noSuchMethod(Invocation.getter(#lazy), false) as bool);
  Future<void> put(dynamic key, E value) =>
      (super.noSuchMethod(Invocation.method(#put, [key, value]), Future.value())
          as Future<void>);
  _i7.Future<void> delete(key) =>
      (super.noSuchMethod(Invocation.method(#delete, [key]), Future.value())
          as Future<void>);
  _i7.Future<void> deleteAll(Iterable keys) =>
      (super.noSuchMethod(Invocation.method(#deleteAll, [keys]), Future.value())
          as Future<void>);
  bool containsKey(key) =>
      (super.noSuchMethod(Invocation.method(#containsKey, [key]), false)
          as bool);
}

/// A class which mocks [ChangeNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockChangeNotifier extends _i1.Mock implements _i8.ChangeNotifier {
  void notify(_i9.Frame? frame) =>
      super.noSuchMethod(Invocation.method(#notify, [frame]));
  _i7.Stream<_i3.BoxEvent> watch({dynamic key}) => (super.noSuchMethod(
      Invocation.method(#watch, [], {#key: key}),
      Stream<_i3.BoxEvent>.empty()) as _i7.Stream<_i3.BoxEvent>);
  _i7.Future<void> close() =>
      (super.noSuchMethod(Invocation.method(#close, []), Future.value(null))
          as _i7.Future<void>);
}

/// A class which mocks [StorageBackend].
///
/// See the documentation for Mockito's code generation for more information.
class MockStorageBackend extends _i1.Mock implements _i10.StorageBackend {
  bool get supportsCompaction =>
      (super.noSuchMethod(Invocation.getter(#supportsCompaction), false)
          as bool);
  _i7.Future<void> initialize(_i3.TypeRegistry? registry,
          _i11.Keystore<dynamic>? keystore, bool? lazy) =>
      (super.noSuchMethod(
          Invocation.method(#initialize, [registry, keystore, lazy]),
          Future.value(null)) as _i7.Future<void>);
  _i7.Future<dynamic> readValue(_i9.Frame? frame) => (super.noSuchMethod(
          Invocation.method(#readValue, [frame]), Future.value(null))
      as _i7.Future<dynamic>);
  _i7.Future<void> writeFrames(List<_i9.Frame>? frames) => (super.noSuchMethod(
          Invocation.method(#writeFrames, [frames]), Future.value(null))
      as _i7.Future<void>);
  _i7.Future<void> compact(Iterable<_i9.Frame>? frames) => (super.noSuchMethod(
          Invocation.method(#compact, [frames]), Future.value(null))
      as _i7.Future<void>);
  _i7.Future<void> clear() =>
      (super.noSuchMethod(Invocation.method(#clear, []), Future.value(null))
          as _i7.Future<void>);
  _i7.Future<void> close() =>
      (super.noSuchMethod(Invocation.method(#close, []), Future.value(null))
          as _i7.Future<void>);
  _i7.Future<void> deleteFromDisk() => (super.noSuchMethod(
          Invocation.method(#deleteFromDisk, []), Future.value(null))
      as _i7.Future<void>);
}

/// A class which mocks [Keystore].
///
/// See the documentation for Mockito's code generation for more information.
class MockKeystore<E> extends _i1.Mock implements _i11.Keystore<E> {
  _i2.ListQueue<_i11.KeyTransaction<E>> get transactions => (super.noSuchMethod(
          Invocation.getter(#transactions),
          _FakeListQueue<_i11.KeyTransaction<E>>())
      as _i2.ListQueue<_i11.KeyTransaction<E>>);
  int get deletedEntries =>
      (super.noSuchMethod(Invocation.getter(#deletedEntries), 0) as int);
  int get length => (super.noSuchMethod(Invocation.getter(#length), 0) as int);
  Iterable<_i9.Frame> get frames =>
      (super.noSuchMethod(Invocation.getter(#frames), <_i9.Frame>[])
          as Iterable<_i9.Frame>);
  int autoIncrement() =>
      (super.noSuchMethod(Invocation.method(#autoIncrement, []), 0) as int);
  void updateAutoIncrement(int? key) =>
      super.noSuchMethod(Invocation.method(#updateAutoIncrement, [key]));
  bool containsKey(dynamic key) =>
      (super.noSuchMethod(Invocation.method(#containsKey, [key]), false)
          as bool);
  dynamic keyAt(int? index) =>
      (super.noSuchMethod(Invocation.method(#keyAt, [index])) as dynamic);
  _i9.Frame? getAt(int? index) =>
      (super.noSuchMethod(Invocation.method(#getAt, [index])) as _i9.Frame?);
  Iterable<dynamic> getKeys() =>
      (super.noSuchMethod(Invocation.method(#getKeys, []), [])
          as Iterable<dynamic>);
  Iterable<E> getValues() =>
      (super.noSuchMethod(Invocation.method(#getValues, []), [])
          as Iterable<E>);
  Iterable<E> getValuesBetween([dynamic startKey, dynamic endKey]) =>
      (super.noSuchMethod(
              Invocation.method(#getValuesBetween, [startKey, endKey]), [])
          as Iterable<E>);
  _i7.Stream<_i3.BoxEvent> watch({dynamic key}) => (super.noSuchMethod(
      Invocation.method(#watch, [], {#key: key}),
      Stream<_i3.BoxEvent>.empty()) as _i7.Stream<_i3.BoxEvent>);
  _i9.Frame? insert(_i9.Frame? frame,
          {bool? notify = true, bool lazy = false}) =>
      (super.noSuchMethod(
              Invocation.method(#insert, [frame], {#notify: notify}))
          as _i9.Frame?);
  bool beginTransaction(List<_i9.Frame>? newFrames) => (super.noSuchMethod(
      Invocation.method(#beginTransaction, [newFrames]), false) as bool);
  int clear() => (super.noSuchMethod(Invocation.method(#clear, []), 0) as int);
  _i7.Future<dynamic> close() =>
      (super.noSuchMethod(Invocation.method(#close, []), Future.value(null))
          as _i7.Future<dynamic>);
}

/// A class which mocks [HiveImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockHiveImpl extends _i1.Mock implements _i12.HiveImpl {
  void init(String? path) =>
      super.noSuchMethod(Invocation.method(#init, [path]));
  _i7.Future<_i3.Box<E>> openBox<E>(String? name,
          {_i3.HiveCipher? encryptionCipher,
          _i3.KeyComparator? keyComparator = defaultKeyComparator,
          _i3.CompactionStrategy? compactionStrategy =
              defaultCompactionStrategy,
          bool? crashRecovery = true,
          String? path,
          _i5.Uint8List? bytes,
          List<int>? encryptionKey}) =>
      (super.noSuchMethod(
          Invocation.method(#openBox, [
            name
          ], {
            #encryptionCipher: encryptionCipher,
            #keyComparator: keyComparator,
            #compactionStrategy: compactionStrategy,
            #crashRecovery: crashRecovery,
            #path: path,
            #bytes: bytes,
            #encryptionKey: encryptionKey
          }),
          Future.value(_FakeBox<E>())) as _i7.Future<_i3.Box<E>>);
  _i7.Future<_i3.LazyBox<E>> openLazyBox<E>(String? name,
          {_i3.HiveCipher? encryptionCipher,
          _i3.KeyComparator? keyComparator = defaultKeyComparator,
          _i3.CompactionStrategy? compactionStrategy =
              defaultCompactionStrategy,
          bool? crashRecovery = true,
          String? path,
          List<int>? encryptionKey}) =>
      (super.noSuchMethod(
          Invocation.method(#openLazyBox, [
            name
          ], {
            #encryptionCipher: encryptionCipher,
            #keyComparator: keyComparator,
            #compactionStrategy: compactionStrategy,
            #crashRecovery: crashRecovery,
            #path: path,
            #encryptionKey: encryptionKey
          }),
          Future.value(_FakeLazyBox<E>())) as _i7.Future<_i3.LazyBox<E>>);
  _i3.BoxBase<dynamic>? getBoxWithoutCheckInternal(String? name) => (super
          .noSuchMethod(Invocation.method(#getBoxWithoutCheckInternal, [name]))
      as _i3.BoxBase<dynamic>?);
  _i3.Box<E> box<E>(String? name) =>
      (super.noSuchMethod(Invocation.method(#box, [name]), _FakeBox<E>())
          as _i3.Box<E>);
  _i3.LazyBox<E> lazyBox<E>(String? name) => (super
          .noSuchMethod(Invocation.method(#lazyBox, [name]), _FakeLazyBox<E>())
      as _i3.LazyBox<E>);
  bool isBoxOpen(String? name) =>
      (super.noSuchMethod(Invocation.method(#isBoxOpen, [name]), false)
          as bool);
  _i7.Future<void> close() =>
      (super.noSuchMethod(Invocation.method(#close, []), Future.value(null))
          as _i7.Future<void>);
  void unregisterBox(String? name) =>
      super.noSuchMethod(Invocation.method(#unregisterBox, [name]));
  _i7.Future<void> deleteBoxFromDisk(String? name, {String? path}) =>
      (super.noSuchMethod(
          Invocation.method(#deleteBoxFromDisk, [name], {#path: path}),
          Future.value(null)) as _i7.Future<void>);
  _i7.Future<void> deleteFromDisk() => (super.noSuchMethod(
          Invocation.method(#deleteFromDisk, []), Future.value(null))
      as _i7.Future<void>);
  List<int> generateSecureKey() =>
      (super.noSuchMethod(Invocation.method(#generateSecureKey, []), <int>[])
          as List<int>);
  _i7.Future<bool> boxExists(String? name, {String? path}) =>
      (super.noSuchMethod(Invocation.method(#boxExists, [name], {#path: path}),
          Future.value(false)) as _i7.Future<bool>);
  _i13.ResolvedAdapter<dynamic>? findAdapterForTypeId(int? typeId) =>
      (super.noSuchMethod(Invocation.method(#findAdapterForTypeId, [typeId]))
          as _i13.ResolvedAdapter<dynamic>?);
  void registerAdapter<T>(_i3.TypeAdapter<T>? adapter,
          {bool? internal = false, bool? override = false}) =>
      super.noSuchMethod(Invocation.method(#registerAdapter, [adapter],
          {#internal: internal, #override: override}));
  bool isAdapterRegistered(int? typeId, {bool? internal = false}) =>
      (super.noSuchMethod(
          Invocation.method(
              #isAdapterRegistered, [typeId], {#internal: internal}),
          false) as bool);
  void ignoreTypeId<T>(int? typeId) =>
      super.noSuchMethod(Invocation.method(#ignoreTypeId, [typeId]));
}

/// A class which mocks [HiveList].
///
/// See the documentation for Mockito's code generation for more information.
class MockHiveList<E extends _i4.HiveObject> extends _i1.Mock
    implements _i3.HiveList<E> {
  _i3.BoxBase<dynamic> get box =>
      (super.noSuchMethod(Invocation.getter(#box), _FakeBoxBase<dynamic>())
          as _i3.BoxBase<dynamic>);
  Iterable<dynamic> get keys =>
      (super.noSuchMethod(Invocation.getter(#keys), []) as Iterable<dynamic>);
  _i3.HiveList<T> castHiveList<T extends _i4.HiveObjectMixin>() =>
      (super.noSuchMethod(
              Invocation.method(#castHiveList, []), _FakeHiveList<T>())
          as _i3.HiveList<T>);
  _i7.Future<void> deleteAllFromHive() => (super.noSuchMethod(
          Invocation.method(#deleteAllFromHive, []), Future.value(null))
      as _i7.Future<void>);
  _i7.Future<void> deleteFirstFromHive() => (super.noSuchMethod(
          Invocation.method(#deleteFirstFromHive, []), Future.value(null))
      as _i7.Future<void>);
  _i7.Future<void> deleteLastFromHive() => (super.noSuchMethod(
          Invocation.method(#deleteLastFromHive, []), Future.value(null))
      as _i7.Future<void>);
  _i7.Future<void> deleteFromHive(int? index) => (super.noSuchMethod(
          Invocation.method(#deleteFromHive, [index]), Future.value(null))
      as _i7.Future<void>);
  Map<dynamic, E> toMap() =>
      (super.noSuchMethod(Invocation.method(#toMap, []), <dynamic, E>{})
          as Map<dynamic, E>);
}

/// A class which mocks [HiveListImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockHiveListImpl<E extends _i4.HiveObject> extends _i1.Mock
    implements _i14.HiveListImpl<E> {
  String get boxName =>
      (super.noSuchMethod(Invocation.getter(#boxName), '') as String);
  Iterable<dynamic> get keys =>
      (super.noSuchMethod(Invocation.getter(#keys), []) as Iterable<dynamic>);
  _i3.Box<dynamic> get box =>
      (super.noSuchMethod(Invocation.getter(#box), _FakeBox<dynamic>())
          as _i3.Box<dynamic>);
  List<E> get delegate =>
      (super.noSuchMethod(Invocation.getter(#delegate), <E>[]) as List<E>);
  set length(int? newLength) =>
      super.noSuchMethod(Invocation.setter(#length, [newLength]));
  set debugHive(_i3.HiveInterface? hive) =>
      super.noSuchMethod(Invocation.setter(#debugHive, [hive]));
  Iterator<E> get iterator =>
      (super.noSuchMethod(Invocation.getter(#iterator), _FakeIterator<E>())
          as Iterator<E>);
  bool get isEmpty =>
      (super.noSuchMethod(Invocation.getter(#isEmpty), false) as bool);
  bool get isNotEmpty =>
      (super.noSuchMethod(Invocation.getter(#isNotEmpty), false) as bool);
  E get first => (super.noSuchMethod(Invocation.getter(#first), null) as E);
  set first(E? value) => super.noSuchMethod(Invocation.setter(#first, [value]));
  E get last => (super.noSuchMethod(Invocation.getter(#last), null) as E);
  set last(E? value) => super.noSuchMethod(Invocation.setter(#last, [value]));
  E get single => (super.noSuchMethod(Invocation.getter(#single), null) as E);
  Iterable<E> get reversed =>
      (super.noSuchMethod(Invocation.getter(#reversed), []) as Iterable<E>);
  void operator []=(int? index, E? value) =>
      super.noSuchMethod(Invocation.method(#[]=, [index, value]));
  void add(E? element) =>
      super.noSuchMethod(Invocation.method(#add, [element]));
  void addAll(Iterable<E>? iterable) =>
      super.noSuchMethod(Invocation.method(#addAll, [iterable]));
  _i3.HiveList<T> castHiveList<T extends _i4.HiveObjectMixin>() =>
      (super.noSuchMethod(
              Invocation.method(#castHiveList, []), _FakeHiveList<T>())
          as _i3.HiveList<T>);
  _i7.Future<void> deleteAllFromHive() => (super.noSuchMethod(
          Invocation.method(#deleteAllFromHive, []), Future.value(null))
      as _i7.Future<void>);
  _i7.Future<void> deleteFirstFromHive() => (super.noSuchMethod(
          Invocation.method(#deleteFirstFromHive, []), Future.value(null))
      as _i7.Future<void>);
  _i7.Future<void> deleteLastFromHive() => (super.noSuchMethod(
          Invocation.method(#deleteLastFromHive, []), Future.value(null))
      as _i7.Future<void>);
  _i7.Future<void> deleteFromHive(int? index) => (super.noSuchMethod(
          Invocation.method(#deleteFromHive, [index]), Future.value(null))
      as _i7.Future<void>);
  Map<dynamic, E> toMap() =>
      (super.noSuchMethod(Invocation.method(#toMap, []), <dynamic, E>{})
          as Map<dynamic, E>);
  E elementAt(int? index) => (super.noSuchMethod(
      Invocation.method(#elementAt, [index]), _FakeHiveObject()) as E);
  Iterable<E> followedBy(Iterable<E>? other) =>
      (super.noSuchMethod(Invocation.method(#followedBy, [other]), [])
          as Iterable<E>);
  void forEach(void Function(E)? action) =>
      super.noSuchMethod(Invocation.method(#forEach, [action]));
  bool contains(Object? element) =>
      (super.noSuchMethod(Invocation.method(#contains, [element]), false)
          as bool);
  bool every(bool Function(E)? test) =>
      (super.noSuchMethod(Invocation.method(#every, [test]), false) as bool);
  bool any(bool Function(E)? test) =>
      (super.noSuchMethod(Invocation.method(#any, [test]), false) as bool);
  E firstWhere(bool Function(E)? test, {E Function()? orElse}) =>
      (super.noSuchMethod(
          Invocation.method(#firstWhere, [test], {#orElse: orElse}),
          _FakeHiveObject()) as E);
  E lastWhere(bool Function(E)? test, {E Function()? orElse}) =>
      (super.noSuchMethod(
          Invocation.method(#lastWhere, [test], {#orElse: orElse}),
          _FakeHiveObject()) as E);
  E singleWhere(bool Function(E)? test, {E Function()? orElse}) =>
      (super.noSuchMethod(
          Invocation.method(#singleWhere, [test], {#orElse: orElse}),
          _FakeHiveObject()) as E);
  String join([String? separator]) =>
      (super.noSuchMethod(Invocation.method(#join, [separator]), '') as String);
  Iterable<E> where(bool Function(E)? test) =>
      (super.noSuchMethod(Invocation.method(#where, [test]), [])
          as Iterable<E>);
  Iterable<T> whereType<T>() =>
      (super.noSuchMethod(Invocation.method(#whereType, []), [])
          as Iterable<T>);
  Iterable<T> map<T>(T Function(E)? f) =>
      (super.noSuchMethod(Invocation.method(#map, [f]), []) as Iterable<T>);
  Iterable<T> expand<T>(Iterable<T> Function(E)? f) =>
      (super.noSuchMethod(Invocation.method(#expand, [f]), []) as Iterable<T>);
  E reduce(E Function(E, E)? combine) => (super.noSuchMethod(
      Invocation.method(#reduce, [combine]), _FakeHiveObject()) as E);
  T fold<T>(T? initialValue, T Function(T, E)? combine) => (super.noSuchMethod(
      Invocation.method(#fold, [initialValue, combine]), null) as T);
  Iterable<E> skip(int? count) =>
      (super.noSuchMethod(Invocation.method(#skip, [count]), [])
          as Iterable<E>);
  Iterable<E> skipWhile(bool Function(E)? test) =>
      (super.noSuchMethod(Invocation.method(#skipWhile, [test]), [])
          as Iterable<E>);
  Iterable<E> take(int? count) =>
      (super.noSuchMethod(Invocation.method(#take, [count]), [])
          as Iterable<E>);
  Iterable<E> takeWhile(bool Function(E)? test) =>
      (super.noSuchMethod(Invocation.method(#takeWhile, [test]), [])
          as Iterable<E>);
  List<E> toList({bool? growable}) => (super.noSuchMethod(
      Invocation.method(#toList, [], {#growable: growable}), <E>[]) as List<E>);
  Set<E> toSet() =>
      (super.noSuchMethod(Invocation.method(#toSet, []), <E>{}) as Set<E>);
  bool remove(Object? element) =>
      (super.noSuchMethod(Invocation.method(#remove, [element]), false)
          as bool);
  void removeWhere(bool Function(E)? test) =>
      super.noSuchMethod(Invocation.method(#removeWhere, [test]));
  void retainWhere(bool Function(E)? test) =>
      super.noSuchMethod(Invocation.method(#retainWhere, [test]));
  List<R> cast<R>() =>
      (super.noSuchMethod(Invocation.method(#cast, []), <R>[]) as List<R>);
  E removeLast() =>
      (super.noSuchMethod(Invocation.method(#removeLast, []), _FakeHiveObject())
          as E);
  Map<int, E> asMap() =>
      (super.noSuchMethod(Invocation.method(#asMap, []), <int, E>{})
          as Map<int, E>);
  List<E> operator +(List<E>? other) =>
      (super.noSuchMethod(Invocation.method(#+, [other]), <E>[]) as List<E>);
  List<E> sublist(int? start, [int? end]) =>
      (super.noSuchMethod(Invocation.method(#sublist, [start, end]), <E>[])
          as List<E>);
  Iterable<E> getRange(int? start, int? end) =>
      (super.noSuchMethod(Invocation.method(#getRange, [start, end]), [])
          as Iterable<E>);
  void removeRange(int? start, int? end) =>
      super.noSuchMethod(Invocation.method(#removeRange, [start, end]));
  void fillRange(int? start, int? end, [E? fill]) =>
      super.noSuchMethod(Invocation.method(#fillRange, [start, end, fill]));
  void setRange(int? start, int? end, Iterable<E>? iterable,
          [int? skipCount]) =>
      super.noSuchMethod(
          Invocation.method(#setRange, [start, end, iterable, skipCount]));
  void replaceRange(int? start, int? end, Iterable<E>? newContents) =>
      super.noSuchMethod(
          Invocation.method(#replaceRange, [start, end, newContents]));
  int indexOf(Object? element, [int? start]) =>
      (super.noSuchMethod(Invocation.method(#indexOf, [element, start]), 0)
          as int);
  int indexWhere(bool Function(E)? test, [int? start]) =>
      (super.noSuchMethod(Invocation.method(#indexWhere, [test, start]), 0)
          as int);
  int lastIndexOf(Object? element, [int? start]) =>
      (super.noSuchMethod(Invocation.method(#lastIndexOf, [element, start]), 0)
          as int);
  int lastIndexWhere(bool Function(E)? test, [int? start]) =>
      (super.noSuchMethod(Invocation.method(#lastIndexWhere, [test, start]), 0)
          as int);
  void insert(int? index, E? element) =>
      super.noSuchMethod(Invocation.method(#insert, [index, element]));
  E removeAt(int? index) => (super.noSuchMethod(
      Invocation.method(#removeAt, [index]), _FakeHiveObject()) as E);
  void insertAll(int? index, Iterable<E>? iterable) =>
      super.noSuchMethod(Invocation.method(#insertAll, [index, iterable]));
  void setAll(int? index, Iterable<E>? iterable) =>
      super.noSuchMethod(Invocation.method(#setAll, [index, iterable]));
}

/// A class which mocks [RandomAccessFile].
///
/// See the documentation for Mockito's code generation for more information.
class MockRandomAccessFile extends _i1.Mock implements _i6.RandomAccessFile {
  String get path =>
      (super.noSuchMethod(Invocation.getter(#path), '') as String);
  _i7.Future<void> close() =>
      (super.noSuchMethod(Invocation.method(#close, []), Future.value(null))
          as _i7.Future<void>);
  _i7.Future<int> readByte() =>
      (super.noSuchMethod(Invocation.method(#readByte, []), Future.value(0))
          as _i7.Future<int>);
  int readByteSync() =>
      (super.noSuchMethod(Invocation.method(#readByteSync, []), 0) as int);
  _i7.Future<_i5.Uint8List> read(int? bytes) => (super.noSuchMethod(
          Invocation.method(#read, [bytes]), Future.value(_FakeUint8List()))
      as _i7.Future<_i5.Uint8List>);
  _i5.Uint8List readSync(int? bytes) => (super
          .noSuchMethod(Invocation.method(#readSync, [bytes]), _FakeUint8List())
      as _i5.Uint8List);
  _i7.Future<int> readInto(List<int>? buffer, [int? start, int? end]) =>
      (super.noSuchMethod(Invocation.method(#readInto, [buffer, start, end]),
          Future.value(0)) as _i7.Future<int>);
  int readIntoSync(List<int>? buffer, [int? start, int? end]) =>
      (super.noSuchMethod(
          Invocation.method(#readIntoSync, [buffer, start, end]), 0) as int);
  _i7.Future<_i6.RandomAccessFile> writeByte(int? value) => (super.noSuchMethod(
          Invocation.method(#writeByte, [value]),
          Future.value(_FakeRandomAccessFile()))
      as _i7.Future<_i6.RandomAccessFile>);
  int writeByteSync(int? value) =>
      (super.noSuchMethod(Invocation.method(#writeByteSync, [value]), 0)
          as int);
  _i7.Future<_i6.RandomAccessFile> writeFrom(List<int>? buffer,
          [int? start, int? end]) =>
      (super.noSuchMethod(Invocation.method(#writeFrom, [buffer, start, end]),
              Future.value(_FakeRandomAccessFile()))
          as _i7.Future<_i6.RandomAccessFile>);
  void writeFromSync(List<int>? buffer, [int? start, int? end]) => super
      .noSuchMethod(Invocation.method(#writeFromSync, [buffer, start, end]));
  _i7.Future<_i6.RandomAccessFile> writeString(String? string,
          {_i15.Encoding? encoding}) =>
      (super.noSuchMethod(
              Invocation.method(#writeString, [string], {#encoding: encoding}),
              Future.value(_FakeRandomAccessFile()))
          as _i7.Future<_i6.RandomAccessFile>);
  void writeStringSync(String? string, {_i15.Encoding? encoding}) =>
      super.noSuchMethod(
          Invocation.method(#writeStringSync, [string], {#encoding: encoding}));
  _i7.Future<int> position() =>
      (super.noSuchMethod(Invocation.method(#position, []), Future.value(0))
          as _i7.Future<int>);
  int positionSync() =>
      (super.noSuchMethod(Invocation.method(#positionSync, []), 0) as int);
  _i7.Future<_i6.RandomAccessFile> setPosition(int? position) =>
      (super.noSuchMethod(Invocation.method(#setPosition, [position]),
              Future.value(_FakeRandomAccessFile()))
          as _i7.Future<_i6.RandomAccessFile>);
  void setPositionSync(int? position) =>
      super.noSuchMethod(Invocation.method(#setPositionSync, [position]));
  _i7.Future<_i6.RandomAccessFile> truncate(int? length) => (super.noSuchMethod(
          Invocation.method(#truncate, [length]),
          Future.value(_FakeRandomAccessFile()))
      as _i7.Future<_i6.RandomAccessFile>);
  void truncateSync(int? length) =>
      super.noSuchMethod(Invocation.method(#truncateSync, [length]));
  _i7.Future<int> length() =>
      (super.noSuchMethod(Invocation.method(#length, []), Future.value(0))
          as _i7.Future<int>);
  int lengthSync() =>
      (super.noSuchMethod(Invocation.method(#lengthSync, []), 0) as int);
  _i7.Future<_i6.RandomAccessFile> flush() => (super.noSuchMethod(
          Invocation.method(#flush, []), Future.value(_FakeRandomAccessFile()))
      as _i7.Future<_i6.RandomAccessFile>);
  _i7.Future<_i6.RandomAccessFile> lock(
          [_i6.FileLock? mode, int? start, int? end]) =>
      (super.noSuchMethod(Invocation.method(#lock, [mode, start, end]),
              Future.value(_FakeRandomAccessFile()))
          as _i7.Future<_i6.RandomAccessFile>);
  void lockSync([_i6.FileLock? mode, int? start, int? end]) =>
      super.noSuchMethod(Invocation.method(#lockSync, [mode, start, end]));
  _i7.Future<_i6.RandomAccessFile> unlock([int? start, int? end]) =>
      (super.noSuchMethod(Invocation.method(#unlock, [start, end]),
              Future.value(_FakeRandomAccessFile()))
          as _i7.Future<_i6.RandomAccessFile>);
  void unlockSync([int? start, int? end]) =>
      super.noSuchMethod(Invocation.method(#unlockSync, [start, end]));
}

/// A class which mocks [BinaryReader].
///
/// See the documentation for Mockito's code generation for more information.
class MockBinaryReader extends _i1.Mock implements _i3.BinaryReader {
  int get availableBytes =>
      (super.noSuchMethod(Invocation.getter(#availableBytes), 0) as int);
  int get usedBytes =>
      (super.noSuchMethod(Invocation.getter(#usedBytes), 0) as int);
  void skip(int? bytes) =>
      super.noSuchMethod(Invocation.method(#skip, [bytes]));
  int readByte() =>
      (super.noSuchMethod(Invocation.method(#readByte, []), 0) as int);
  _i5.Uint8List viewBytes(int? bytes) => (super.noSuchMethod(
          Invocation.method(#viewBytes, [bytes]), _FakeUint8List())
      as _i5.Uint8List);
  _i5.Uint8List peekBytes(int? bytes) => (super.noSuchMethod(
          Invocation.method(#peekBytes, [bytes]), _FakeUint8List())
      as _i5.Uint8List);
  int readWord() =>
      (super.noSuchMethod(Invocation.method(#readWord, []), 0) as int);
  int readInt32() =>
      (super.noSuchMethod(Invocation.method(#readInt32, []), 0) as int);
  int readUint32() =>
      (super.noSuchMethod(Invocation.method(#readUint32, []), 0) as int);
  int readInt() =>
      (super.noSuchMethod(Invocation.method(#readInt, []), 0) as int);
  double readDouble() =>
      (super.noSuchMethod(Invocation.method(#readDouble, []), 0.0) as double);
  bool readBool() =>
      (super.noSuchMethod(Invocation.method(#readBool, []), false) as bool);
  String readString(
          [int? byteCount,
          _i15.Converter<List<int>, String>? decoder =
              const _i15.Utf8Decoder()]) =>
      (super.noSuchMethod(
          Invocation.method(#readString, [byteCount, decoder]), '') as String);
  _i5.Uint8List readByteList([int? length]) => (super.noSuchMethod(
          Invocation.method(#readByteList, [length]), _FakeUint8List())
      as _i5.Uint8List);
  List<int> readIntList([int? length]) =>
      (super.noSuchMethod(Invocation.method(#readIntList, [length]), <int>[])
          as List<int>);
  List<double> readDoubleList([int? length]) => (super.noSuchMethod(
          Invocation.method(#readDoubleList, [length]), <double>[])
      as List<double>);
  List<bool> readBoolList([int? length]) =>
      (super.noSuchMethod(Invocation.method(#readBoolList, [length]), <bool>[])
          as List<bool>);
  List<String> readStringList(
          [int? length,
          _i15.Converter<List<int>, String>? decoder =
              const _i15.Utf8Decoder()]) =>
      (super.noSuchMethod(
              Invocation.method(#readStringList, [length, decoder]), <String>[])
          as List<String>);
  List<dynamic> readList([int? length]) =>
      (super.noSuchMethod(Invocation.method(#readList, [length]), <dynamic>[])
          as List<dynamic>);
  Map<dynamic, dynamic> readMap([int? length]) => (super.noSuchMethod(
          Invocation.method(#readMap, [length]), <dynamic, dynamic>{})
      as Map<dynamic, dynamic>);
  _i3.HiveList<_i4.HiveObject> readHiveList([int? length]) =>
      (super.noSuchMethod(Invocation.method(#readHiveList, [length]),
          _FakeHiveList<_i4.HiveObject>()) as _i3.HiveList<_i4.HiveObject>);
}

/// A class which mocks [BinaryWriter].
///
/// See the documentation for Mockito's code generation for more information.
class MockBinaryWriter extends _i1.Mock implements _i3.BinaryWriter {
  void writeByte(int? byte) =>
      super.noSuchMethod(Invocation.method(#writeByte, [byte]));
  void writeWord(int? value) =>
      super.noSuchMethod(Invocation.method(#writeWord, [value]));
  void writeInt32(int? value) =>
      super.noSuchMethod(Invocation.method(#writeInt32, [value]));
  void writeUint32(int? value) =>
      super.noSuchMethod(Invocation.method(#writeUint32, [value]));
  void writeInt(int? value) =>
      super.noSuchMethod(Invocation.method(#writeInt, [value]));
  void writeDouble(double? value) =>
      super.noSuchMethod(Invocation.method(#writeDouble, [value]));
  void writeBool(bool? value) =>
      super.noSuchMethod(Invocation.method(#writeBool, [value]));
  void writeString(String? value,
          {bool? writeByteCount = true,
          _i15.Converter<String, List<int>>? encoder =
              const _i15.Utf8Encoder()}) =>
      super.noSuchMethod(Invocation.method(#writeString, [value],
          {#writeByteCount: writeByteCount, #encoder: encoder}));
  void writeByteList(List<int>? bytes, {bool? writeLength = true}) =>
      super.noSuchMethod(Invocation.method(
          #writeByteList, [bytes], {#writeLength: writeLength}));
  void writeIntList(List<int>? list, {bool? writeLength = true}) =>
      super.noSuchMethod(Invocation.method(
          #writeIntList, [list], {#writeLength: writeLength}));
  void writeDoubleList(List<double>? list, {bool? writeLength = true}) =>
      super.noSuchMethod(Invocation.method(
          #writeDoubleList, [list], {#writeLength: writeLength}));
  void writeBoolList(List<bool>? list, {bool? writeLength = true}) =>
      super.noSuchMethod(Invocation.method(
          #writeBoolList, [list], {#writeLength: writeLength}));
  void writeStringList(List<String>? list,
          {bool? writeLength = true,
          _i15.Converter<String, List<int>>? encoder =
              const _i15.Utf8Encoder()}) =>
      super.noSuchMethod(Invocation.method(#writeStringList, [list],
          {#writeLength: writeLength, #encoder: encoder}));
  void writeList(List<dynamic>? list, {bool? writeLength = true}) =>
      super.noSuchMethod(
          Invocation.method(#writeList, [list], {#writeLength: writeLength}));
  void writeMap(Map<dynamic, dynamic>? map, {bool? writeLength = true}) =>
      super.noSuchMethod(
          Invocation.method(#writeMap, [map], {#writeLength: writeLength}));
  void writeHiveList(_i3.HiveList<_i4.HiveObjectMixin>? list,
          {bool? writeLength = true}) =>
      super.noSuchMethod(Invocation.method(
          #writeHiveList, [list], {#writeLength: writeLength}));
  void write<T>(T? value, {bool? writeTypeId = true}) => super.noSuchMethod(
      Invocation.method(#write, [value], {#writeTypeId: writeTypeId}));
}

/// A class which mocks [File].
///
/// See the documentation for Mockito's code generation for more information.
class MockFile extends _i1.Mock implements _i6.File {
  _i6.File get absolute =>
      (super.noSuchMethod(Invocation.getter(#absolute), _FakeFile())
          as _i6.File);
  String get path =>
      (super.noSuchMethod(Invocation.getter(#path), '') as String);
  _i7.Future<_i6.File> create({bool? recursive}) => (super.noSuchMethod(
      Invocation.method(#create, [], {#recursive: recursive}),
      Future.value(_FakeFile())) as _i7.Future<_i6.File>);
  void createSync({bool? recursive}) => super.noSuchMethod(
      Invocation.method(#createSync, [], {#recursive: recursive}));
  _i7.Future<_i6.File> rename(String? newPath) => (super.noSuchMethod(
          Invocation.method(#rename, [newPath]), Future.value(_FakeFile()))
      as _i7.Future<_i6.File>);
  _i6.File renameSync(String? newPath) => (super.noSuchMethod(
      Invocation.method(#renameSync, [newPath]), _FakeFile()) as _i6.File);
  _i7.Future<_i6.File> copy(String? newPath) => (super.noSuchMethod(
          Invocation.method(#copy, [newPath]), Future.value(_FakeFile()))
      as _i7.Future<_i6.File>);
  _i6.File copySync(String? newPath) =>
      (super.noSuchMethod(Invocation.method(#copySync, [newPath]), _FakeFile())
          as _i6.File);
  _i7.Future<int> length() =>
      (super.noSuchMethod(Invocation.method(#length, []), Future.value(0))
          as _i7.Future<int>);
  int lengthSync() =>
      (super.noSuchMethod(Invocation.method(#lengthSync, []), 0) as int);
  _i7.Future<DateTime> lastAccessed() => (super.noSuchMethod(
          Invocation.method(#lastAccessed, []), Future.value(_FakeDateTime()))
      as _i7.Future<DateTime>);
  DateTime lastAccessedSync() => (super.noSuchMethod(
      Invocation.method(#lastAccessedSync, []), _FakeDateTime()) as DateTime);
  _i7.Future<dynamic> setLastAccessed(DateTime? time) => (super.noSuchMethod(
          Invocation.method(#setLastAccessed, [time]), Future.value(null))
      as _i7.Future<dynamic>);
  void setLastAccessedSync(DateTime? time) =>
      super.noSuchMethod(Invocation.method(#setLastAccessedSync, [time]));
  _i7.Future<DateTime> lastModified() => (super.noSuchMethod(
          Invocation.method(#lastModified, []), Future.value(_FakeDateTime()))
      as _i7.Future<DateTime>);
  DateTime lastModifiedSync() => (super.noSuchMethod(
      Invocation.method(#lastModifiedSync, []), _FakeDateTime()) as DateTime);
  _i7.Future<dynamic> setLastModified(DateTime? time) => (super.noSuchMethod(
          Invocation.method(#setLastModified, [time]), Future.value(null))
      as _i7.Future<dynamic>);
  void setLastModifiedSync(DateTime? time) =>
      super.noSuchMethod(Invocation.method(#setLastModifiedSync, [time]));
  _i7.Future<_i6.RandomAccessFile> open({_i6.FileMode? mode}) =>
      (super.noSuchMethod(Invocation.method(#open, [], {#mode: mode}),
              Future.value(_FakeRandomAccessFile()))
          as _i7.Future<_i6.RandomAccessFile>);
  _i6.RandomAccessFile openSync({_i6.FileMode? mode}) => (super.noSuchMethod(
      Invocation.method(#openSync, [], {#mode: mode}),
      _FakeRandomAccessFile()) as _i6.RandomAccessFile);
  _i7.Stream<List<int>> openRead([int? start, int? end]) => (super.noSuchMethod(
          Invocation.method(#openRead, [start, end]), Stream<List<int>>.empty())
      as _i7.Stream<List<int>>);
  _i6.IOSink openWrite({_i6.FileMode? mode, _i15.Encoding? encoding}) =>
      (super.noSuchMethod(
          Invocation.method(#openWrite, [], {#mode: mode, #encoding: encoding}),
          _FakeIOSink()) as _i6.IOSink);
  _i7.Future<_i5.Uint8List> readAsBytes() => (super.noSuchMethod(
          Invocation.method(#readAsBytes, []), Future.value(_FakeUint8List()))
      as _i7.Future<_i5.Uint8List>);
  _i5.Uint8List readAsBytesSync() => (super.noSuchMethod(
          Invocation.method(#readAsBytesSync, []), _FakeUint8List())
      as _i5.Uint8List);
  _i7.Future<String> readAsString({_i15.Encoding? encoding}) =>
      (super.noSuchMethod(
          Invocation.method(#readAsString, [], {#encoding: encoding}),
          Future.value('')) as _i7.Future<String>);
  String readAsStringSync({_i15.Encoding? encoding}) => (super.noSuchMethod(
          Invocation.method(#readAsStringSync, [], {#encoding: encoding}), '')
      as String);
  _i7.Future<List<String>> readAsLines({_i15.Encoding? encoding}) =>
      (super.noSuchMethod(
          Invocation.method(#readAsLines, [], {#encoding: encoding}),
          Future.value(<String>[])) as _i7.Future<List<String>>);
  List<String> readAsLinesSync({_i15.Encoding? encoding}) =>
      (super.noSuchMethod(
          Invocation.method(#readAsLinesSync, [], {#encoding: encoding}),
          <String>[]) as List<String>);
  _i7.Future<_i6.File> writeAsBytes(List<int>? bytes,
          {_i6.FileMode? mode, bool? flush}) =>
      (super.noSuchMethod(
          Invocation.method(
              #writeAsBytes, [bytes], {#mode: mode, #flush: flush}),
          Future.value(_FakeFile())) as _i7.Future<_i6.File>);
  void writeAsBytesSync(List<int>? bytes, {_i6.FileMode? mode, bool? flush}) =>
      super.noSuchMethod(Invocation.method(
          #writeAsBytesSync, [bytes], {#mode: mode, #flush: flush}));
  _i7.Future<_i6.File> writeAsString(String? contents,
          {_i6.FileMode? mode, _i15.Encoding? encoding, bool? flush}) =>
      (super.noSuchMethod(
          Invocation.method(#writeAsString, [contents],
              {#mode: mode, #encoding: encoding, #flush: flush}),
          Future.value(_FakeFile())) as _i7.Future<_i6.File>);
  void writeAsStringSync(String? contents,
          {_i6.FileMode? mode, _i15.Encoding? encoding, bool? flush}) =>
      super.noSuchMethod(Invocation.method(#writeAsStringSync, [contents],
          {#mode: mode, #encoding: encoding, #flush: flush}));
  _i7.Future<_i6.FileSystemEntity> delete({bool recursive = false}) =>
      (super.noSuchMethod(
          Invocation.method(#delete, [], {#recursive: recursive}),
          Future.value(_FakeFile())) as _i7.Future<_i6.FileSystemEntity>);
}

/// A class which mocks [FrameIoHelper].
///
/// See the documentation for Mockito's code generation for more information.
class MockFrameIoHelper extends _i1.Mock implements _i16.FrameIoHelper {
  _i7.Future<_i6.RandomAccessFile> openFile(String? path) =>
      (super.noSuchMethod(Invocation.method(#openFile, [path]),
              Future.value(_FakeRandomAccessFile()))
          as _i7.Future<_i6.RandomAccessFile>);
  _i7.Future<List<int>> readFile(String? path) => (super.noSuchMethod(
          Invocation.method(#readFile, [path]), Future.value(<int>[]))
      as _i7.Future<List<int>>);
  _i7.Future<int> keysFromFile(String? path, _i11.Keystore<dynamic>? keystore,
          _i3.HiveCipher? cipher) =>
      (super.noSuchMethod(
          Invocation.method(#keysFromFile, [path, keystore, cipher]),
          Future.value(0)) as _i7.Future<int>);
  _i7.Future<int> framesFromFile(String? path, _i11.Keystore<dynamic>? keystore,
          _i3.TypeRegistry? registry, _i3.HiveCipher? cipher) =>
      (super.noSuchMethod(
          Invocation.method(
              #framesFromFile, [path, keystore, registry, cipher]),
          Future.value(0)) as _i7.Future<int>);
  int framesFromBytes(_i5.Uint8List? bytes, _i11.Keystore<dynamic>? keystore,
          _i3.TypeRegistry? registry, _i3.HiveCipher? cipher) =>
      (super.noSuchMethod(
          Invocation.method(
              #framesFromBytes, [bytes, keystore, registry, cipher]),
          0) as int);
}
