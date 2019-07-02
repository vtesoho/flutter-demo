import 'package:flutter/material.dart';

class FrameworkDemo extends StatefulWidget {
  FrameworkDemo({Key key}) : super(key: key);

  _FrameworkDemoState createState() => _FrameworkDemoState();
}

class _FrameworkDemoState extends State<FrameworkDemo> {
  @override
  Widget build(BuildContext context) {
    return Container();
    // return Container(
    //    child: FutureBuilder(
    //      future: Future,
    //      initialData: InitialData,
    //      builder: (BuildContext context, AsyncSnapshot snapshot) {
    //       switch (snapshot.connectionState) {
    //         case ConnectionState.none:
    //           return Text('Press button to start.');
    //         case ConnectionState.active:
    //         case ConnectionState.waiting:
    //           return Load();
    //         case ConnectionState.done:
    //       }
    //        return ;
    //      },
    //    ),
    // );
  }
}