import 'package:flutter/material.dart';

class SnackBarDemo extends StatelessWidget {
  const SnackBarDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SnackBarDemo'),
      ),
      body: new Builder(builder: (BuildContext context) {
          return new Center(
            child: new GestureDetector(
              onTap: () {
                final snackBar =
                    new SnackBar(content: new Text('这是一个SnackBar'));
                Scaffold.of(context).showSnackBar(snackBar);
              },
              child: new Text('显示SnackBar'),
            ),
          );
        })
    );
  }
}
