import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/toast/customToast.dart';


class ToastRouterDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('router'),
      ),
      body: Center(
        child: Wrap(
          children: <Widget>[
            FlatButton(
              child: Text('testToast'),
              onPressed: () {
                CustomToast().show(msg: 'ssssdfsfasfasd');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class RouterPageOne extends StatelessWidget{
  final String title;
  RouterPageOne({this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}