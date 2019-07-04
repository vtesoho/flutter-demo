import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/font/networkFont.dart';


class FontRouter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('fontRouter'),
      ),
      body: Center(
        child: Wrap(
          children: <Widget>[
            FlatButton(
              child: Text('FontDownDemo'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => FontDownDemo()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}