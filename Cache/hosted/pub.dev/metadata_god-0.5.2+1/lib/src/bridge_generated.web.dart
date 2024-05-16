// AUTO GENERATED FILE, DO NOT EDIT.
// Generated by `flutter_rust_bridge`@ 1.82.1.
// ignore_for_file: non_constant_identifier_names, unused_element, duplicate_ignore, directives_ordering, curly_braces_in_flow_control_structures, unnecessary_lambdas, slash_for_doc_comments, prefer_const_literals_to_create_immutables, implicit_dynamic_list_literal, duplicate_import, unused_import, unnecessary_import, prefer_single_quotes, prefer_const_constructors, use_super_parameters, always_use_package_imports, annotate_overrides, invalid_use_of_protected_member, constant_identifier_names, invalid_use_of_internal_member, prefer_is_empty, unnecessary_const

import 'dart:convert';
import 'dart:async';
import 'package:meta/meta.dart';
import 'package:flutter_rust_bridge/flutter_rust_bridge.dart';
import 'package:uuid/uuid.dart';
import 'bridge_generated.dart';
export 'bridge_generated.dart';

class MetadataGodPlatform extends FlutterRustBridgeBase<MetadataGodWire> with FlutterRustBridgeSetupMixin {
  MetadataGodPlatform(FutureOr<WasmModule> dylib) : super(MetadataGodWire(dylib)) {
    setupMixinConstructor();
  }
  Future<void> setup() => inner.init;

// Section: api2wire

  @protected
  String api2wire_String(String raw) {
    return raw;
  }

  @protected
  double api2wire_box_autoadd_f64(double raw) {
    return api2wire_f64(raw);
  }

  @protected
  int api2wire_box_autoadd_i32(int raw) {
    return api2wire_i32(raw);
  }

  @protected
  List<dynamic> api2wire_box_autoadd_metadata(Metadata raw) {
    return api2wire_metadata(raw);
  }

  @protected
  List<dynamic> api2wire_box_autoadd_picture(Picture raw) {
    return api2wire_picture(raw);
  }

  @protected
  int api2wire_box_autoadd_u16(int raw) {
    return api2wire_u16(raw);
  }

  @protected
  Object api2wire_box_autoadd_u64(int raw) {
    return api2wire_u64(raw);
  }

  @protected
  List<dynamic> api2wire_metadata(Metadata raw) {
    return [
      api2wire_opt_String(raw.title),
      api2wire_opt_box_autoadd_f64(raw.durationMs),
      api2wire_opt_String(raw.artist),
      api2wire_opt_String(raw.album),
      api2wire_opt_String(raw.albumArtist),
      api2wire_opt_box_autoadd_u16(raw.trackNumber),
      api2wire_opt_box_autoadd_u16(raw.trackTotal),
      api2wire_opt_box_autoadd_u16(raw.discNumber),
      api2wire_opt_box_autoadd_u16(raw.discTotal),
      api2wire_opt_box_autoadd_i32(raw.year),
      api2wire_opt_String(raw.genre),
      api2wire_opt_box_autoadd_picture(raw.picture),
      api2wire_opt_box_autoadd_u64(raw.fileSize)
    ];
  }

  @protected
  String? api2wire_opt_String(String? raw) {
    return raw == null ? null : api2wire_String(raw);
  }

  @protected
  double? api2wire_opt_box_autoadd_f64(double? raw) {
    return raw == null ? null : api2wire_box_autoadd_f64(raw);
  }

  @protected
  int? api2wire_opt_box_autoadd_i32(int? raw) {
    return raw == null ? null : api2wire_box_autoadd_i32(raw);
  }

  @protected
  List<dynamic>? api2wire_opt_box_autoadd_picture(Picture? raw) {
    return raw == null ? null : api2wire_box_autoadd_picture(raw);
  }

  @protected
  int? api2wire_opt_box_autoadd_u16(int? raw) {
    return raw == null ? null : api2wire_box_autoadd_u16(raw);
  }

  @protected
  Object? api2wire_opt_box_autoadd_u64(int? raw) {
    return raw == null ? null : api2wire_box_autoadd_u64(raw);
  }

  @protected
  List<dynamic> api2wire_picture(Picture raw) {
    return [
      api2wire_String(raw.mimeType),
      api2wire_uint_8_list(raw.data)
    ];
  }

  @protected
  Object api2wire_u64(int raw) {
    return castNativeBigInt(raw);
  }

  @protected
  Uint8List api2wire_uint_8_list(Uint8List raw) {
    return raw;
  }
// Section: finalizer
}

// Section: WASM wire module

@JS('wasm_bindgen')
external MetadataGodWasmModule get wasmModule;

@JS()
@anonymous
class MetadataGodWasmModule implements WasmModule {
  external Object /* Promise */ call([String? moduleName]);
  external MetadataGodWasmModule bind(dynamic thisArg, String moduleName);
  external dynamic /* void */ wire_read_metadata(NativePortType port_, String file);

  external dynamic /* void */ wire_write_metadata(NativePortType port_, String file, List<dynamic> metadata);
}

// Section: WASM wire connector

class MetadataGodWire extends FlutterRustBridgeWasmWireBase<MetadataGodWasmModule> {
  MetadataGodWire(FutureOr<WasmModule> module) : super(WasmModule.cast<MetadataGodWasmModule>(module));

  void wire_read_metadata(NativePortType port_, String file) => wasmModule.wire_read_metadata(port_, file);

  void wire_write_metadata(NativePortType port_, String file, List<dynamic> metadata) => wasmModule.wire_write_metadata(port_, file, metadata);
}