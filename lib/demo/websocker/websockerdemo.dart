import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';


/* 
增加了一个server服务，用node跑起来连接测试用。
var WebSocketServer = require('ws').Server,
wss = new WebSocketServer({ port: 8181 });
wss.on('connection', function (ws) {
  console.log('client connected');
  var sendStockUpdates = function (ws,index) {

    var stocksObj = {
      'aa': 22,
      'bb': index,
    }
    if (ws.readyState == 1) {
      if (stocksObj.length !== 0) {
        ws.send(JSON.stringify(stocksObj));//需要将对象转成字符串。WebSocket只支持文本和二进制数据
        console.log("更新", JSON.stringify(stocksObj));
      }
    }
  }
  var index = 0;
  var clientStockUpdater = setInterval(function () {
    sendStockUpdates(ws,index);
    index++;
  }, 1000);
  ws.on('message', function (message) {
    console.log(message);
    sendStockUpdates(ws);
  });
});
*/

class WebSockerDemo extends StatefulWidget {
  WebSockerDemo({Key key}) : super(key: key);
  final WebSocketChannel channel = IOWebSocketChannel.connect('ws://192.168.9.55:8181');
  
  
  _WebSockerDemoState createState() => _WebSockerDemoState();
}

class _WebSockerDemoState extends State<WebSockerDemo> {
  TextEditingController _controller = new TextEditingController();
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.channel.stream.listen((onData){
      print('onData');
    });
  }
  analyzeData(data) {
    if(data == null) return;
    var returnobject = json.decode(data);
    // print(returnobject);
    if(returnobject['aa'] != ''){
      print('aa start ${returnobject['aa']}');
    }
    if(returnobject['bb'] != ''){
      print('bb start ${returnobject['bb']}');
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('websockerdemo'),
      ),
      body: new Padding(
        padding: const EdgeInsets.all(20.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Form(
              child: new TextFormField(
                controller: _controller,
                decoration: new InputDecoration(labelText: 'Send a message'),
              ),
            ),
            new StreamBuilder(
              stream: widget.channel.stream,
              builder: (context, snapshot) {
                // print('${snapshot.hasData}');
                // print('${snapshot.connectionState}');
                analyzeData(snapshot.data);
                return new Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: new Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      widget.channel.sink.add(_controller.text);
    }
  }

  @override
  void dispose() {
    widget.channel.sink.close();
    super.dispose();
    
  }
}




