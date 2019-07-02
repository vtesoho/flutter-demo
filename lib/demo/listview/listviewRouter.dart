import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/listview/listviewJumpItem.dart';
import 'package:fluttershuachi/demo/listview/listviewLoad.dart';


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
            FlatButton(
              child: Text('ListviewLoad'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => ListviewLoad()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}