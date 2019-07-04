import 'package:flutter/material.dart';

class WebpTest extends StatefulWidget {
  WebpTest({Key key}) : super(key: key);

  _WebpTestState createState() => _WebpTestState();
}

class _WebpTestState extends State<WebpTest> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('testWebp'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Image.network('http://ct4.cdn.shuachi.com/note-pic/9b1519697c8b3d7b484a7e90fa102063?imageMogr2/auto-orient/thumbnail/x300/gravity/Center/crop/300x300/quality/85/format/jpeg&sign=bec3eec169e239284ba78471e9131281&t=5d1c3594'),
            Image.network('http://ct5.cdn.shuachi.com/note-pic/d58b3133cf26876a06c9d65444c74f40?imageMogr2/auto-orient/thumbnail/300x/gravity/Center/crop/300x400/quality/85/format/webp&sign=9c7907fbcbfbad2a0ee54ac6ad4c8df1&t=5d1c3594'),
        
          ],
        ),
      ),
    );
  }
}