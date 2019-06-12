import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/dismissable/dismissableDemo.dart';
import 'package:fluttershuachi/demo/router/PushAndRemoveUntilDemo.dart';
import 'package:fluttershuachi/demo/router/popAndPushNamed.dart';
import 'package:fluttershuachi/demo/router/popUntil.dart';
import 'package:fluttershuachi/demo/router/pushReplacementNamed.dart';
import 'package:fluttershuachi/demo/test/testRouterDemo.dart';

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
              child: Text('popAndPushNamed'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PopAndPushNamedDemo()));
              },
            ),
            FlatButton(
              child: Text('pushNamedAndRemoveUntil'),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => PushAndRemoveUntilDemo()));
              },
            ),
            FlatButton(
              child: Text('PopUntil'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => PopUntilDemo()),
                );
              },
            ),
            FlatButton(
              child: Text('DismissableDemo'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => DismissableDemo()),
                );
              },
            ),
            FlatButton(
              child: Text('Test'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => TestRouterDemo()),
                );
              },
            ),
            RaisedButton(
              onPressed: () {
                print(ModalRoute.withName('/router'));
                print('ModalRoute.of(context).settings  ${ModalRoute.of(context).settings}');
              },
              child: Text('测试ModalRoute.withName(/router)'),
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