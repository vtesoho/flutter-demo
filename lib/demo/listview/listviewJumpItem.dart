import 'package:flutter/material.dart';

class ListviewJumpItem extends StatefulWidget {
  ListviewJumpItem({Key key}) : super(key: key);

  _ListviewJumpItemState createState() => _ListviewJumpItemState();
}

class _ListviewJumpItemState extends State<ListviewJumpItem> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('测试跳转到item'),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Container(
              height: 340,
              key: ValueKey(1),
              color: Colors.red,
              child: Text('data1'),
            ),
            Container(
              height: 300,
              key: ValueKey(2),
              color: Colors.blue,
              child: Text('data1'),
            ),
            Container(
              height: 330,
              key: ValueKey(3),
              color: Colors.red,
              child: Text('data1'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          
        },
      ),

    );
    
  }
}