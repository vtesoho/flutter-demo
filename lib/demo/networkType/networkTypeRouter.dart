import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/networkType/networkTypeDemo.dart';


class NetworkTypeRouter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('router'),
      ),
      body: Center(
        child: Wrap(
          children: <Widget>[
            FlatButton(
              child: Text('netWorkType'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => NetworkTypeDemo()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}