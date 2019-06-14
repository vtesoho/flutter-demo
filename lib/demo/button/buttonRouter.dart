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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('buttonRouter'),
      ),
      body: Center(
        child: Wrap(
          children: <Widget>[
            FlatButton(
              child: Text('testToast'),
              onPressed: () {
                
              },
            ),
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
