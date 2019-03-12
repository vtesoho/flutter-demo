import 'package:flutter/material.dart';
import 'package:fluttershuachi/common/util.dart';
import 'package:flutter/foundation.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.red,
            width: 100.0,
            height: 100.0,
          ),
          Text(Util.screenWidth().toString()),
          Container(
            color: Colors.red,
            width: 100.0,
            height: 100.0,
          ),
          Container(
            color: Colors.red,
            width: 100.0,
            height: 100.0,
          )
        ],
      ),
    );
    // return Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: <Widget>[
    //     Text('sssss'),
    //     Text('sssss'),
    //     Text('sssss'),
    //     Text('sssss'),
    //   ],
    // );
    // return Scaffold(
    //   body: Padding(
    //     padding: new EdgeInsets.all(Util.stateHeight()),
    //     child: new Container(
          
    //     )
    //   )
    // );
  }
}
