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
  final PageController _controller = PageController(
    initialPage: 0,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(controller: _controller, children: <Widget>[
        HomePage(),
        ClockinPage(),
        AddPage(),
        MessagePage(),
        MyPage()
      ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          _controller.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.home,
                color: _activeColor,
              ),
              title: Text(
                '首页',
                style: TextStyle(
                    color: _currentIndex != 0 ? _defaultColor : _activeColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.favorite,
                color: _activeColor,
              ),
              title: Text(
                '关注',
                style: TextStyle(
                    color: _currentIndex != 1 ? _defaultColor : _activeColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                color: _defaultColor,
                size: 50.0,
              ),
              activeIcon: Icon(
                Icons.add_circle,
                color: _activeColor,
                size: 50.0,
              ),
              title: Text('', style: TextStyle(fontSize: 0))),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.message,
                color: _activeColor,
              ),
              title: Text(
                '消息',
                style: TextStyle(
                    color: _currentIndex != 3 ? _defaultColor : _activeColor),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.face,
                color: _defaultColor,
              ),
              activeIcon: Icon(
                Icons.face,
                color: _activeColor,
              ),
              title: Text(
                '我的',
                style: TextStyle(
                  color: _currentIndex != 4 ? _defaultColor : _activeColor,
                ),
              ))
        ],
      ),
    );
  }
}
