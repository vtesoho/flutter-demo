import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/router/pushNamedAndRemoveUntilC.dart';
import 'package:fluttershuachi/pages/home.dart';

class PushNamedAndRemoveUntilB extends StatelessWidget {
  const PushNamedAndRemoveUntilB({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PushNamedAndRemoveUntilB'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('当前路径 home-router-PushNamedAndRemoveUntilDemo - PushNamedAndRemoveUntilB'),
            RaisedButton(
              onPressed: () {
                // Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/router'));
                print(ModalRoute.withName('/router'));
                Navigator.pushAndRemoveUntil(
                  context, 
                  MaterialPageRoute(builder: (BuildContext context) => PushNamedAndRemoveUntilC()),
                  (Route<dynamic> route) => true,
                );
              },
              child: Text('跳转PushNamedAndRemoveUntilC  true'),
            ),
            RaisedButton(
              onPressed: () {
                // Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/router'));
                print(ModalRoute.withName('/router'));
                Navigator.pushAndRemoveUntil(
                  context, 
                  MaterialPageRoute(builder: (BuildContext context) => PushNamedAndRemoveUntilC()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text('跳转PushNamedAndRemoveUntilC  false'),
            ),
            RaisedButton(
              onPressed: () {
                // Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/router'));
                print(ModalRoute.withName('/router'));
                Navigator.pushAndRemoveUntil(
                  context, 
                  MaterialPageRoute(builder: (BuildContext context) => Home()),
                  (Route<dynamic> route) => true,
                );
              },
              child: Text('跳转首页 router  true'),
            ),
            RaisedButton(
              onPressed: () {
                // Navigator.of(context).pushNamedAndRemoveUntil('/', ModalRoute.withName('/router'));
                print(ModalRoute.withName('/router'));
                Navigator.pushAndRemoveUntil(
                  context, 
                  MaterialPageRoute(builder: (BuildContext context) => Home()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text('跳转首页 router  false'),
            ),
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