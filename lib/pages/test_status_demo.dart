

import 'package:flutter/material.dart';

class TestStatusDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('input'),
          brightness: Brightness.dark,
          elevation: 2.0,
          
        )
      ),
    );
    // return 
    // ListView(
    //   children: <Widget>[
    //     Container(
    //       height: 200,
    //       color: Colors.blue,
    //     ),
    //     Container(
    //       height: 200,
    //       color: Colors.white,
    //     ),
    //     Container(
    //       height: 200,
    //       color: Colors.blue,
    //     ),
    //     Container(
    //       height: 200,
    //       color: Colors.white,
    //     ),
    //     Container(
    //       height: 200,
    //       color: Colors.blue,
    //     ),
    //     Container(
    //       height: 200,
    //       color: Colors.white,
    //     ),
    //     Container(
    //       height: 200,
    //       color: Colors.blue,
    //     ),
    //     Container(
    //       height: 200,
    //       color: Colors.white,
    //     )
    //   ],
    // );
  }
}