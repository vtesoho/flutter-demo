import 'dart:async';

import 'package:flutter/material.dart';
import '../model/post.dart';

class ViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('pageview'),
      ),
      body: PageViewAndListViewDemo(),
    );
  }
}

class GridViewBuilderDemo extends StatelessWidget {
  Widget _gridItemBuilder(BuildContext context, int index) {
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit: BoxFit.cover
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: posts.length,
      itemBuilder: _gridItemBuilder,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        // crossAxisCount: 3,
        maxCrossAxisExtent: 200.0,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
    );
  }
}

class GridViewExtentDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text('Item $index',
            style: TextStyle(fontSize: 18.0, color: Colors.grey)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150.0,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      // scrollDirection: Axis.horizontal,
      children: _buildTiles(100),
    );
  }
}

class GridViewCountDemo extends StatelessWidget {
  List<Widget> _buildTiles(int length) {
    return List.generate(length, (int index) {
      return Container(
        color: Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text('Item $index',
style: TextStyle(fontSize: 18.0, color: Colors.grey)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 16.0,
      mainAxisSpacing: 16.0,
      scrollDirection: Axis.horizontal,
      children: _buildTiles(100),
    );
  }
}

class PageViewBuilderDemo extends StatelessWidget {
  Widget _pageItemBuilder(BuildContext context, int index) {
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(posts[index].title,
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text(posts[index].author),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,
    );
  }
}

class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      pageSnapping: true,
      // reverse: true,
      scrollDirection: Axis.vertical,
      onPageChanged: (currentPage) => debugPrint('Page: $currentPage'),
      controller: PageController(
        initialPage: 0,
        keepPage: false,
      ),
      children: <Widget>[
        Container(
          height:2200,
          color: Colors.brown[900],
          alignment: Alignment(0.0, 0.0),
          child: Text('ONE',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        Container(
          color: Colors.grey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text('TWO',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
        Container(
          color: Colors.blueGrey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text('THREE',
              style: TextStyle(fontSize: 32.0, color: Colors.white)),
        ),
      ],
    );
  }
}


class PageViewAndListViewDemo extends StatefulWidget {
  final Widget child;
  PageViewAndListViewDemo({Key key, this.child}) : super(key: key);

  _PageViewAndListViewDemoState createState() => _PageViewAndListViewDemoState();
}

class _PageViewAndListViewDemoState extends State<PageViewAndListViewDemo> {
  ScrollController _listViewController =ScrollController();
  PageController _pageControllerDemo =PageController();
  int pageindex = 0;
  bool bottomNext=false;
  Map scrollLocation = {'scrollStart': 0, 'scrollEnd': 0};

  double scrollPixels = 0;
  double maxScrollExtent = 0;
  
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    _pageControllerDemo.addListener(() {

    });
    // _pageControllerDemo.animateToPage(2);
     
    _listViewController.addListener(() {
      if (!_listViewController.hasClients || _listViewController.positions.length > 1){
        scrollPixels = 0;
      }else{
        setState(() {
          scrollPixels = _listViewController.position.pixels;
          maxScrollExtent = _listViewController.position.maxScrollExtent;
        });
      }
    });
  }
  //vteso 3.20 add  --------
  _onDragStart(BuildContext context, DragStartDetails start) {
    scrollLocation['scrollStart'] = start.globalPosition.dx;
  }

  _onDragUpdate(BuildContext context, DragUpdateDetails update) {
    scrollLocation['scrollEnd'] = update.globalPosition.dx;
    // print(local.dx.toString() + "*" + local.dy.toString());
  }

  _onDragEnd(BuildContext context,DragEndDetails  end) {
    if(scrollLocation['scrollStart'] - scrollLocation['scrollEnd'] < 0){
      //右划
      print('右划');
    }else{
      //左划
      print('左划');
    }
  }
  //vteso 3.20  add end --------


  Widget _pageItemBuilder(BuildContext context, int index) {
    return Listener(
      onPointerUp: (details) {
        // print(details.position.dy);
        _prveitme();
      },
      child: ListView(
        controller: _listViewController,
        physics:BouncingScrollPhysics(),
        children: <Widget>[
          GestureDetector(
            onHorizontalDragStart: (DragStartDetails start) => {
              _onDragStart(context, start),
            },
            onHorizontalDragUpdate: (DragUpdateDetails update) => {
              _onDragUpdate(context, update),
            },
            onHorizontalDragEnd: (DragEndDetails endDetails) {
              _onDragEnd(context, endDetails);
            },
            child: Column(
              children: <Widget>[
                Container(
                  height:2000,
                  color: Colors.brown[900],
                  alignment: Alignment(0.0, 0.0),
                  child: Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.access_time),
                        onPressed: (){
                          _listViewController.animateTo(20.0, duration: Duration(microseconds: 20), curve: Curves.ease);
                        },
                      ),
                      Text(posts[index].title,
                        style: TextStyle(fontSize: 32.0, color: Colors.white)
                      ),
                      Text(posts[index].title,
                        style: TextStyle(fontSize: 32.0, color: Colors.black)
                      ),
                      Text(posts[index].title,
                        style: TextStyle(fontSize: 32.0, color: Colors.black12)
                      ),
                      Text(posts[index].title,
                        style: TextStyle(fontSize: 32.0, color: Colors.black26)
                      ),
                      Text(posts[index].title,
                        style: TextStyle(fontSize: 32.0, color: Colors.black38)
                      ),
                      Text(posts[index].title,
                        style: TextStyle(fontSize: 32.0, color: Colors.black45)
                      ),
                      Text(posts[index].title,
                        style: TextStyle(fontSize: 32.0, color: Colors.black45)
                      ),
                      Text(posts[index].title,
                        style: TextStyle(fontSize: 32.0, color: Colors.black87)
                      ),
                      Text(posts[index].title,
                        style: TextStyle(fontSize: 32.0, color: Colors.black87)
                      ),

                    ],
                  )
                ),
                bottomNext 
                ? Container(
                  height:40,
                  child: Icon(Icons.arrow_drop_down),
                )
                : Container(),
              ],
            )
          ),
        ],
      ),
    );
  }

  _prveitme ()  {
  
    if(scrollPixels > _listViewController.position.maxScrollExtent + 40){
      print('触发执行111111');
      
      setState(() {
        print('aaaa');
        bottomNext = false;
        _pageControllerDemo.nextPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease
        );
        return null;
      });
    }
    if(scrollPixels <  -40){
      print('触发执行2222');
      setState(() {
        print('aaaa');
        bottomNext = false;
        _pageControllerDemo.previousPage(
          duration: Duration(milliseconds: 500),
          curve: Curves.ease
        );
        return null;
      });
    }
      
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView.builder(
        itemCount: 20,
        pageSnapping: true,
        // reverse: true,
        scrollDirection: Axis.vertical,
        onPageChanged: (currentPage) => {
          debugPrint('Page: $currentPage'),
        },
        controller: _pageControllerDemo,
        itemBuilder: _pageItemBuilder,
      )
    );
  }
}

