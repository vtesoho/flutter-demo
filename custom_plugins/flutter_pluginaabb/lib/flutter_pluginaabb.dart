import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPluginaabb {
  static const MethodChannel _channel =
      const MethodChannel('flutter_pluginaabb');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
