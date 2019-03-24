import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/state/state_management_demo.dart';
import 'package:fluttershuachi/pages/animation.dart';
import 'package:fluttershuachi/pages/home.dart';
import 'package:fluttershuachi/pages/my_page.dart';
import 'package:fluttershuachi/pages/page_view.dart';
import 'package:fluttershuachi/pages/share_demo.dart';
import 'package:fluttershuachi/pages/test_status_demo.dart';

void main () => runApp(App());


class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/mypage',
      routes: {
        '/': (context) => Home(),
        '/animation': (context) => AnimationDemo(),
        '/teststatus': (context) => TestStatusDemo(),
        '/shart': (context) => ShartDemo(),
        '/pageview': (context) => ViewDemo(),
        '/state-management': (context) => StateManagementDemo(),
        '/mypage': (context) => MyPage(),
      },
      theme: ThemeData(
        highlightColor: Color.fromARGB(255, 255, 255, 255)
      )
    );
  }
}

