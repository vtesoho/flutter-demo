import 'dart:async';

import 'package:flutter/services.dart';

class FlutterIostest {
  static const MethodChannel _channel =
      const MethodChannel('flutter_iostest');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
