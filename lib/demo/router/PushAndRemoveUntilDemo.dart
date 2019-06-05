import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/router/pushNamedAndRemoveUntilB.dart';
import 'package:fluttershuachi/demo/router/pushReplacementNamedB.dart';

class PushAndRemoveUntilDemo extends StatelessWidget {
  const PushAndRemoveUntilDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(ModalRoute.withName('/router'));
    return Scaffold(
      appBar: AppBar(
        title: Text('PushReplacementNamedDemo'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('当前路径 home-router-pushNamedAndRemoveUntil'),
            Text('当前路径 home-router-pushNamedAndRemoveUntil'),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
              },
              child: Text('跳转首页  false'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil('/router', (Route<dynamic> route) => false);
              },
              child: Text('跳转router  false'),
            ),
            RaisedButton(
              onPressed: () {
                // Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/router'));
                print(ModalRoute.withName('/router'));
                Navigator.pushAndRemoveUntil(
                  context, 
                  MaterialPageRoute(builder: (BuildContext context) => PushNamedAndRemoveUntilB()),
                  (Route<dynamic> route) => true,
                );
              },
              child: Text('跳转首页 router'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamedAndRemoveUntil('/router', (Route<dynamic> route) => false);
              },
              child: Text('跳转router'),
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