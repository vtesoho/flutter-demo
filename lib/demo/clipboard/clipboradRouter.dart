import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/clipboard/clipboard.dart';

class ClipboradRouter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ClipboradRouter'),
      ),
      body: Center(
        child: Wrap(
          children: <Widget>[
            FlatButton(
              child: Text('ClipboradRouter'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => ClipboardDemo()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}