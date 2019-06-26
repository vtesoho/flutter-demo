import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/listview/listviewJumpItem.dart';


class ListviewRouter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('router'),
      ),
      body: Center(
        child: Wrap(
          children: <Widget>[
            FlatButton(
              child: Text('ListviewJumpItem'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => ListviewJumpItem()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}