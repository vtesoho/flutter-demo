import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/font/networkFont.dart';
import 'package:fluttershuachi/demo/ping/pingDemo.dart';


class PingRouter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PingRouter'),
      ),
      body: Center(
        child: Wrap(
          children: <Widget>[
            FlatButton(
              child: Text('PingRouter'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => PingDemo()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}