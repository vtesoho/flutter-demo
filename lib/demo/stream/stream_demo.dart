import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/stream/testStreamComponents.dart';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stream'),
      ),
      body: StreamDemoHome(),
    );
  }
}


class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamDemoSubscription;
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo;
  String _data = '...';

  @override
  void dispose() {
    super.dispose();
    _streamDemo.close();
  }


  @override
  void initState() {
    super.initState();

    print('创建stream之前');
    // Stream<String> _streamDemo = Stream.fromFuture(fetchDate());
    // _streamDemo = StreamController<String>(); //此种方法创建的只能定阅一次
    _streamDemo = StreamController.broadcast();
    _sinkDemo = _streamDemo.sink;

    print('start listen on a stream');
    _streamDemoSubscription = _streamDemo.stream.listen(onData,onError: onError,onDone: onDone,);

    _streamDemo.stream.listen(onDataTwo,onError: onError,onDone: onDone,);

    print('initialize completed');
  }

  //在数据返回之后执行
  void onData(String data) {
    setState(() {
      _data = data;
    });
    print('$data');
  }

  void onDataTwo(String data) {
    print('ondataTow - $data');
  }

  //在执行完成之后执行
  void onDone() {
    print('Done');
  }

  //在有异常的时候执行
  void onError(error) {
    print('Error $error');
  }

  //控制stream暂停
  void _pauseStream(){
    print('Pause subscription');
    _streamDemoSubscription.pause();
  }

  //控制stream恢复，恢复之后如果已经有返回会直接执行
  void _resumeStream(){
    print('resume subscription');
    _streamDemoSubscription.resume();
  }

  //取消订阅，取消之后也没有办法恢复
  void _cancelStream(){
    print('cancel subscription');
    _streamDemoSubscription.cancel();
  }

  void _addDataStream() async{
    print('_addDataStream');
    String data = await fetchDate();
    // _streamDemo.add(data);
    _sinkDemo.add(data);

  }

  Future<String> fetchDate() async {
    await Future.delayed(Duration(seconds: 5),);
    // throw 'Something happened';
    return 'hello !';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(_data),
            StreamBuilder(
              stream: _streamDemo.stream,   //设置stream
              initialData: '...',   //设置初始值
              builder: (context, snapshot) {   //设置widget
                return Text('${snapshot.data}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('add'),
                  onPressed: _addDataStream,
                ),
                FlatButton(
                  child: Text('pause'),
                  onPressed: _pauseStream,
                ),
                FlatButton(
                  child: Text('Resume'),
                  onPressed: _resumeStream,
                ),
                FlatButton(
                  child: Text('cancel'),
                  onPressed: _cancelStream,
                )
              ],
            ),
            Column(
              children: <Widget>[
                TestStreamComponents(stream: _streamDemo.stream,)
              ],
            )
          ],
        ),
      ),
    );
  }
}




