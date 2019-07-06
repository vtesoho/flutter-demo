import 'dart:io';
import 'package:flutter/material.dart';

class PingDemo extends StatefulWidget {
  PingDemo({Key key}) : super(key: key);

  _PingDemoState createState() => _PingDemoState();
}

class _PingDemoState extends State<PingDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ping'),
      ),
      body: Container(
        child: Text('data'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async{
          try {
            final result = await InternetAddress.lookup('www.shuachi.com');
            print(result[0].rawAddress.isNotEmpty);
            if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
              print('connected');
            }
          } on SocketException catch (_) {
            print('not connected');
          }
        },
      ),
    );
  }
}