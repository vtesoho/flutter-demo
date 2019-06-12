//测试一下try能否捕捉到async

import 'package:flutter/material.dart';

class TryAsyncDemo extends StatefulWidget {
  TryAsyncDemo({Key key}) : super(key: key);

  _TryAsyncDemoState createState() => _TryAsyncDemoState();
}

class _TryAsyncDemoState extends State<TryAsyncDemo> {

  

  testDelayed() async{
    await Future.delayed(Duration(seconds: 3));
    throw "error";
  }

  test() async{
    try {
      await testDelayed();  
    } catch (e) {
      print('是否有捕获到？  ${e}');
    }
    

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TryAsyncDemo'),
      ),
      body: Container(
        child: FlatButton(
          child: Text('TryAsyncButton'),
          onPressed: test
        ),
      ),
    );
  }
}