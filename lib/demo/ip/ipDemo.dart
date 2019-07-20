import 'dart:io';
import 'package:flutter/material.dart';

class IpDemo extends StatefulWidget {
  IpDemo({Key key}) : super(key: key);

  _IpDemoState createState() => _IpDemoState();
}

class _IpDemoState extends State<IpDemo> {
  String ipAddress;
  @override
  void initState() {
    getip();
    super.initState();
    
  }


  getip () async{
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IP'),
      ),
      body: Container(
        child: Text(ipAddress),
      ),
    );
  }
}