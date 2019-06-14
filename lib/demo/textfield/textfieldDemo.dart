import 'package:flutter/material.dart';

class TextFieldDemo extends StatefulWidget {
  TextFieldDemo({Key key}) : super(key: key);

  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  TextEditingController textController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextFieldDemo'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            TextField(
              autofocus: false,
              maxLines: 4,
              controller: textController,
            ),
            FlatButton(
              child: Icon(Icons.arrow_left),
              onPressed: (){
                print(textController.selection.baseOffset);  //获取光标位置
                // textController.selection = TextSelection.collapsed(offset: 20);   //设置光标位置
              },
            )
          ],
        )
      ),
    );
  }
}
