import 'dart:async';

import 'package:flutter/material.dart';

class CounteHome extends StatelessWidget {
  const CounteHome({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc.count,
        builder: (context, snapshot) {
          return ActionChip(
            label: Text('${snapshot.data}'),
            onPressed: (){
              // _counterBloc.log();
              print(_counterBloc.counter);
              _counterBloc.counter.add(1);
              
            },
          );
        },
      ),
    );
  }
}


class CounteActionButton extends StatelessWidget {
  const CounteActionButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).bloc;
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        // _counterBloc.log();
        _counterBloc.counter.add(1);
      },
    );
  }
}


class CounterProvider extends InheritedWidget {
  CounterProvider({Key key, this.child,this.bloc}) : super(key: key, child: child);

  final Widget child;
  final CounterBloc bloc;

  static CounterProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CounterProvider)as CounterProvider);
  }

  @override
  bool updateShouldNotify( CounterProvider oldWidget) {
    return true;
  }
}


class CounterBloc {
  int _count = 0;
  //暴露给外面的stream
  final _counterActionController = StreamController<int>();
  StreamSink<int> get counter => _counterActionController.sink;

  //构建时使用的stream
  final _countController = StreamController<int>();
  Stream<int> get count => _countController.stream;

  //构造外面的stream的监听
  CounterBloc() {
    _counterActionController.stream.listen(onData);
  }

  // 外面的数据有变化就把值add到build的stream上
  void onData(int data) {
    print(data);
    _count = data + _count;
    _countController.add(_count);
  }

  void dispose() {
    _counterActionController.close();
    _countController.close();
  }

  void log(){
    print('Bloc');
  }
}



