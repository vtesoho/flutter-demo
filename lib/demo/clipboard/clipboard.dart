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
    return Container(
      child: Column(
        children: <Widget>[
          Text('$clipborad'),
          Row(
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: (){
                  ClipboardData data = new ClipboardData(text:"测试剪贴板复制功能");
                  Clipboard.setData(data);
                },
              ),
              IconButton(
                icon: Icon(Icons.event),
                onPressed: (){
                  getClipboardContents();
                },
              )
            ],
          )
        ],
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