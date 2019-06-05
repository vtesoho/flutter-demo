import 'package:flutter/material.dart';

class PopUntilDemo extends StatelessWidget {
  const PopUntilDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopUntilDemo'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('当前路径 home-router-PopUntilDemo'),
            RaisedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/router'));
              },
              child: Text('跳转首页'),
            ),
            RaisedButton(
              onPressed: () {
                print(ModalRoute.withName('/router'));
              },
              child: Text('测试ModalRoute.withName(/router)'),
            ),
          ],
        )
      )
    );
  }
}