import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/test/slivePullDown.dart';
import 'package:fluttershuachi/demo/test/tryAsync.dart';
import 'package:fluttershuachi/demo/test/webpText.dart';

class TestRouterDemo extends StatelessWidget{
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
              child: Text('tryasync'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => TryAsyncDemo()),
                );
              },
            ),
            FlatButton(
              child: Text('SlivePullDown'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => SlivePullDownDemo()),
                );
              },
            ),
            FlatButton(
              child: Text('WebpTextDemo'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => WebpTest()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RouterPageOne extends StatelessWidget{
  final String title;
  RouterPageOne({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}