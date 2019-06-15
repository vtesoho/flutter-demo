import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MessageChannelDemo extends StatefulWidget {
  final String initParams;
  MessageChannelDemo({Key key,this.initParams}) : super(key: key);

  _MessageChannelDemoState createState() => _MessageChannelDemoState();
}

class _MessageChannelDemoState extends State<MessageChannelDemo> {
  //native往dart端传递的channel
  static const EventChannel _eventChannelPlugin = EventChannel('EventChannelPlugin');

  //dart一次性调用的channel
  static const MethodChannel _methodChannelPlugin = MethodChannel('MethodChannelPlugin');

  //可双向传递的channel
  static const BasicMessageChannel<String> _basicMessageChannel = const BasicMessageChannel('BasicMessageChannelPlugin', StringCodec());
  
  String showMessage = '';
  StreamSubscription _streamSubscription;
  bool _isMethodChannelPlugin = false;
  @override
  void initState() {
    _streamSubscription = _eventChannelPlugin.receiveBroadcastStream('123').listen(_onToDart,onError:_onToDartError);

    _basicMessageChannel.setMessageHandler((String message) => Future<String>((){
      setState(() {
        showMessage = '_basicMessageChannel' + message;
      });
      return '收到Native的消息:' + message;
    }));
    super.initState();
  }

  void _onToDart(message) {
    setState(() {
      showMessage = message;
    });
  }

  void _onToDartError (error) {
    print(error);
  }
  void _onChanelChanged(bool value) {
    setState(() {
      _isMethodChannelPlugin = value;
    });
  }
  void _onTextChange(value) async{
    String response;
    try {
      if(_isMethodChannelPlugin) {
        response = await _methodChannelPlugin.invokeMethod('send',value);
      }else{
        response = await _basicMessageChannel.send(value);
      }
    } on PlatformException catch (e) {
      print(e);
    }
  }
  @override
  void dispose() {
    super.dispose();
    _streamSubscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('messagechannel'),
      ),
      body: Container(
        alignment: Alignment.topCenter,
        decoration: BoxDecoration(
          color: Colors.lightBlueAccent,
        ),
        margin: EdgeInsets.only(top:70),
        child: Column(
          children: <Widget>[
            SwitchListTile(
              value: _isMethodChannelPlugin,
              onChanged: _onChanelChanged,
              title: Text(_isMethodChannelPlugin ? 'MethodChannelPlugin' : 'BasicMessageChannelPlugin'),
            ),
            TextField(
              onChanged: _onTextChange,
            ),
            Text(
              '收到的初始参数initParams: ${widget.initParams}',
            ),
            Text(
              'Native传过来的数据 : $showMessage',
            ),
          ],
        ),
      ),
    );
  }
}