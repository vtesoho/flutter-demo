import 'package:flutter/material.dart';

class PushReplacementNamedBDemo extends StatelessWidget {
  const PushReplacementNamedBDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PushReplacementNamedBDemo'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('当前路径 home-router-PushReplacementNameB'),
            Text('执行到此页面，上一页面会执行生命周期'),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.ac_unit),
        onPressed: (){
          // Navigator.of(context).pushReplacement(
          //   MaterialPageRoute(builder: (BuildContext context) => PushReplacementNamedDemo())
          // );
          // Navigator.pushReplacement( context, MaterialPageRoute(builder: (BuildContext context) => PushReplacementNamedDemo()));

        },
      ),
    );
  }
}