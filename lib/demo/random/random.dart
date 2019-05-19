import 'package:flutter/material.dart';
import 'dart:math' show Random;



class RandomDemo extends StatefulWidget {
  RandomDemo({Key key}) : super(key: key);

  _RandomDemoState createState() => _RandomDemoState();
}

class _RandomDemoState extends State<RandomDemo> {
  int number = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RandomDemo'),
      ),
      body: Text('$number'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            number = Random().nextInt(30);//返回不大于参数int型数值
            print(Random().nextDouble());//随机返回一个不大于1的double数值
          });
        },
      ),
    );
  }
}