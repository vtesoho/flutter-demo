import 'package:flutter/material.dart';
import '../../model/post.dart';

class PostShow extends StatelessWidget{
  final Post post;
  PostShow({
    @required this.post
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('${post.title}'),
      ),
      body: Column(
        children: <Widget>[
          Image.network(
            post.imageUrl
          ),
          Container(
            padding: EdgeInsets.all(32.0),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '${post.title}',
                  style: TextStyle(
                    fontSize: 16.0
                  ),
                ),
                Text(
                  '${post.author}',
                  style: TextStyle(
                    fontSize: 12.0
                  ),
                ),
                Text(
                  '${post.description}',
                  style: TextStyle(
                    fontSize: 12.0
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}