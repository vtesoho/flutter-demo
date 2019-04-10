import 'package:flutter/material.dart';

class RouterDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
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