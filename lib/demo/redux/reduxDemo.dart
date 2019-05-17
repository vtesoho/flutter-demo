import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:async' as Async;

import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttershuachi/demo/redux/reducers.dart';
import 'package:redux/redux.dart';

typedef Future CallLogin(String userName, String pwd);

class ReduxDemo extends StatefulWidget {
  final CallLogin callLogin;

  ReduxDemo({Key key, this.callLogin}) : super(key: key);

  _ReduxDemoState createState() => _ReduxDemoState();
}

class _ReduxDemoState extends State<ReduxDemo> {
  String _userName;
  String _pwd;
  bool isLogin;

  _handlePress(s, context) => () async {
        FormState state = Form.of(s.context);
        if (state.validate()) {
          // 验证通过
          state.save();
          print('login success');
          try {
            if (_pwd != "123456") {
              throw ("登录失败，密码必须是123456");
            }
            print("登录成功!$_userName");
            StoreConnector(
                builder: (BuildContext context, Store<AppState> store) {
              print('执行没有');
              store.dispatch(new LoginSuccessAction(account: 'asdfasfasdf'));
            }, converter: (Store<AppState> store) {
              return store;
            });

            showDialog(
                context: context,
                builder: (c) {
                  return CupertinoAlertDialog(
                    title: Text('登陆成功'),
                    actions: <Widget>[
                      Center(
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('I Know'),
                        ),
                      )
                    ],
                  );
                });
          } catch (e) {
            showDialog(
              context: context,
              builder: (c) {
                return CupertinoAlertDialog(
                  title: Text('登陆失败'),
                  actions: <Widget>[
                    Center(
                      child: RaisedButton(
                        child: Text('ok'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    )
                  ],
                );
              },
            );
          }
        }
      };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登陆'),
      ),
      body: Center(
        child: Form(
          onChanged: () {
            print('change');
          },
          onWillPop: () async {
            return true;
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: '请输入用户名'),
                  onSaved: (String name) {
                    _userName = name;
                  },
                  validator: (String name) => name.isEmpty ? "请输入用户名" : null,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: '请输入密码'),
                  onSaved: (String pwd) {
                    _pwd = pwd;
                  },
                  validator: (String name) => name.isEmpty ? "请输入密码" : null,
                ),
                FormField(
                  builder: (FormFieldState fState) {
                    return Center(
                      child: StoreConnector(builder:
                          (BuildContext context, Store<AppState> store) {
                        return RaisedButton(
                          child: Text('登录'),
                          onPressed: () {
                            store.dispatch(new LoginSuccessAction(
                                account: 'asdfasdfasdf'));
                          },
                        );
                      }, converter: (Store<AppState> store) {
                        return store;
                      }),
                    );
                  },
                ),
                FormField(
                  builder: (FormFieldState fState) {
                    return Center(
                      child: StoreConnector(builder:
                          (BuildContext context, Store<AppState> store) {
                        return RaisedButton(
                          child: Text('登出'),
                          onPressed: () {
                            store.dispatch(Actions.LogoutSuccess);
                          },
                        );
                      }, converter: (Store<AppState> store) {
                        return store;
                      }),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
