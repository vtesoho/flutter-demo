import 'package:flutter/material.dart';
import 'package:fluttershuachi/pages/animation.dart';
import 'package:fluttershuachi/pages/home.dart';
import 'package:fluttershuachi/pages/share_demo.dart';
import 'package:fluttershuachi/pages/test_status_demo.dart';

void main () => runApp(App());


class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/shart',
      routes: {
        '/': (context) => Home(),
        '/animation': (context) => AnimationDemo(),
        '/teststatus': (context) => TestStatusDemo(),
        '/shart': (context) => ShartDemo(),
      },
      theme: ThemeData(
        highlightColor: Color.fromARGB(255, 255, 255, 255)
      )
    );
  }
}

