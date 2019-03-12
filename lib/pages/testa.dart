import 'package:flutter/material.dart';

class TestA extends StatefulWidget {
  @override
  _TestAState createState() => _TestAState();
}


class _TestAState extends State<TestA> {
  TabController _controller;

  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: TabBar(
              controller: _controller,
              tabs: <Widget>[
                Tab(text: "发现"),
                Tab(text: "关注"),
              ],
              onTap: (index) async {
                print(index);
              },
            )
          ),
          body: TabBarView(
            controller: _controller,
            children: <Widget>[
              Container(child: Text('aa'),),
              Container(child: Text('bb'),),
            ],
          ),
        ),
      ),
    );
  }
}