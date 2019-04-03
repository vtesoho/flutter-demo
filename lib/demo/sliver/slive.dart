import 'package:flutter/material.dart';
import '../model/post.dart';
// import 'package:cached_network_image/cached_network_image.dart';
class SliverDemo extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ssss'),
      ),
      body: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    child: Image.network(
                      posts[index].imageUrl,
                    ),
                  );
                }
              ),
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
