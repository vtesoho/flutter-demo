import 'package:flutter/material.dart';

class SetStateTestDemo extends StatefulWidget {
  SetStateTestDemo({Key key}) : super(key: key);

  _SetStateTestDemoState createState() => _SetStateTestDemoState();
}

class _SetStateTestDemoState extends State<SetStateTestDemo> {
  String text = '初始';
  void test() {
    setState(() {
      text = '第一次';
    });
    
    for (var i = 0; i < 10; i++) {
      Future.delayed(Duration(milliseconds: 1000),() {
        setState(() {
          text = '第${i}次';
        });
      });
      
    }

    delayedrun().then((onValue) {
      setState(() {
        text = onValue;
      });
    });
  }

  Future delayedrun() async {
    await new Future.delayed(new Duration(milliseconds: 3000));
    return '第二次';
  }

  @override
  Widget build(BuildContext context) {
    print('执行了几次了');
    return Scaffold(
      appBar: AppBar(
        title: Text('SetStateTestDemo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('执行setstate-----------');
          test();
          
        },
      ),
      body: Text('${text}'),
    );
  }
}
