import 'package:flutter/material.dart';

class PopAndPushNamedDemo extends StatelessWidget {
  const PopAndPushNamedDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopAndPushNamedDemo'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('当前路径 home-router-PopAndPushNamedDemo'),
            Text('当前页pop，并push到指定路由，但此方法只能是属名路由'),
            RaisedButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/router');
              },
              child: Text('router'),
            ),
          ],
        )
      )
    );
  }
}