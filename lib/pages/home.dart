import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttershuachi/demo/redux/reducers.dart';
import 'package:redux/redux.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
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
                Navigator.of(context).pushNamed('/redux');
              },
              child: Text('reduxDemo'),
            ),
            Container(
              child: new StoreConnector<AppState,AppState>(builder: (BuildContext context,AppState state){
                
                // print("isLogin:${state.auth.isLogin}");
                return Text('isLogin:${state.auth.isLogin}  account: ${state.auth.account}');
              }, converter: (Store<AppState> store){
                return store.state;
              },),
            ),
          ],
        ),
      ),
    );
  }
}

