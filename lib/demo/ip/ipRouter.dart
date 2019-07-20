import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/ip/ipDemo.dart';



class IpRouter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IpRouter'),
      ),
      body: Center(
        child: Wrap(
          children: <Widget>[
            FlatButton(
              child: Text('IpRouter'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => IpDemo()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}