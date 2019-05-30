import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttershuachi/dart/assert.dart';

class DartHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Wrap(
          spacing: 3.0,
          runSpacing: 3.0,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AssertDemo(),
                  ),
                );
              },
              child: Text('assert'),
            ),
          ],
        ),
      ),
    );
  }
}
