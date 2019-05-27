import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttershuachi/demo/router/formatTest.dart';
import 'package:fluttershuachi/demo/router/oktoast.dart';
import 'package:fluttershuachi/demo/toast/toastDemo.dart';
import 'package:redux/redux.dart';
import '../store/app/AppState.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Timer(Duration(seconds: 5), () {
    //   print('这是一个SnackBar');
    //   // openTopReminder(context,'这是一个测试');
    //   showDialog<Null>(
    //     context: context, //BuildContext对象
    //     barrierDismissible: false,
    //     builder: (BuildContext context) {
    //       return Text('data');
    //     },
    //   );
    // });
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
                Navigator.of(context).pushNamed('/listview');
              },
              child: Text('listview'),
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
                Toast(contextData: context);
                Toast().show();
              },
              child: Text('Toast Test'),
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
}
