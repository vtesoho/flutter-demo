import 'package:flutter/material.dart';

class AsyncDemo extends StatefulWidget {
  AsyncDemo({Key key}) : super(key: key);

  _AsyncDemoState createState() => _AsyncDemoState();
}

class _AsyncDemoState extends State<AsyncDemo> {
  @override
  void initState() {
    start();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AsyncDemo'),
      ),
      body: Container(),
    );
  }

  void start () async{
    var start;
    start = await testFunction();
    print(start);
  }

  Future<String> testFunction () async{
    var aaa;
    await Future.delayed(Duration(seconds: 1),(){
      print('testFunction');
    });
    aaa = await testFunctionB();
    return aaa;
  }

  Future<String> testFunctionB () async {
    await Future.delayed(Duration(seconds: 1),(){
      print('testFunctionB');
    });
    return 'sss';
  }


}