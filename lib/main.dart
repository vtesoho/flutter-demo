import 'package:flutter/material.dart';
import 'package:fluttershuachi/demo/imagedown/dioDemo/dioDemo.dart';
import 'package:fluttershuachi/demo/imagedown/image_picker_saver.dart';
import 'package:fluttershuachi/demo/imagedown/imgdown/imgdown.dart';
import 'package:fluttershuachi/demo/layout/layout_demo.dart';
import 'package:fluttershuachi/demo/router/routerDemo.dart';
import 'package:fluttershuachi/demo/sliver/slive.dart';
import 'package:fluttershuachi/demo/state/state_management_demo.dart';
import 'package:fluttershuachi/demo/transition/transitionDemo.dart';
import 'package:fluttershuachi/demo/view/pageview.dart';
import 'package:fluttershuachi/demo/cache_image/cache_image.dart';
import 'package:fluttershuachi/pages/animation.dart';
import 'package:fluttershuachi/pages/home.dart';
import 'package:fluttershuachi/pages/my_page.dart';
import 'package:fluttershuachi/pages/page_view.dart';
import 'package:fluttershuachi/pages/share_demo.dart';
import 'package:fluttershuachi/pages/test_status_demo.dart';

void main () => runApp(App());


class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/router',
      routes: {
        '/': (context) => Home(),
        '/animation': (context) => AnimationDemo(),
        '/teststatus': (context) => TestStatusDemo(),
        // '/shart': (context) => ShartDemo(),
        '/state-management': (context) => StateManagementDemo(),
        '/mypage': (context) => MyPage(),
        '/layout': (context) => LayoutDemo(),
        '/pageview': (context) => Pageview(),
        '/sliver': (context) => SliverDemo(),
        '/cacheimage': (context) => CacheImage(),
        '/transition': (context) => TransitionDemo(),
        '/router': (context) => RouterDemo(),
        // '/dio': (context) => dioDemo(),
        // '/imgsaver': (context) => ImgSaver(),
        // '/imgdown': (context) => ImgDown(),
      },
      theme: ThemeData(
        highlightColor: Color.fromARGB(255, 255, 255, 255)
      )
    );
  }
}

