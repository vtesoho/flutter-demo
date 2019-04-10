import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/listview/post_show.dart';
import '../../model/post.dart';


class ListViewDemo extends StatelessWidget{

  Widget _listViewItem(BuildContext context,int index) {
    return Container(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 16/9,
                child: Image.network(
                  posts[index].imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16.0,),
              Text(
                posts[index].title,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              Text(
                posts[index].author.toString().substring(0,10),
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0,),
            ],
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Colors.white.withOpacity(0.3),
                highlightColor: Colors.white.withOpacity(0.1),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostShow(post:posts[index])
                    )
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listViewItem,
      


    );
  }
}

