/*
=============
Author: Lucas Josino
Github: https://github.com/LucasPJS
Website: https://lucasjosino.com/
=============
Plugin/Id: on_audio_query#0
Homepage: https://github.com/LucasPJS/on_audio_query
Pub: https://pub.dev/packages/on_audio_query
License: https://github.com/LucasPJS/on_audio_query/blob/main/LICENSE
Copyright: © 2021, Lucas Josino. All rights reserved.
=============
*/

library on_audio_query;

//
import 'dart:async';
import 'dart:typed_data';

//Dart/Flutter
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//Platform Interface
import 'package:on_audio_query_platform_interface/details/on_audio_query_helper.dart';
import 'package:on_audio_query_platform_interface/on_audio_query_platform_interface.dart';

//
export 'package:on_audio_query_platform_interface/details/on_audio_query_helper.dart';

//Controller
part 'details/on_audio_query_controller.dart';

//Widget
part 'widget/query_artwork_widget.dart';