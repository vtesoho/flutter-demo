import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:oktoast/oktoast.dart';

class OkToastDemo extends StatefulWidget {
  OkToastDemo({Key key}) : super(key: key);

  _OkToastDemoState createState() => _OkToastDemoState();
}

class _OkToastDemoState extends State<OkToastDemo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('routerDemoa'),
      ),
      body: Center(
        child: FlatButton(
          onPressed: (){
            showToastWidget(
              widgetToast(),
              duration: Duration(seconds: 5),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  Widget widgetToast() {
    return Column(
        children: <Widget>[
          Container(
            margin:EdgeInsets.only(top: 30),
            // 双精度（`double`）类的无穷（`infinity`）常量，最大宽度。
            width: double.infinity,
            height: 85.0,
            padding:EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white.withOpacity(0.95),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff000000).withOpacity(0.1),
                    blurRadius: 5.0,
                  ),
                ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,right: 8.0,top:5.0,bottom:5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          '刷吃',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '关闭',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0,right:8.0),
                    child: Text(
                      '111111111111',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text(
                      '222222222222222222222222222',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                      ),
                      
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      );
  }
}