import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';

void main() => runApp(MaterialApp(
      home: MaterialApp(
        home: ShartDemo(),
      ),
    ));

class ShartDemo extends StatefulWidget {
  ShartDemo();

  @override
  _ShartDemoState createState() => _ShartDemoState();
}

class _ShartDemoState extends State<ShartDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Esys Share Plugin Sample'),
        ),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: <Widget>[
                MaterialButton(
                  child: Text('Share text'),
                  onPressed: () async => await _shareText(),
                ),
                MaterialButton(
                  child: Text('Share image'),
                  onPressed: () async => await _shareImage(),
                ),
              ],
            )));
  }

  Future _shareText() async {
    try {
      await EsysFlutterShare.shareText(
          'This is my text to share with other applications.', 'my text title');
    } catch (e) {
      print('error: $e');
    }
  }

  Future _shareImage() async {
    try {
      final ByteData bytes = await rootBundle.load('/images/image.jpg');
      await EsysFlutterShare.shareImage(
          'myImageTest.png', bytes, 'my image title');
    } catch (e) {
      print('error: $e');
    }
  }
}