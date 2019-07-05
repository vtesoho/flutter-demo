import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:fluttershuachi/demo/font/fontClass.dart';
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
  String puhuitiM;
  @override
  void initState() {
    FontManage();
    
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      FontManage().useFont('putB').then((onValue){
        if(onValue != null){
          setState(() {
            puhuitiM = onValue;  
          });
        }
      });
    });
  }



  

  @override
  Widget build(BuildContext context) {
    print('ssss');
    TextStyle textStyle = TextStyle(
      fontSize: 20,
      fontFamily: puhuitiM,
      // fontWeight: FontWeight.bold,
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

  downloadFont(){

    // FontManage().useFont('Alibaba-PuHuiTi-Medium.ttf').then((onValue) {
    //   if(onValue) {
        
    //     setState(() {
    //       complete = true;  
    //     });
    //   }
    // });
  }

}