import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/key/KeyDemo.dart';


class KeyRouter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Key'),
      ),
      body: Center(
        child: Wrap(
          children: <Widget>[
            FlatButton(
              child: Text('Key'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => KeyDemo()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}