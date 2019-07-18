import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;

class ImageTailor {
  static const MethodChannel _channel =
      const MethodChannel('image_tailor');

  // static Future<String> get platformVersion async {
  //   final String version = await _channel.invokeMethod('getPlatformVersion');
  //   return version;
  // }

  static get finish async {
    await _channel.invokeMethod('finish');
  }


  Future<dynamic> selectImg({
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
    var path = await _localPath;
    var filePath;
    var time= new DateTime.now().microsecondsSinceEpoch;
    var picList = [];
    var filename;
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
    if(Platform.isIOS){
      
      for (var i = 0; i < items.length; i++) {
        
        filename = generateMd5('${time}${i}');
        filePath = '$path/tmp/${filename}';
        print('------------${filePath}');
        new File(filePath).writeAsBytesSync(items[i]);
        picList.add(filePath);
      }   
    }
    print("--------------------${picList}");
    return items;
  }

  Future<String> get _localPath async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }


  generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  } 


}
