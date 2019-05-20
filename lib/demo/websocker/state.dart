import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketState {
  String url; //wsURL连接
  IOWebSocketChannel channel;  //连接
  Timer _time;  //轮循检测时间
  Timer _timeone;  //重连间隔时间
  var callback; //传入处理返回数据的方法
  WebSocketState({this.url = 'ws://192.168.9.55:8181',@required this.callback});

  //连接方法
  _connection() {
    channel = IOWebSocketChannel.connect(url);
    print(channel.readyState);
    channel.stream.listen((message) {
      callback(message);
      // print('websocker服务器返回数据 ---  $message  ------${channel.readyState}');
      // 返回的是一个对象

    },onDone: (){
      print('onDone');
    },onError: (e) {
      print('onError');
    });
  }
  //连接保护方法，自动重连
  _reconnection() {
    _time = Timer.periodic(Duration(seconds: 3),(_){
      if(_timeone == null){
        if(channel == null || channel.readyState != 1){
          int randomnum = Random().nextInt(5) + 5;
          _timeone = Timer(Duration(seconds: randomnum),(){
            _timeone = null;
            _connection();
          });
        }  
      }
    });
  }


  //连接统一执行方法
  start(){
    _connection();
    _reconnection();
  }

  close() {
    if(_time != null){
      _time.cancel();
    }
    if(_timeone != null){
      _timeone.cancel();
    }
    channel.sink.close();
  }

  

}



