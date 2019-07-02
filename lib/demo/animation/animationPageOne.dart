import 'package:flutter/material.dart';

class AnimationPageOne extends StatefulWidget {
  AnimationPageOne({Key key}) : super(key: key);

  _AnimationPageOneState createState() => _AnimationPageOneState();
}

class _AnimationPageOneState extends State<AnimationPageOne> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  Animation<double> animationone;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 500),vsync: this,);
    animation = Tween<double>(begin: 1.5, end: 1.0).animate(controller);
    animationone = Tween<double>(begin: 1.0, end: 1.5).animate(controller);
    controller.forward();
    controller.addStatusListener((state){
      if(AnimationStatus.completed == state){
        controller.reverse();
      }else if(state==AnimationStatus.dismissed){
        controller.forward();
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationPageOne'),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            AnimatedBuilder(
              animation: animation,
              builder: (BuildContext context, Widget child) {
                return Row(
                  children: <Widget>[
                    Transform.scale(
                      scale: animation.value,
                      child: Image.asset('images/on.png'),
                    ),
                    Transform.scale(
                      scale: animationone.value,
                      child: Image.asset('images/off.png'),
                    ),
                  ],
                );
              },
            ),
            Transform.scale(
              scale: 1.5,
              child: Image.asset('images/on.png'),
            ),
            Transform.scale(
              scale: 1.0,
              child: Image.asset('images/off.png'),
            ),
          ],
        ),
      ),
    );
  }
}