import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/animation/animationPageOne.dart';
import 'package:fluttershuachi/demo/listview/listviewJumpItem.dart';
import 'package:fluttershuachi/demo/listview/listviewLoad.dart';


class AnimationRouter extends StatelessWidget{
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
              child: Text('animationPage_1'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => AnimationPageOne()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}