import 'package:flutter/material.dart';

class Test_b extends StatelessWidget {
  final String title;
  Test_b({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Container(
              child: Row(
                children: <Widget>[
                  builscolumn(Icons.add_comment, color: Colors.orange),
                  builscolumn(Icons.add_comment, flex: 2, color: Colors.orange),
                  builscolumn(Icons.add_comment, flex: 5, color: Colors.orange)
                ],
              ),
              color: Colors.orange,
            )));
  }

  Widget builscolumn(IconData icon, {int flex = 1, Color color}) {
    return new Expanded(
      child: new Container(
        child: new Icon(icon),
      ),
      flex: flex,
    );
  }
}
