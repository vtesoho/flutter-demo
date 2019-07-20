import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttershuachi/dart/dartHome.dart';
import 'package:fluttershuachi/dart/dartRouter.dart';
import 'package:fluttershuachi/demo/animation/animationRouter.dart';
import 'package:fluttershuachi/demo/button/buttonRouter.dart';
import 'package:fluttershuachi/demo/clipboard/clipboradRouter.dart';
import 'package:fluttershuachi/demo/font/fontRouter.dart';
import 'package:fluttershuachi/demo/life_cycle/lifeCycleDemo.dart';
import 'package:fluttershuachi/demo/listview/listviewRouter.dart';
import 'package:fluttershuachi/demo/messagechannel/messageChannel.dart';
import 'package:fluttershuachi/demo/networkType/networkTypeRouter.dart';
import 'package:fluttershuachi/demo/ping/pingRouter.dart';
import 'package:fluttershuachi/demo/router/formatTest.dart';
import 'package:fluttershuachi/demo/stream/stream_demo.dart';
import 'package:fluttershuachi/demo/test/testRouterDemo.dart';
import 'package:fluttershuachi/demo/textfield/textfieldDemo.dart';
import 'package:fluttershuachi/demo/toast/customToast.dart';
import 'package:fluttershuachi/demo/toast/oktoast.dart';
import 'package:fluttershuachi/demo/test/publistStatus.dart';
import 'package:fluttershuachi/demo/toast/toastDemo.dart';
import 'package:fluttershuachi/demo/toast/toastRouterDemo.dart';
import 'package:redux/redux.dart';
import '../store/app/AppState.dart';

class Home extends StatelessWidget {
  String initParams;
  Home({this.initParams});
  
  @override
  Widget build(BuildContext context) {
    CustomToast(contextData: context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Wrap(
          spacing: 3.0,
          runSpacing: 3.0,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DartHome(),
                  ),
                );
              },
              child: Text('DartHome'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/form');
              },
              child: Text('form'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/websocker');
              },
              child: Text('websocker'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/random');
              },
              child: Text('random'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/router');
              },
              child: Text('router'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/redux');
              },
              child: Text('reduxDemo'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/widget');
              },
              child: Text('widget'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RegExpDemo(),
                  ),
                );
              },
              child: Text('RegExpDemo'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OkToastDemo(),
                  ),
                );
              },
              child: Text('OkToastDemo'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ToastRouterDemo(),
                  ),
                );
              },
              child: Text('ToastRouterDemo'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TestRouterDemo(),
                  ),
                );
              },
              child: Text('TestRouterDemo'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TextFieldDemo(),
                  ),
                );
              },
              child: Text('TextFieldDemo'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ButtonRouter(),
                  ),
                );
              },
              child: Text('ButtonRouter'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MessageChannelDemo(initParams:initParams),
                  ),
                );
              },
              child: Text('MessageChannel'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StreamDemo(),
                  ),
                );
              },
              child: Text('stream'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListviewRouter(),
                  ),
                );
              },
              child: Text('ListviewRouter'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AnimationRouter(),
                  ),
                );
              },
              child: Text('animation'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FontRouter(),
                  ),
                );
              },
              child: Text('font'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NetworkTypeRouter(),
                  ),
                );
              },
              child: Text('NetworkType'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DartRouter(),
                  ),
                );
              },
              child: Text('Dart'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PingRouter(),
                  ),
                );
              },
              child: Text('Ping'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClipboradRouter(),
                  ),
                );
              },
              child: Text('粘贴板'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ClipboradRouter(),
                  ),
                );
              },
              child: Text('uikitview'),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LifeCycleDemo(),
                  ),
                );
              },
              child: Text('lifecycle'),
            ),
            
            
            Container(
              child: new StoreConnector<AppState, AppState>(
                builder: (BuildContext context, AppState state) {
                  return Text(
                      'isLogin:${state.authState.isLogin}  account: ${state.authState.account}');
                },
                converter: (Store<AppState> store) {
                  return store.state;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget toastWidget() {
    return Container(
      width: double.infinity,
      height: 85.0,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Material(
        color: Colors.white.withOpacity(0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.white.withOpacity(0.95),
            boxShadow: [
              BoxShadow(
                color: Color(0xff000000).withOpacity(0.1),
                blurRadius: 5.0,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    left: 8.0, right: 8.0, top: 5.0, bottom: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '刷吃',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // colse();
                        ToastNotifi().dismiss();
                        print('aaaaaaaaaaaaaaaaaaa');
                      },
                      child: Text(
                        '关闭',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Text(
                  '111111111111',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  '222222222222222222222',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
