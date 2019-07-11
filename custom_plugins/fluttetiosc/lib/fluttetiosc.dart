import 'dart:async';

import 'package:flutter/services.dart';

class Fluttetiosc {
  static const MethodChannel _channel =
      const MethodChannel('fluttetiosc');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> get testview async {
    final String version = await _channel.invokeMethod('testview');
    return version;
  }
}
