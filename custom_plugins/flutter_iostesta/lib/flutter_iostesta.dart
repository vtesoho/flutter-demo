import 'dart:async';

import 'package:flutter/services.dart';

class FlutterIostesta {
  static const MethodChannel _channel =
      const MethodChannel('flutter_iostesta');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
