import 'package:flutter/material.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('layout_demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ConstrainedBoxDemo(),
            Padding()
          ],
        )
      )
      
      
    );
  }
}


class ConstrainedBoxDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 200.0,
        maxWidth: 200.0,
      ),
      child: Container(
        color: Colors.yellow,
      ),
    );
  }
}


class AspectRatioDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: Container(
        color: Colors.red,
      ),
    );
  }
} 


class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        SizedBox(
          width:300,
          height:300,
          child: Container(
            alignment: Alignment(-1.0, 0),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Icon(Icons.ac_unit, color: Colors.white, size:32.0),
          ),
        ),
        SizedBox(height: 10,),
        SizedBox(
          width:100,
          height:100,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [
                  Colors.blue,
                  Colors.red,
                ]
              )
            ),
            child: Icon(Icons.ac_unit, color: Colors.white, size:32.0),
          ),
        ),
        Positioned(
          right: 20,
          top: 222,
          child: Icon(Icons.ac_unit, color: Colors.white, size:32.0),
        )
      ],
    );
  }
}


class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;

  IconBadge(this.icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon,size:size, color: Colors.white),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(10, 100, 255, 1.0)
    );
  }
}