import 'package:flutter/material.dart';

class RichTextDemo extends StatelessWidget {
  const RichTextDemo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('richtextDemo'),
      ),
      body: Container(
        child: RichText(
          text: TextSpan(
            text: 'Flutter',
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: ' allows you',
                style: TextStyle(
                  color: Colors.green,
                  decoration: TextDecoration.underline,
                  decorationStyle: TextDecorationStyle.solid,
                ),
              ),
              TextSpan(
                  text: ' to build beautiful native apps',
                  style: TextStyle(
                    fontSize: 18,
                  )),
              TextSpan(
                  text: ' on iOS and Android',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(
                  text: ' from a single codebase.',
                  style: TextStyle(
                    shadows: [
                      Shadow(color: Colors.black38, offset: Offset(3, 3))
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
