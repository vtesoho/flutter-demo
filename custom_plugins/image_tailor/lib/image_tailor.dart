import 'dart:async';

import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

class ImageTailor {
  static const MethodChannel _channel =
      const MethodChannel('image_tailor');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static get finish async {
    await _channel.invokeMethod('finish');
  }


  static Future<dynamic> selectImg({
    @required int maxImages,
    int width = 800,
    int height = 600,
    bool videos = false,
    double quality = 0.5,
    bool onlySquare = false,
    String colour = "#FF9900",
    String text = "#FFFFFF",
    bool closeOnLimitReached = false,
  }) async {
    assert(maxImages != null);

    if (maxImages != null && maxImages < 0) {
      throw new ArgumentError.value(maxImages, 'maxImages cannot be negative');
    }

    final dynamic items =
        await _channel.invokeMethod('selectImg', <String, dynamic>{
      "onlySquare": onlySquare,
      "maxImages": maxImages,
      "width": width,
      "height": height,
      "quality": quality,
      "videos": videos,
      "androidOptions": {},
      "selectedAssets": [],
      "colour": colour,
      "text": text,
      "closeOnLimitReached": closeOnLimitReached,
    });

    return items;
  }
}
