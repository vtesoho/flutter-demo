import 'package:flutter/material.dart';

class ListviewLoad extends StatefulWidget {
  ListviewLoad({Key key}) : super(key: key);

  _ListviewLoadState createState() => _ListviewLoadState();
}

class _ListviewLoadState extends State<ListviewLoad> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (BuildContext context, int index) {
      return Container(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            Container(
              height: 500,
              width: double.infinity,
              color: Colors.red,
              child: Text('data1'),
            ),
            Container(
              height: 500,
              color: Colors.blue,
              child: Text('data2'),
            ),
            Container(
              height: 500,
              color: Colors.red,
              child: Text('data1'),
            ),
            Container(
              height: 500,
              color: Colors.blue,
              child: Text('data2'),
            ),
            Container(
              height: 500,
              color: Colors.red,
              child: Text('data1'),
            ),
            Container(
              height: 500,
              color: Colors.blue,
              child: Text('data2'),
            ),
            Container(
              height: 500,
              color: Colors.red,
              child: Text('data1'),
            ),
            Container(
              height: 500,
              color: Colors.blue,
              child: Text('data2'),
            ),
            ListviewTextClass(),
          ],
        ),
      );
     },
    );
    // return ListView.builder(
    //   children: <Widget>[
    //     Container(
    //       height: 500,
    //       color: Colors.red,
    //       child: Text('data1'),
    //     ),
    //     Container(
    //       height: 500,
    //       color: Colors.blue,
    //       child: Text('data2'),
    //     ),
    //     Container(
    //       height: 500,
    //       color: Colors.red,
    //       child: Text('data1'),
    //     ),
    //     Container(
    //       height: 500,
    //       color: Colors.blue,
    //       child: Text('data2'),
    //     ),
    //     Container(
    //       height: 500,
    //       color: Colors.red,
    //       child: Text('data1'),
    //     ),
    //     Container(
    //       height: 500,
    //       color: Colors.blue,
    //       child: Text('data2'),
    //     ),
    //     Container(
    //       height: 500,
    //       color: Colors.red,
    //       child: Text('data1'),
    //     ),
    //     Container(
    //       height: 500,
    //       color: Colors.blue,
    //       child: Text('data2'),
    //     ),
    //     ListviewTextClass(),
    //   ],
    // );
  }
}



class ListviewTextClass extends StatefulWidget {
  ListviewTextClass({Key key}) : super(key: key);

  _ListviewTextClassState createState() => _ListviewTextClassState();
}

class _ListviewTextClassState extends State<ListviewTextClass> {
  @override
  void initState() {
    super.initState();
    print('-------ListviewTextClass  initState');
  }
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('测试什么时候加载！'),
    );
  }
}