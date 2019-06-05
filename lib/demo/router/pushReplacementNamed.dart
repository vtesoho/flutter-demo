import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/router/pushReplacementNamedB.dart';

class PushReplacementNamedDemo extends StatelessWidget {
  const PushReplacementNamedDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PushReplacementNamedDemo'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('当前路径 home-router-PushReplacementNamed'),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (BuildContext context) => PushReplacementNamedBDemo())
                );
              },
              child: Text('router'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        onPressed: (){
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => PushReplacementNamedBDemo())
          );
          // Navigator.pushReplacement( context, MaterialPageRoute(builder: (BuildContext context) => PushReplacementNamedDemo()));

        },
      ),
    );
  }
}