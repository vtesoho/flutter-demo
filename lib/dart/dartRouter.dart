import 'package:flutter/material.dart';
import 'package:fluttershuachi/dart/async.dart';


class DartRouter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DartRouter'),
      ),
      body: Center(
        child: Wrap(
          children: <Widget>[
            FlatButton(
              child: Text('Async'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => AsyncDemo()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}