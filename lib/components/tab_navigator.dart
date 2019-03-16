import 'package:flutter/material.dart';
import 'package:fluttershuachi/pages/add_page.dart';
import 'package:fluttershuachi/pages/clockin_page.dart';
import 'package:fluttershuachi/pages/home_page.dart';
import 'package:fluttershuachi/pages/message_page.dart';
import 'package:fluttershuachi/pages/my_page.dart';

class TabNavigator extends StatefulWidget {
  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  final _defaultColor = Color.fromARGB(255, 156, 156, 156);
  final _activeColor = Color.fromARGB(255, 255, 136, 0);
  int _currentIndex = 0;
  TabController _controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: TabBarView(controller: _controller, children: <Widget>[
          HomePage(),
          ClockinPage(),
          AddPage(),
          MessagePage(),
          MyPage()
        ]),
        bottomNavigationBar: Material(
          color: Colors.white,
          child: TabBar(
            controller: _controller,
            tabs: <Widget>[
              new Tab(text: "首页", icon: new Icon(Icons.home)),
              new Tab(text: "首页", icon: new Icon(Icons.home)),
              new Tab(text: "首页", icon: new Icon(Icons.home)),
            ],
            indicatorWeight: 0.07,
          ),
        ));
  }
}
