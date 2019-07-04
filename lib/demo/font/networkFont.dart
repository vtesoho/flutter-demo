import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class FontDownDemo extends StatefulWidget {
  FontDownDemo({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FontDownDemoState createState() => _FontDownDemoState();
}

class _FontDownDemoState extends State<FontDownDemo> {
  String downloadProgress = "0.0";
  bool complete = false;

  @override
  Widget build(BuildContext context) {
    final textStyle = complete
        ? TextStyle(
            fontSize: 20,
            fontFamily: 'Alibaba-PuHuiTi-Bold',
            // fontWeight: FontWeight.bold,
            color: Colors.black,
          )
        : TextStyle(
            fontSize: 20,
            // fontWeight: FontWeight.normal,
            color: Colors.black,
          );
    final textStylea = TextStyle(
            fontSize: 20,
            // fontWeight: FontWeight.bold,
            color: Colors.black,
          );

    return Scaffold(
      appBar: AppBar(
        title: Text('networkFont'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '测试字体测试字体测试字体测试字体测试字体测试字体测试字体',
              style: textStyle,
            ),
            Text(
              '测试字体测试字体测试字体测试字体测试字体测试字体测试字体',
              style: textStylea,
            ),
            Text(
              'download Progress:',
            ),
            Text(
              downloadProgress,
              style: textStyle,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: downloadFont,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<bool> isDirectoryExist(String path) async{
    File file = File(path);
    return await file.exists();
  }

  Future<void> createDirectory(String path) async {
    Directory directory = Directory(path);
    directory.create();
  }
  void downloadFonta() async {
    print('start');
    var downUrl = await DefaultCacheManager().downloadFile('https://debug.shuachi.com/apk/Alibaba-PuHuiTi-Regular.ttf');
    print(downUrl.file);
    // item['path'] = (downUrl.file).toString().split("'")[1],
  }

  void downloadFont() async {
    File txt=File('/data/user/0/com.example.fluttershuachi/cache/fontDownloadDemo/Alibaba-PuHuiTi-Bold.ttf');

    var dir_bool=await txt.exists(); //返回真假 
    print(dir_bool);
    return ;


    String url = 'https://debug.shuachi.com/apk/Alibaba-PuHuiTi-Bold.ttf';
    String savePath = "/data/user/0/com.example.fluttershuachi/cache/fontDownloadDemo";
    bool exist = await isDirectoryExist(savePath);
    if(!exist){
      await createDirectory(savePath);
    }
    String fontPath = "$savePath/Alibaba-PuHuiTi-Bold.ttf";
    OnDownloadProgress onDownloadProgress = (int received, int total) {
      double progress = received / total;
      downloadProgress = '$progress';
      checkProgress(progress, fontPath);
    };

    Dio dio = new Dio();
    await dio.download(url, fontPath, onProgress: onDownloadProgress);
  }

  void checkProgress(double progress, String savePath) async {
    if (progress == 1) {
      complete = true;
      downloadProgress = 'success';
      print(savePath);
      await readFont(savePath);
    }
    setState(() {});
  }

  //已经保存，独立更换
  updataFont(){
    readFont('');
  }

  Future<void> readFont(String path) async {
    var fontLoader = FontLoader("Alibaba-PuHuiTi-Bold");
    fontLoader.addFont(getCustomFont(path));
    await fontLoader.load();
  }

  Future<ByteData> getCustomFont(String path) async {
    ByteData byteData = await rootBundle.load(path);
    return byteData;
  }
}