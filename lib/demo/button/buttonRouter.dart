import 'package:flutter/material.dart';

class ButtonRouter extends StatelessWidget{
  final Widget _floatingActionButton = FloatingActionButton(
    onPressed: (){
      print('onPressed FloatingActionButton');
    },
    child: Icon(Icons.add),
    elevation: 0.2,  //阴影
    backgroundColor: Colors.black26, //按纽背景颜色 
    shape: BeveledRectangleBorder(
      borderRadius: BorderRadius.circular(30.0)
    ),  //按纽的形状
  );
  
  //extended 一个可以带文字的浮动按纽
  final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
    onPressed: (){},
    icon: Icon(Icons.add),
    label: Text('add'),
  );

  final Widget flatButton = Row(
    children: <Widget>[
      //文字按纽
      FlatButton(  
        child: Text('FlatButton'),
        //如果 为null则按纽为禁用状态
        // onPressed: null,
        onPressed: () {
          print('onPressed FlatButton');
        },
        splashColor: Colors.red,   //点击按纽的颜色 
        textColor: Colors.blue,   //文字的颜色 
      ),
      //一个文字带icon的按纽
      FlatButton.icon(
        icon: Icon(Icons.brush),
        label: Text('FlatButton'),
        onPressed: () {
          print('onPressed FlatButton');
        },
      ),
    ],
  );

  final Widget raisedButton = Row(
    children: <Widget>[
      RaisedButton(
        child: Text('RaisedButton'),
        onPressed: (){},
        splashColor: Colors.red,
        color: Colors.blue,  //按纽填充颜色 
        textColor: Colors.white,
        // shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shape: StadiumBorder(),  //一个圆形的形状
      ),
      SizedBox(
        width: 5,
      ),
      RaisedButton.icon(
        icon: Icon(Icons.add),
        label: Text('RaisedButton'),
        onPressed: (){},
        elevation: 10,
        splashColor: Colors.red,
        highlightColor: Colors.yellow,  //高亮状态下的颜色
      ),
    ],
  );

  final Widget outlineButton = Row(
    children: <Widget>[
      OutlineButton(
        child: Text('RaisedButton'),
        onPressed: (){},
        splashColor: Colors.grey[100],
        color: Colors.blue,  //按纽填充颜色 
        textColor: Colors.black,
        borderSide: BorderSide(color: Colors.black),
        highlightedBorderColor: Colors.red,   //高亮状态下的边框颜色 
        shape: StadiumBorder(),
      ),
      SizedBox(
        width: 5,
      ),
      OutlineButton.icon(
        icon: Icon(Icons.add),
        label: Text('RaisedButton'),
        onPressed: (){},
        splashColor: Colors.red,
      ),
    ],
  );

  //设置按纽的宽度
  final Widget fixedWidthButton = Column(
    children: <Widget>[
      Container(
        width: 300,
        child: OutlineButton(
          child: Text('RaisedButton'),
          onPressed: (){},
          splashColor: Colors.grey[100],
          color: Colors.blue,  //按纽填充颜色 
          textColor: Colors.black,
          borderSide: BorderSide(color: Colors.black),
          highlightedBorderColor: Colors.red,   //高亮状态下的边框颜色 
          shape: StadiumBorder(),
        )
      ),
      Row(
        children: <Widget>[
          Expanded(
            child: OutlineButton(
              child: Text('RaisedButton'),
              onPressed: (){},
              splashColor: Colors.grey[100],
              color: Colors.blue,  //按纽填充颜色 
              textColor: Colors.black,
              borderSide: BorderSide(color: Colors.black),
              highlightedBorderColor: Colors.red,   //高亮状态下的边框颜色 
              shape: StadiumBorder(),
            )
          ),
          Expanded(
            flex: 2,
            child: OutlineButton(
              child: Text('RaisedButton'),
              onPressed: (){},
              splashColor: Colors.grey[100],
              color: Colors.blue,  //按纽填充颜色 
              textColor: Colors.black,
              borderSide: BorderSide(color: Colors.black),
              highlightedBorderColor: Colors.red,   //高亮状态下的边框颜色 
              shape: StadiumBorder(),
            )
          ),
        ],
      )
      
    ],
  );

  //一个按纽组，其实就是封闭在了一个row里面
  final Widget buttonBar = ButtonBar(
    alignment: MainAxisAlignment.center,
    children: <Widget>[
      RaisedButton(
        child: Text('Button'),
        onPressed: (){},
        elevation: 10,
        splashColor: Colors.red,
        highlightColor: Colors.yellow,  //高亮状态下的颜色
      ),
      RaisedButton(
        child: Text('Button'),
        onPressed: (){},
        elevation: 10,
        splashColor: Colors.red,
        highlightColor: Colors.yellow,  //高亮状态下的颜色
      ),
      RaisedButton(
        child: Text('Button'),
        onPressed: (){},
        elevation: 10,
        splashColor: Colors.red,
        highlightColor: Colors.yellow,  //高亮状态下的颜色
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('buttonRouter'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            flatButton,
            raisedButton,
            outlineButton,
            fixedWidthButton,
            buttonBar,
          ],
        ),
      ),
      floatingActionButton: _floatingActionButton,  //一个浮动的按纽
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,  //与底部工具栏重叠并居中
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,  //居中
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,  //靠右
      // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,  //居右靠顶
      // floatingActionButtonLocation: FloatingActionButtonLocation.miniStartTop,  //居左靠顶
      // floatingActionButtonLocation: FloatingActionButtonLocation.startTop,  //居左靠顶
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,  //与底部工具栏重叠并靠右
      
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height:80
        ),
      ),
    );
  }
}
