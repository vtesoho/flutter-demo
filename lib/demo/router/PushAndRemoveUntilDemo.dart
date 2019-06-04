import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/router/pushReplacementNamedB.dart';

class PushAndRemoveUntilDemo extends StatelessWidget {
  const PushAndRemoveUntilDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PushReplacementNamedDemo'),
      ),
      body: Center(
        child: Text('当前路径 home-router-PushReplacementNamed'),
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