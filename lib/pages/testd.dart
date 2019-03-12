import 'package:flutter/material.dart';



class Test_d extends StatelessWidget{
  final String title;
  Test_d({Key key, this.title}) :super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        body: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.add_photo_alternate),
              onPressed: null,
              tooltip: 'a',
            ),
            Expanded(
              child: Text(title),
            ),
            Expanded(
              child: Text(title),
            ),
            IconButton(onPressed: null, icon: Icon(Icons.bluetooth), tooltip: 'b',)
          ],
        ),
      )
    );
  }
}