import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/listview');
              },
              child: Text('listview'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/form');
              },
              child: Text('form'),
            ),
          ],
        ),
      ),
    );
  }
}

