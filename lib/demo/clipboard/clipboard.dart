import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClipboardDemo extends StatefulWidget {
  ClipboardDemo({Key key}) : super(key: key);

  _ClipboardDemoState createState() => _ClipboardDemoState();
}

class _ClipboardDemoState extends State<ClipboardDemo> {
  String clipborad;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clipboard'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text('$clipborad'),
            Row(
              children: <Widget>[
                FlatButton(  
                  child: Text('copy'),
                  //如果 为null则按纽为禁用状态
                  // onPressed: null,
                  onPressed: () {
                    Clipboard.setData(new ClipboardData(text: 'asdfasfasfasfasdfasdfasdf'));
                  },
                  splashColor: Colors.red,   //点击按纽的颜色 
                  textColor: Colors.blue,   //文字的颜色 
                ),
                FlatButton(  
                  child: Text('paste'),
                  //如果 为null则按纽为禁用状态
                  // onPressed: null,
                  onPressed: () {
                    getClipboardContents();
                  },
                  splashColor: Colors.red,   //点击按纽的颜色 
                  textColor: Colors.blue,   //文字的颜色 
                ),
              ],
            )
          ],
        ),
      ),
    );
  }



  getClipboardContents() async { ///使用异步调用获取返回值
    var clipboardData = await Clipboard.getData(Clipboard.kTextPlain);
    if (clipboardData != null) {
      ///调用Flutter的State重新赋值加载界面
      this.setState(() {
        clipborad = clipboardData.text;
      });
    }
  }
}