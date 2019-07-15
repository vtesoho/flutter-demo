import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:image_tailor/image_tailor.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await ImageTailor.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }
  List _images = [];

  _previewPhoto() {
    return Container(
      width: 300,
      height: 300,
      child: ListView.builder(
        itemBuilder: (context, i) {
          Uint8List image = _images[i];
          print(image);
          print(image.lengthInBytes.toString());

          return Container(
            width: 300,
            child: Image.memory(
              image,
              fit: BoxFit.fitWidth,
            ),
          );
        },
        itemCount: _images.length,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Stack(
          children: <Widget>[
            Text('Running on: $_platformVersion\n'),
            Column(
              children: <Widget>[
                _previewPhoto(),
                
              ],
            ),
            Positioned(
              top:400,
              child: FlatButton(  
                child: Text('FlatButton'),
                onPressed: () {
                  ImageTailor.finish;
                },
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final result = await ImageTailor.selectImg(
              maxImages: 4,
              quality: 0.5,
              width: 1024,
              height: 100,
              videos: false,
            );

            if (result is List) {
              setState(() {
                _images = result;
              });
            }
          },
        ),
      ),
    );
  }
}
