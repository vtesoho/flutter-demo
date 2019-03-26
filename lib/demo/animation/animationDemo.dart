import 'package:flutter/material.dart';


class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        elevation: 0.0,
      ),
      body:AnimationDemoHome()
    );
  }
}


class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}



class _AnimationDemoHomeState extends State<AnimationDemoHome> with TickerProviderStateMixin{
  AnimationController animationDemoController;

  @override
  void initState() {
    super.initState();  

    animationDemoController = AnimationController(
      value: 120,
      lowerBound: 40.0,
      upperBound: 120.0,
      duration:Duration(milliseconds: 300),
      vsync: this,
    );


    animationDemoController.addListener(() {
      // print('${animationDemoController.value}');
      setState(() {
      });
    });

    animationDemoController.addStatusListener((AnimationStatus status) {
    });

  }
  @override
    void dispose() {
      super.dispose();
      animationDemoController.dispose();
    }


  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      IconButton(
         icon:Icon(Icons.receipt),
         iconSize: 50,
         // label: Text('${animationDemoController.value}'),
         onPressed: () {
           switch (animationDemoController.status) {
             case AnimationStatus.completed:
               animationDemoController.reverse();
               break;
             default:
              animationDemoController.forward();
           }
         },
       ),
         Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.black,
          elevation: 0.0,
          child: Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Buy Now',),
          ),
        ),
         Align(
          alignment: Alignment.bottomRight,
          child: Container(
            constraints: new BoxConstraints.expand(width: 300.0, height: 300.0,),
            child: Row(
              children: <Widget>[
                Image.asset(
                  'images/next.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover
                ),
                Container(
                  width: animationDemoController.value - 40,
                  child: Text(
                    " 下一篇文章 ",
                    softWrap: false,
                    style: TextStyle(
                      color:Color.fromARGB(255, 255, 136, 1),
                      fontSize: 14.0
                    ),
                    overflow: TextOverflow.clip
                  ),
                )
                
              ],
            ),
            decoration: new BoxDecoration(
              color: Colors.blue,
              border: new Border.all(color: Colors.yellow, width: 1.0,),
              borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
            ),
            // constraints: new BoxConstraints.expand(
            //   width: animationDemoController.value,
            //   height: 40.0,
            // ),
            // foregroundDecoration: new BoxDecoration(
            //   // color: Colors.blue,
            //   border: new Border.all(color: Color.fromARGB(255, 255, 136, 1), width: 1.0,),
            //   borderRadius: new BorderRadius.all(new Radius.circular(50.0)),
            //   // gradient: new LinearGradient(colors: [Colors.blue, Colors.green]),
            // ),
            // alignment: Alignment.center,
            // child: Row(
            //   children: <Widget>[
            //     Image.asset(
            //       'images/next.png',
            //       width: 40,
            //       height: 40,
            //       fit: BoxFit.cover
            //     ),
            //     Container(
            //       width: animationDemoController.value - 40,
            //       child: Text(
            //         " 下一篇文章 ",
            //         softWrap: false,
            //         style: TextStyle(
            //           color:Color.fromARGB(255, 255, 136, 1),
            //           fontSize: 14.0
            //         ),
            //         overflow: TextOverflow.clip
            //       ),
            //     )
                
            //   ],
            // )
            
          )
        ),
        
        
          
    ]);
    return Center(
       child: IconButton(
         icon:Icon(Icons.receipt),
         iconSize: animationDemoController.value,
         // label: Text('${animationDemoController.value}'),
         onPressed: () {
           switch (animationDemoController.status) {
             case AnimationStatus.completed:
               animationDemoController.reverse();
               break;
             default:
              animationDemoController.forward();
           }
         },
       ),
    );
  }
}