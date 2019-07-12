import 'dart:async';

import 'package:flutter/services.dart';

class ImageTailor {
  static const MethodChannel _channel =
      const MethodChannel('image_tailor');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }


  static image() async{
    var content = "sdfsdf";
    final channel = const MethodChannel('channel:Chenli');

    final String nativeSay = await channel.invokeMethod('ChenliShareFile', content);
    print("$nativeSay");
  }


}
