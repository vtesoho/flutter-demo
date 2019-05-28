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
    ToastNotifi(contextData: context);
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
                ToastNotifi().show(child: toastWidget());
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


  Widget toastWidget (){
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
