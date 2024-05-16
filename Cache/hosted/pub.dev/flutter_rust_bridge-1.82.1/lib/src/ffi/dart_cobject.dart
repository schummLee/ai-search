import 'dart:convert';
import 'dart:ffi' as ffi;
import 'dart:ffi';
export 'dart:ffi' show NativePort, DynamicLibrary;
import 'dart:typed_data';
import 'dart_native_api.dart';
export 'dart_native_api.dart' show Dart_CObject;

extension DartCObjectExt on Dart_CObject {
  dynamic intoDart() {
    switch (type) {
      case Dart_CObject_Type.Dart_CObject_kNull:
        return null;
      case Dart_CObject_Type.Dart_CObject_kBool:
        return value.as_bool;
      case Dart_CObject_Type.Dart_CObject_kInt32:
        return value.as_int32;
      case Dart_CObject_Type.Dart_CObject_kInt64:
        return value.as_int64;
      case Dart_CObject_Type.Dart_CObject_kDouble:
        return value.as_double;

      case Dart_CObject_Type.Dart_CObject_kString:
        // `DartCObject` strings being encoded with std::ffi::CString assert us nul-termination.
        // See [allo-isolate's String::into_dart](https://github.com/sunshine-protocol/allo-isolate/blob/71b9760993d64ef46794176ca276d1cc637b2599/src/into_dart.rs#L106)
        // and [std::ffi::CString](https://doc.rust-lang.org/nightly/std/ffi/struct.CString.html)
        int len = 0;
        while (value.as_string.elementAt(len).value != 0) {
          len++;
        }
        return utf8.decode(value.as_string.cast<ffi.Uint8>().asTypedList(len));

      case Dart_CObject_Type.Dart_CObject_kArray:
        return List.generate(value.as_array.length,
            (i) => value.as_array.values.elementAt(i).value.ref.intoDart());

      case Dart_CObject_Type.Dart_CObject_kTypedData:
        return _typedDataIntoDart(
          value.as_typed_data.type,
          value.as_typed_data.values,
          value.as_typed_data.length,
        ).clone();

      case Dart_CObject_Type.Dart_CObject_kExternalTypedData:
        final externalTypedData = _typedDataIntoDart(
          value.as_external_typed_data.type,
          value.as_external_typed_data.data,
          value.as_external_typed_data.length,
        ).view;
        _externalTypedDataFinalizer.attach(
          externalTypedData,
          // Copy the cleanup info into a finalization token:
          // `value`'s underlying memory will probably be freed
          // before the zero-copy finalizer is called.
          _ExternalTypedDataFinalizerArgs(
            length: value.as_external_typed_data.length,
            peer: value.as_external_typed_data.peer,
            callback: value.as_external_typed_data.callback
                .cast<ffi.NativeFunction<NativeExternalTypedDataFinalizer>>(),
          ),
        );
        return externalTypedData;

      case Dart_CObject_Type.Dart_CObject_kSendPort:
      case Dart_CObject_Type.Dart_CObject_kCapability:
      case Dart_CObject_Type.Dart_CObject_kNativePointer:
      case Dart_CObject_Type.Dart_CObject_kUnsupported:
      case Dart_CObject_Type.Dart_CObject_kNumberOfTypes:
      default:
        throw Exception("Can't read invalid data type $type");
    }
  }

  static _TypedData _typedDataIntoDart(
    int ty,
    ffi.Pointer<ffi.Uint8> typedValues,
    int nValues,
  ) {
    switch (ty) {
      case Dart_TypedData_Type.Dart_TypedData_kByteData:
        return _TypedData<ByteData>(
          ByteData.view(
            typedValues.cast<ffi.Uint8>().asTypedList(nValues).buffer,
          ),
          (view) => ByteData.view(
            Uint8List.fromList(view.buffer.asUint8List()).buffer,
          ),
        );
      case Dart_TypedData_Type.Dart_TypedData_kInt8:
        final view = typedValues.cast<ffi.Int8>().asTypedList(nValues);
        return _TypedData<Int8List>(view, Int8List.fromList);
      case Dart_TypedData_Type.Dart_TypedData_kUint8:
        final view = typedValues.cast<ffi.Uint8>().asTypedList(nValues);
        return _TypedData<Uint8List>(view, Uint8List.fromList);
      case Dart_TypedData_Type.Dart_TypedData_kInt16:
        final view = typedValues.cast<ffi.Int16>().asTypedList(nValues);
        return _TypedData<Int16List>(view, Int16List.fromList);
      case Dart_TypedData_Type.Dart_TypedData_kUint16:
        final view = typedValues.cast<ffi.Uint16>().asTypedList(nValues);
        return _TypedData<Uint16List>(view, Uint16List.fromList);
      case Dart_TypedData_Type.Dart_TypedData_kInt32:
        final view = typedValues.cast<ffi.Int32>().asTypedList(nValues);
        return _TypedData<Int32List>(view, Int32List.fromList);
      case Dart_TypedData_Type.Dart_TypedData_kUint32:
        final view = typedValues.cast<ffi.Uint32>().asTypedList(nValues);
        return _TypedData<Uint32List>(view, Uint32List.fromList);
      case Dart_TypedData_Type.Dart_TypedData_kInt64:
        final view = typedValues.cast<ffi.Int64>().asTypedList(nValues);
        return _TypedData<Int64List>(view, Int64List.fromList);
      case Dart_TypedData_Type.Dart_TypedData_kUint64:
        final view = typedValues.cast<ffi.Uint64>().asTypedList(nValues);
        return _TypedData<Uint64List>(view, Uint64List.fromList);
      case Dart_TypedData_Type.Dart_TypedData_kFloat32:
        final view = typedValues.cast<ffi.Float>().asTypedList(nValues);
        return _TypedData<Float32List>(view, Float32List.fromList);
      case Dart_TypedData_Type.Dart_TypedData_kFloat64:
        final view = typedValues.cast<ffi.Double>().asTypedList(nValues);
        return _TypedData<Float64List>(view, Float64List.fromList);

      case Dart_TypedData_Type.Dart_TypedData_kUint8Clamped:
      case Dart_TypedData_Type.Dart_TypedData_kFloat32x4:
      case Dart_TypedData_Type.Dart_TypedData_kInvalid:
      default:
        throw Exception("Can't read invalid typed data type $ty");
    }
  }

  static final _externalTypedDataFinalizer =
      Finalizer<_ExternalTypedDataFinalizerArgs>((externalTypedData) {
    final handleFinalizer =
        externalTypedData.callback.asFunction<DartExternalTypedDataFinalizer>();
    handleFinalizer(externalTypedData.length, externalTypedData.peer);

    if (bool.fromEnvironment("ENABLE_FRB_FFI_TEST_TOOL")) {
      for (var handler in testTool!.onExternalTypedDataFinalizer) {
        handler(externalTypedData.length);
      }
    }
  });
}

class _TypedData<T> {
  final T view;
  final T Function(T) _cloneView;
  _TypedData(this.view, this._cloneView);

  T clone() => _cloneView(view);
}

class _ExternalTypedDataFinalizerArgs {
  final int length;
  final ffi.Pointer<ffi.Void> peer;
  final ffi.Pointer<ffi.NativeFunction<NativeExternalTypedDataFinalizer>>
      callback;

  _ExternalTypedDataFinalizerArgs({
    required this.length,
    required this.peer,
    required this.callback,
  });
}

typedef NativeExternalTypedDataFinalizer = ffi.Void Function(
    ffi.IntPtr, ffi.Pointer<ffi.Void>);
typedef DartExternalTypedDataFinalizer = void Function(
    int, ffi.Pointer<ffi.Void>);

class TestTool {
  final Set<void Function(int)> onExternalTypedDataFinalizer = {};
  TestTool._();
}

final testTool =
    bool.fromEnvironment("ENABLE_FRB_FFI_TEST_TOOL") ? TestTool._() : null;
