import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/customGestureDetectorWidget/customGestureDetectorWidget.dart';

class LifeCycleDemo extends StatefulWidget {
  LifeCycleDemo({Key key}) : super(key: key);

  _LifeCycleDemoState createState() => _LifeCycleDemoState();
}


class _LifeCycleDemoState extends State<LifeCycleDemo> {
  @override
  void initState() {
    print('看看执行顺序 initState');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('看看执行顺序 didChangeDependencies');
  }

  @override
  void didUpdateWidget(LifeCycleDemo oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print('看看执行顺序 didUpdateWidget');
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print('看看执行顺序 deactivate');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('看看执行顺序 dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('看看执行顺序 build');
    return Scaffold(
      appBar: AppBar(
        title: Text('LifeCycleDemo'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {});
        },
      ),
      body: CustomGestureDetectorDemo(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.blue,
          child: Column(
            children: <Widget>[
              Text('sdfsdf'),
            ],
          ),
        ),
      ),
    );
  }
}
