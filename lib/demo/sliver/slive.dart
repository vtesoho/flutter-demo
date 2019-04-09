import 'package:flutter/material.dart';
import '../model/post.dart';
// import 'package:cached_network_image/cached_network_image.dart';
class SliverDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            // 给子元素添加内边距
            // SliverPadding(
            //   padding: EdgeInsets.all(8.0),
            //   sliver: SliverGridDemo(),
            // )

            // 内容显示在安全区域，不会被状态栏档住
            // SliverSafeArea(
            //   sliver: SliverGridDemo(),
            // )
            SliverAppBar(
              // title: Text('ssssssssssss'),
              leading: Container(),
              pinned: true,   //固定在头部
              // floating: true,    //不固定，不管在那里只有往下拉一点点就出来
              expandedHeight: 178.0,   //设置头部bar高度
              flexibleSpace: FlexibleSpaceBar(   //头部内容
                title: Text(
                  'Test',
                  style: TextStyle(
                    fontSize: 15.0,
                    letterSpacing: 3.0
                  ),
                ),
                background: Image.network(
                  'http://img.daimg.com/uploads/allimg/190220/3-1Z220142K6.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              // flexibleSpace: Container(
              //   height: 178,
              //   child: Text('data'),
              //   decoration: BoxDecoration(
              //     image: DecorationImage(
              //       image: NetworkImage('http://img.daimg.com/uploads/allimg/190220/3-1Z220142K6.jpg'),
              //       fit: BoxFit.cover
              //     )
              //   ),
              // ),
            ),
            SliverSafeArea(
              sliver: SliverListDemo(),
            )

          ],
        ),
      ),
      // body: CustomScrollView(
      //   slivers: <Widget>[
      //     Container(
      //       // child: CachedNetworkImage(
      //       //   imageUrl: "http://via.placeholder.com/350x150",
      //       //   placeholder: (context, url) => new CircularProgressIndicator(),
      //       //   errorWidget: (context, url, error) => new Icon(Icons.error),
      //       // ),
      //     )
      //   ],
      // ),
    );
  }
}



class SliverListDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom:32.0),
            child: Material(
              borderRadius: BorderRadius.circular(12.0),  //设置圆角大小 
              elevation: 14.0,  //设置阴影
              shadowColor: Colors.grey.withOpacity(0.5),  //阴影颜色
              child: Stack(
                children: <Widget>[
                  AspectRatio(  //宽高比组件
                    aspectRatio: 16/9,
                    child: Image.network(
                      posts[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    top: 32,
                    left:32,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          posts[index].title,
                          style: TextStyle(
                            fontSize: 20.0,
                            color:Colors.white,
                          ),
                        ),
                        Text(
                          posts[index].author,
                          style: TextStyle(
                            fontSize: 13.0,
                            color:Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )
            )
          );
        },
        childCount: posts.length,
      ),
    );
  }
}


class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
        childAspectRatio: 1.0,
      ),
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Container(
            child: Image.network(
              posts[index].imageUrl,
              fit: BoxFit.cover,
            ),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}