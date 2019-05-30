import 'package:flutter/material.dart';

class AssertDemo extends StatefulWidget {
  AssertDemo({Key key}) : super(key: key);
  

  

  _AssertDemoState createState() => _AssertDemoState();
}

class _AssertDemoState extends State<AssertDemo> {
  static bool poll = false;
  void test(){
    print('assert执行前？？');
    assert(poll == true,'assert执行中？？');
    print('assert执行后？？');
  }
  //在debug环境下这种情况会报错，在release环境会正常执行

  @override
  Widget build(BuildContext context) {
    test();
    return Scaffold(
      appBar: AppBar(
        title: Text('assert'),
      ),
      body: Text('data'),
    );
  }
}