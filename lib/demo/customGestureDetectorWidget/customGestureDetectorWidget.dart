import 'package:flutter/material.dart';



class CustomGestureDetectorDemo extends StatefulWidget {
  CustomGestureDetectorDemo({Key key,this.child}) : super(key: key);
  final Widget child;

  _CustomGestureDetectorDemoState createState() => _CustomGestureDetectorDemoState();
}

class _CustomGestureDetectorDemoState extends State<CustomGestureDetectorDemo> {
  Map recordCoordinate = {'scrollStart': 0, 'scrollEnd': 0};

  _onHorizontalDragStart(BuildContext context,DragStartDetails start){
    recordCoordinate['scrollStart'] = start.globalPosition.dx;
    // print(start);
  }

  _onHorizontalDragUpdate(BuildContext context,DragUpdateDetails update){
    recordCoordinate['scrollEnd'] = update.globalPosition.dx;
    // print(update);
  }

  _onHorizontalDragEnd(BuildContext context,DragEndDetails end) {
    if(recordCoordinate['scrollStart'] - recordCoordinate['scrollEnd'] < -100){
      Navigator.of(context).pop();
      print('右滑');
    }
    if(recordCoordinate['scrollStart'] - recordCoordinate['scrollEnd'] > 100){
      print('左滑');
    }
    print(end);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (DragStartDetails start) {
        _onHorizontalDragStart(context, start);
      },
      onHorizontalDragUpdate: (DragUpdateDetails update) {
        _onHorizontalDragUpdate(context, update);
      },
      onHorizontalDragEnd: (DragEndDetails end) {
        _onHorizontalDragEnd(context,end);
      },
      child: widget.child,
    );
  }
}
