import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../store/app/AppState.dart';

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
                return Text('isLogin:${state.authState.isLogin}  account: ${state.authState.account}');
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

