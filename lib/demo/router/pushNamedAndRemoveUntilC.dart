import 'package:flutter/material.dart';
import 'package:fluttershuachi/pages/home.dart';

class PushNamedAndRemoveUntilC extends StatelessWidget {
  const PushNamedAndRemoveUntilC({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PushNamedAndRemoveUntilC'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('当前路径 home-router-PushNamedAndRemoveUntilB-PushNamedAndRemoveUntilC'),
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