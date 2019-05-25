import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/router/topReminder.dart';

import 'package:fluttershuachi/demo/widget/snackBar.dart';

class WidgetAll extends StatelessWidget {
  const WidgetAll({Key key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WidgetAllDemo'),
      ),
      body: Container(
        child: Wrap(
          children: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SnackBarDemo(),
                  )
                );
              },
              child: Text('snackbar'),
            ),
            FlatButton(
              onPressed: (){
                openTopReminder(context,'snackbar测试toprminder');
              },
              child: Text('snackbar'),
            ),
            

          ],
        ),
      ),
    );
  }


}