import 'package:flutter/material.dart';
import 'package:fluttershuachi/pages/animation.dart';

void main () => runApp(App());


class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/animation',
      routes: {
        '/': (context) => Home(),
        '/animation': (context) => AnimationDemo(),
      },
      theme: ThemeData(
        highlightColor: Color.fromARGB(255, 255, 255, 255)
      )
    );
  }
}


class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('Home Boyd'),
      ),
    );
  }
}

