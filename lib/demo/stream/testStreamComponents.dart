
//测试stream组件化数据传输
import 'package:flutter/material.dart';

class TestStreamComponents extends StatefulWidget {
  final Stream stream;
  TestStreamComponents({Key key,this.stream}) : super(key: key);

  _TestStreamComponentsState createState() => _TestStreamComponentsState();
}

class _TestStreamComponentsState extends State<TestStreamComponents> {
  @override
  void initState() {
    
    // TODO: implement initState
    super.initState();
    widget.stream.listen((data) {
      print('data  ${data}');
    });
    
  }
  @override
  Widget build(BuildContext context) {
    // return Container();
    return StreamBuilder(
      stream: widget.stream ,
      initialData: null ,
      builder: (BuildContext context, AsyncSnapshot snapshot){
        if(snapshot.data == null){
          return Container(child: Text('初始数据'),);
        }else{
          return Container(
            child: Text('${snapshot.data}'),
          );
        }
      },
    );
  }
}