import 'package:flutter/material.dart';

class ResponsiveDemo extends StatelessWidget {
  const ResponsiveDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('响应式demo'),
      ),
      body: ResponsiveApp(),
    );
  }
}

class ResponsiveApp extends StatefulWidget {
  ResponsiveApp({Key key}) : super(key: key);
  _ResponsiveAppState createState() => _ResponsiveAppState();
}

class _ResponsiveAppState extends State<ResponsiveApp> {
  var _futureBuilderFuture;

  //模拟获取数据
  Future _gerData() async {
    await new Future.delayed(new Duration(milliseconds: 3000));
    return "我是用户";
  }

  @override
  void initState() {
    super.initState();

    //初始化执行赋值
    _futureBuilderFuture = _gerData();
  }

  ///snapshot就是_calculation在时间轴上执行过程的状态快照
  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        print('还没有开始网络请求');
        return Text('还没有开始网络请求');
      case ConnectionState.active:
        print('active');
        return Text('ConnectionState.active');
      case ConnectionState.waiting:
        print('waiting');
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        print('done');
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        return _createText(context, snapshot);
      default:
        return Text('还没有开始网络请求');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RefreshIndicator(
        onRefresh: _gerData,
        child: FutureBuilder(
          builder: _buildFuture,
          future: _futureBuilderFuture, // _futureBuilderFuture有变化就会重构
        ),
      ),
    );
  }


  Widget _createText(BuildContext context,AsyncSnapshot snapshot) {
    String returnText = snapshot.data;
    return Text('${returnText}');
  }
}
