import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
class dioDemo extends StatelessWidget {



  Future download1(Dio dio, String url, savePath) async {
  try {
    await dio.download(
      url,
      savePath,
      onReceiveProgress: showDownloadProgress,
    );
  } catch (e) {
    print(e);
  }
}

  downfile ()async {
    final dir = await getApplicationDocumentsDirectory();
    Dio dio = new Dio();
    dio.interceptors.add(LogInterceptor());
    var url = "https://www.baidu.com/img/bd_logo1.png";
    // final dir = await getApplicationDocumentsDirectory();
    // print(dir);
    await download1(dio, url, (HttpHeaders headers)=>"/data/user/axx/book1.png");

    // var response = await dio.download("https://www.baidu.com/img/bd_logo1.png", "${dir.path}/bd_logo1.png");
    // print(response);
  }


  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('down'),
      ),
      body: Container(
      child: IconButton(
          icon: Icon(Icons.ac_unit),
          onPressed: () {
            print('下载图片');
            downfile();
          },
        ),
      ),
    );
  }
}