import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Container(
        height:500,
        width:300,
        decoration: BoxDecoration(
          image:DecorationImage(
            image:NetworkImage('http://pic19.nipic.com/20120321/3001435_141555714185_2.jpg'),
            alignment: Alignment.bottomCenter,
            // repeat: ImageRepeat.repeatY
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.lightGreenAccent, BlendMode.plus)
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // Chip(
            //   label: Text('string', style: new TextStyle(fontSize: 16.0)),
            //   avatar: Icon(Icons.search),
            //   deleteIcon: Icon(Icons.clear, color: Colors.black12),
            //   labelPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            //   onDeleted: () {
            //     print('delete');
            //   },
            // ),
            Container(
              child: Icon(Icons.pool,size:32,color: Colors.white),
              padding: EdgeInsets.all(10),
              width: 90,
              height:90,
              decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                border: Border.all(
                  color: Colors.red,
                ),
                // borderRadius: BorderRadius.circular(16.0),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(6.0, 7.0),
                    color: Color.fromRGBO(125, 125, 125, 0.8),
                    blurRadius: 10.0,
                    spreadRadius: 5,
                  ),
                  BoxShadow(
                    offset: Offset(-5, 0),
                    color:Colors.red,
                    blurRadius: 1.0,
                    spreadRadius: 1,
                  )
                ],
                shape: BoxShape.circle,  //不能与borderRadius共用
                // gradient: RadialGradient(
                //   colors: [
                //     Color.fromRGBO(10, 255, 10, 1.0),
                //     Color.fromRGBO(255, 10, 255, 1.0),
                //   ]
                // )
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(10, 255, 10, 1.0),
                    Color.fromRGBO(255, 10, 255, 1.0),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )
              ),
            )
          ],
        ),
      )
    );
  }
}
