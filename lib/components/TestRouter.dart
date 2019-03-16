import 'package:flutter/material.dart';

class TestRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            RaisedButton(
              child: Text('滑动渐变'),
              onPressed: () {
                Navigator.of(context).pushNamed('/e');
              },
            ),
            Text('(滑动监听)'),
          ],
        ),
        RaisedButton(
          child: Text('tab_tabview'),
          onPressed: () {
            Navigator.of(context).pushNamed('/a');
          },
        ),
        RaisedButton(
          child: Text('layout test'),
          onPressed: () {
            Navigator.of(context).pushNamed('/f');
          },
        ),
        RaisedButton(
          child: Text('Stack布局'),
          onPressed: () {
            Navigator.of(context).pushNamed('/g');
          },
        ),
        RaisedButton(
          child: Text('动画'),
          onPressed: () {
            Navigator.of(context).pushNamed('/h');
          },
        ),
        RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/b');
          },
        ),
        RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/c');
          },
        ),
        RaisedButton(
          onPressed: () {
            Navigator.of(context).pushNamed('/d');
          },
        ),
      ],
    ));
  }
}
