import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

enum status {
  done,
  down,
  not,
}

class FontManage{
  factory FontManage() =>_getInstance();
  static FontManage get instance => _getInstance();
  static FontManage _instance;
  FontManage._internal() {
    // 初始化
    examineFont();
  }
  static FontManage _getInstance() {
    if (_instance == null) {
      _instance = FontManage._internal();
    }
    return _instance;
  }

  
  //用到的字体列表
  Map ttfList = {
    'putM': {
      'name':'Alibaba-PuHuiTi-Medium',
      'ttf':'Alibaba-PuHuiTi-Medium.ttf',
      'exist': false,
      'status': status.not,
    },
    'putB': {
      'name':'Alibaba-PuHuiTi-Bold',
      'ttf':'Alibaba-PuHuiTi-Bold.ttf',
      'exist': false,
      'status': status.not,
    }
  };
  
  String catalogue = 'fontDownload';   //存储字体目录

  get getTtfList {
    return ttfList;
  }


  //使用字体
  Future<String> useFont(fontName) async{
    String cachePath = await getFilePath();
    bool exist;
    exist = await isDirectoryExist('${cachePath}/${catalogue}/${fontName}.ttf');
    if(!exist){
      await downloadAloneFont(fontName);
    }
    return ttfList[fontName]['name'];
  }




  //检查字体列表中的字体是否存在并做处理
  void examineFont() async{
    ttfList.map((key,val){
      downloadAloneFont(key).then((onValue){
        ttfList[key]['status'] = status.done;
      });
    });
  }

  //单下载某种字体方法
  Future<bool> downloadAloneFont(name) async {
    if(ttfList[name]['status'] == status.down){
      return false;
    }
    String cachePath;
    bool exist;
    String url;
    String savePath;
    String ttfname = '${ttfList[name]['ttf']}';
    cachePath = await getFilePath();
    exist = await isDirectoryExist('${cachePath}/${catalogue}/${ttfname}');
    if(exist) {
      print('ture ---------- ${cachePath}/${catalogue}/${ttfname}');
      return true;
    }else{
      print('fasle ---------- ${cachePath}/${catalogue}/${ttfname}');
      url = 'https://debug.shuachi.com/apk/${ttfname}';
      savePath = '${cachePath}/${catalogue}/${ttfname}';
      ttfList[name]['status'] = status.down;
      await downloadFont(cachePath,savePath,url);
      ttfList[name]['exist'] = true;
      ttfList[name]['status'] = status.done;
      return true;
    }
  }  


  Future<bool> downloadFont(cachePath,savePath,url) async {
    bool exist = await isDirectoryExist(cachePath);
    if(!exist){
      await createDirectory(cachePath);
    }
    OnDownloadProgress onDownloadProgress = (int received, int total) {
      double progress = received / total;
      checkProgress(progress, savePath);
    };
    Dio dio = new Dio();
    await dio.download(url, savePath, onProgress: onDownloadProgress);
    print('donw done -------------');
    return true;
  }

  void checkProgress(double progress, String savePath) async {
    if (progress == 1) {
      // complete = true;
      // downloadProgress = 'success';
      print(savePath);
      // await readFont(savePath);
    }
  }
  
  //创建目录
  Future<void> createDirectory(String path) async {
    Directory directory = Directory(path);
    directory.create();
  }

  //字体
  Future<void> readFont(String fontPath) async {
    var fontLoader = FontLoader("Alibaba-PuHuiTi-Bold");
    fontLoader.addFont(getCustomFont(fontPath));
    await fontLoader.load();
  }

  //读取字体
  Future<ByteData> getCustomFont(String fontPath) async {
    ByteData byteData = await rootBundle.load(fontPath);
    return byteData;
  }

  //检查字体是否存在
  Future<bool> isDirectoryExist(String path) async{
    File file = File(path);
    return await file.exists();
  }

  //获取app缓存目录
  Future<String> getFilePath() async {
    var directory = await getTemporaryDirectory();
    print('----------------------${directory.path}');
    return directory.path;
  }



}