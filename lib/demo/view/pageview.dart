import 'package:flutter/material.dart';
import '../model/post.dart';


class Pageview extends StatefulWidget {
  final Widget child;

  Pageview({Key key, this.child}) : super(key: key);

  _PageviewState createState() => _PageviewState();
}

class _PageviewState extends State<Pageview> {

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: GridViewBuilderDemo()
    );
  }
}


class GridViewBuilderDemo extends StatelessWidget{

  Widget _gridItemBuilder(BuildContext context,int index) {
    return Container(
      child: Image.network(
        posts[index].imageUrl,
        fit:BoxFit.cover,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GridView.builder(
      padding: EdgeInsets.all(8.0),
      itemCount: posts.length,
      itemBuilder: _gridItemBuilder,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
    );
  }
}



class GridViewExtentDemo extends StatelessWidget{
  List<Widget> _buildTiles(int length){
    return List.generate(length, (int index){
      return Container(
        color:Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text(
          "Item $index"
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.extent(
      maxCrossAxisExtent: 150.0,
      // scrollDirection: Axis.vertical,  //方向
      // crossAxisCount: 3,  //数量
      crossAxisSpacing: 20.0,  //交叉轴间隔
      mainAxisSpacing: 5.0,   //主轴间隔
      children: _buildTiles(100),
    );
  }
}


class GridViewCountDemo extends StatelessWidget{
  List<Widget> _buildTiles(int length){
    return List.generate(length, (int index){
      return Container(
        color:Colors.grey[300],
        alignment: Alignment(0.0, 0.0),
        child: Text(
          "Item $index"
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      scrollDirection: Axis.vertical,  //方向
      crossAxisCount: 3,  //数量
      crossAxisSpacing: 20.0,  //交叉轴间隔
      mainAxisSpacing: 5.0,   //主轴间隔
      children: _buildTiles(100),
    );
  }
}



class PageViewBuildDemo extends StatelessWidget {

  Widget _pageItemBuilder(BuildContext context, int index){
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(
            posts[index].imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                posts[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                posts[index].author
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,
    );
  }
}



class Bodycontainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageView(
      pageSnapping: false,  //可以自由滚动，不会翻过去或弹回来
      reverse: true,  //可以翻转page
      scrollDirection: Axis.vertical,  //滚动方向
      onPageChanged: (currendPage){  //翻 页回调 
        print(currendPage);
      },
      controller: PageController(   //page控制器
        initialPage: 1,  //设置初始页
        keepPage: false,  //是否保存页面状态
        viewportFraction: 0.9,
      ),
      children: <Widget>[
        Container(
          alignment: Alignment(0.0, 0.0),
          color: Colors.brown[900],
          child: Text(
            'ONE',
            style: TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),
        Container(
          alignment: Alignment(0.0, 0.0),
          color: Colors.green[900],
          child: Text(
            'TWO',
            style: TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),
        Container(
          alignment: Alignment(0.0, 0.0),
          color: Colors.blue[900],
          child: Text(
            'THree',
            style: TextStyle(fontSize: 32.0,color: Colors.white),
          ),
        ),
      ],
    );
  }

  
}