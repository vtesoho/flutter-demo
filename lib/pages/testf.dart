import 'package:flutter/material.dart';

class Testf extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: '学习flutter',
      theme: new ThemeData(
        primaryColor: Colors.blue
      ),
      home: new MyHomePage(title: 'aaaa'),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) :super(key:key);
  final String title;
  @override
  _MyHomePage createState() => _MyHomePage();

}

class _MyHomePage extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.add),
        title: Center(
          child: Container(
            child:Text('Hello'),
          ),
        )
      ),
      body: ListView(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Icon(Icons.add),
                  Text('test'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.add),
                  Text('test'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.add),
                  Text('test'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.add),
                  Text('test'),
                ],
              ),
              Column(
                children: <Widget>[
                  Icon(Icons.add),
                  Text('test'),
                ],
              )
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Flexible(
                child: Icon(
                  Icons.add_comment,
                  size: 80,
                ),
                flex: 1,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('标题'),
                    Text('内容内容内容内容内容内容内容'),
                  ],
                ),
                flex: 2,
              ),
              Flexible(
                flex:1,
                child: Container(
                  child: Text('2019-3-12'),
                ),
              ),
              
            ],

          )
        ],
        
      )
    );
  }
}