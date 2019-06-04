import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/router/PushAndRemoveUntilDemo.dart';
import 'package:fluttershuachi/demo/router/pushReplacementNamed.dart';

class RouterDemo extends StatelessWidget{
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
              child: Text('home'),
              onPressed: () {
                Navigator.pushNamed(context, '/sliver');
              },
            ),
            FlatButton(
              child: Text('about'),
              onPressed: () {
                Navigator.pushNamed(context, '/routerPageOne');
              },
            ),
            FlatButton(
              child: Text('PushReplacementNamed'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PushReplacementNamedDemo()));
              },
            ),
            FlatButton(
              child: Text('PushReplacementNamed'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PushAndRemoveUntilDemo()));
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