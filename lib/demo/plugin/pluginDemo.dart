
import 'package:flutter/material.dart';
// import 'package:fluttershuachi/demo/plugin/ImageTailorDemo.dart';
import 'package:fluttershuachi/demo/plugin/flutterTestSwiftDemo.dart';


class PluginRouter extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PluginRouter'),
      ),
      body: Center(
        child: Wrap(
          children: <Widget>[
            // FlatButton(
            //   child: Text('image_tailor'),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(builder: (BuildContext context) => ImageTailorDemo()),
            //     );
            //   },
            // ),
            FlatButton(
              child: Text('fluttertestswift'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => FlutterTestSwiftDemo()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}