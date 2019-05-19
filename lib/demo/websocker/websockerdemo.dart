import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math' show Random;
import 'package:flutter/foundation.dart';
import 'package:web_socket_channel/io.dart';
import 'package:flutter/material.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttershuachi/store/app/AppState.dart';
import '../../store/module/auth/action.dart';
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
  
  
  
  _WebSockerDemoState createState() => _WebSockerDemoState();
}

class _WebSockerDemoState extends State<WebSockerDemo> {
  TextEditingController _controller = new TextEditingController();
  Timer _time;
  WebSocket ws;
  IOWebSocketChannel channel;
  // final IOWebSocketChannel channel = IOWebSocketChannel(ws);
  // Future connection() async {
  //   try {
  //     ws = await WebSocket.connect('ws://192.168.9.55:8181');
  //     // ws = await WebSocket.connect('ws://echo.websocket.org');
  //     // ws = await WebSocket.connect('wss://git-debug.shuachi.com/wss');
  //   } catch (e) {
  //     return false;
  //   }
  //   ws.listen(
  //     (data) {
  //       print(data);
  //       analyzeData(data);
  //     },
  //     onDone: () {
  //       print('ws close onDone');
  //       reconnect();
  //     },
  //     onError: (error) {
  //       print('ws close error = $error');
  //     },
  //   );
  //   return ws;
  // }
  // reconnect() {
  //   connection().then((onValue){
  //     if(onValue == false){
  //       print('断线重连！！！');
  //       Timer(Duration(seconds: 10), (){reconnect();});
  //     }else{
  //       ws = onValue;
  //     }
  //   });
  // }
  Store<AppState> _getStore() {
    if (context == null) {
      print("YYState null");
      return null;
    }
    return StoreProvider.of(context);
  }
  connection() {
    channel = IOWebSocketChannel.connect("ws://192.168.9.55:8181");
    print(channel.readyState);
    channel.stream.listen((message) {
      print('$message  ------${channel.readyState}');

      _getStore()?.dispatch(LoginSuccessAction(account: '更新完了吗？$message'));
      print(_getStore().state.authState.account);

    },onDone: (){
      print('onDone');
    },onError: (e) {
      print('onError');
    });
    
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    connection();
    _time = Timer.periodic(Duration(seconds: 3),(_){
      if(channel == null || channel.readyState != 1){
        print('断线重连！！！');
        connection();
      }
      
    });
    
  }


  analyzeData(data) {
    if(data == null) return;
    var returnobject = json.decode(data);
    // print(returnobject);
    if(returnobject['aa'] != null){
      print('aa start ${returnobject['aa']}');
    }
    if(returnobject['bb'] != null){
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
            // new StreamBuilder(
            //   stream: channel.stream,
            //   builder: (context, snapshot) {
            //     // print('${snapshot.hasData}');
            //     // print('${snapshot.connectionState}');
            //     analyzeData(snapshot.data);
            //     return new Padding(
            //       padding: const EdgeInsets.symmetric(vertical: 24.0),
            //       child: Text(snapshot.hasData ? '${snapshot.data}' : ''),
            //     );
            //   },
            // )
            IconButton(
              icon: Icon(Icons.add),
              onPressed: (){
                connection();
              },
            ),
            StoreConnector<AppState,String>(
              converter: (store) => store.state.authState.account,
              builder: (context, count) {
                return Text(
                  count.toString(),
                  style: Theme.of(context).textTheme.display1,
                );
              },
            ),
          ],
        ),
      ),
      
      floatingActionButton: new FloatingActionButton(
        onPressed: (){
          Map test = {
            'sid':'session.1633499165045705',
            'sign': 'bdd36e8ec54df845f83528883c594607',
            'device_id': '1a67efe36a6965ac',
          };
          // channel.sink.add(json.encode(test));
          channel.sink.close();
          
        },
        tooltip: 'Send message',
        child: new Icon(Icons.send),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      // channel.sink.add(_controller.text);
    }
  }

  

  @override
  void dispose() {

    if(_time != null){
      _time.cancel();
    }
    if(channel != null){
      channel.sink.close();
    }
    // print(channel.closeCode);
    // print(channel.closeReason);
    // channel.sink.close();
    // print(channel.closeCode);
    // print(channel.closeReason);
    super.dispose();
    
  }
}


