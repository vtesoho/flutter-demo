import 'package:flutter/material.dart';

class curtomTopReminder extends StatefulWidget {
  Widget child;
  curtomTopReminder({Key key,this.child}) : super(key: key);

  _curtomTopReminderState createState() => _curtomTopReminderState();
}

class _curtomTopReminderState extends State<curtomTopReminder> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: 0,
          left:0,
          height: double.infinity,
          width: double.infinity,
          child: widget.child,
        ),
      ],
    );
  }
}