import 'package:flutter/material.dart';

class RouterDemoa extends StatefulWidget {
  RouterDemoa({Key key}) : super(key: key);

  _RouterDemoaState createState() => _RouterDemoaState();
}

class _RouterDemoaState extends State<RouterDemoa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('routerDemoa'),
      ),
      body: Text('data'),
    );
  }
}