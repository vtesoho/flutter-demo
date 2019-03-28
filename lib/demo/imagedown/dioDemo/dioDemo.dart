// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:io';
// import 'package:dio/dio.dart';
// import 'package:path_provider/path_provider.dart';
// class dioDemo extends StatelessWidget {

//   localFile() async {
//     var file = File('/data/user/0/com.example.fluttershuachi/app_flutter/book1.jpg');
//     // String str = await file.readAsString();
    
//     return file.readAsBytes();
//   }

//   Future download1(Dio dio, String url, savePath) async {
//   try {
//     await dio.download(
//       url,
//       savePath,
//       onReceiveProgress: showDownloadProgress,
//     );
//   } catch (e) {
//     print(e);
//   }
// }

//   downfile ()async {
//     final dir = await getApplicationDocumentsDirectory();
    
//     Dio dio = new Dio();
//     dio.interceptors.add(LogInterceptor());
//     var url = "http://a.hiphotos.baidu.com/image/pic/item/30adcbef76094b3624c1f1e8adcc7cd98d109d60.jpg";
//     // final dir = await getApplicationDocumentsDirectory();
//     print(dir.path);
//     await download1(dio, url, (HttpHeaders headers)=>"/data/user/0/com.example.fluttershuachi/app_flutter/book1.jpg");

//     // var response = await dio.download("https://www.baidu.com/img/bd_logo1.png", "${dir.path}/bd_logo1.png");
//     // print(response);
//   }


//   void showDownloadProgress(received, total) {
//     if (total != -1) {
//       print((received / total * 100).toStringAsFixed(0) + "%");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('down'),
//       ),
//       body: Container(
//       child: Column(
//         children: <Widget>[
//           IconButton(
//             icon: Icon(Icons.ac_unit),
//             onPressed: () {
//               print('下载图片');
//               downfile();
//             },
//           ),
//           IconButton(
//             icon: Icon(Icons.ac_unit),
//             onPressed: () {
//               print('查看图片');
//               print(localFile());
//             },
//           ),
//         ],
//       ),
//       ),
//     );
//   }
// }