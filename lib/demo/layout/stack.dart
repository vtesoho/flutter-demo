import 'package:flutter/material.dart';

class Testg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('练习Stack布局'),
      ),
      body: Column(
        children: <Widget>[
          Stack(
            alignment: FractionalOffset(0.9, 0.1),
            children: <Widget>[
              Image.network(
                'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1552372186705&di=b13fd06265521d400afbd6df719f5f0a&imgtype=0&src=http%3A%2F%2Fpic2.16pic.com%2F00%2F07%2F65%2F16pic_765502_b.jpg',
                width: 300.0,
              ),
              Opacity(
                opacity: 0.8,
                child: Icon(Icons.share, color: Colors.white),
              )
            ],
          )
        ],
      ),
    ));
  }
}
