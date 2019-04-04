import 'package:flutter/material.dart';

const max_scroll_height = 200;

class Test_e extends StatefulWidget {
  @override
  _Teste createState() => _Teste();
}

class _Teste extends State<Test_e> {
  double appBarAlpha = 0;
  _onScroll(Offset) {
    double alphe = Offset / max_scroll_height;
    if (alphe < 0) {
      alphe = 0;
    } else if (alphe > 1) {
      alphe = 1;
    }
    setState(() {
      appBarAlpha = alphe;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: NotificationListener(
              //监听
              
              onNotification: (ScrollNotification) {
                if (ScrollNotification is ScrollUpdateNotification &&
                    ScrollNotification.depth == 0) {
                  //print(ScrollNotification.metrics.pixels);
                  _onScroll(ScrollNotification.metrics.pixels);
                }
              },
              child: ListView(
                physics: new NeverScrollableScrollPhysics(),
                children: <Widget>[
                  Container(
                    height: 250,
                    child: Image.network(
                      'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1552308543&di=2485c1a5ca8cb6a18c25b296ceb9e47a&src=http://img3.cache.netease.com/photo/0016/2011-03-12/6UUPFP1S030U0016.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                  Container(
                    height: 1000,
                    child: ListTile(
                      title: Text('data'),
                    ),
                  )
                ],
              ),
            )),
        Opacity(
          opacity: appBarAlpha,
          child: Container(
            height: 80,
            decoration: BoxDecoration(color: Colors.white),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text('ss'),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
