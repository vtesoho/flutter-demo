import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:fluttershuachi/demo/form/formDemo.dart';
import 'package:fluttershuachi/demo/imagedown/dioDemo/dioDemo.dart';
import 'package:fluttershuachi/demo/imagedown/image_picker_saver.dart';
import 'package:fluttershuachi/demo/imagedown/imgdown/imgdown.dart';
import 'package:fluttershuachi/demo/layout/layout_demo.dart';
import 'package:fluttershuachi/demo/life_cycle/lifeCycleDemo.dart';
import 'package:fluttershuachi/demo/listview/listview.dart';
import 'package:fluttershuachi/demo/random/random.dart';
import 'package:fluttershuachi/demo/responsive/responsiveDemo.dart';
import 'package:fluttershuachi/demo/router/routerDemo.dart';
import 'package:fluttershuachi/demo/setStateTestDemo/set_state_test.dart';
import 'package:fluttershuachi/demo/sliver/slive.dart';
import 'package:fluttershuachi/demo/state/state_management_demo.dart';
import 'package:fluttershuachi/demo/stream/stream_demo.dart';
import 'package:fluttershuachi/demo/toast/customToast.dart';
import 'package:fluttershuachi/demo/toast/toastDemo.dart';
import 'package:fluttershuachi/demo/transition/transitionDemo.dart';
import 'package:fluttershuachi/demo/view/pageview.dart';
import 'package:fluttershuachi/demo/cache_image/cache_image.dart';
import 'package:fluttershuachi/demo/websocker/websockerdemo.dart';
import 'package:fluttershuachi/demo/widget/richtext.dart';
import 'package:fluttershuachi/demo/widget/widgetRouter.dart';
import 'package:fluttershuachi/model/singleton/singletonDemo.dart';
import 'package:fluttershuachi/pages/animation.dart';
import 'package:fluttershuachi/pages/home.dart';
import 'package:fluttershuachi/pages/my_page.dart';
import 'package:fluttershuachi/pages/test_status_demo.dart';
import 'demo/bloc/blocDemo.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'demo/redux/reduxDemo.dart';
import './store/index.dart';

import 'dart:ui';

void main() {
  //native初妈化参数   
  runApp(App(initParams: window.defaultRouteName));
}




class App extends StatelessWidget {
  final String initParams;
  App({Key key, this.initParams}) : super(key: key);

  

  
  @override
  Widget build(BuildContext context) {
    SingletonDemo(data:'main初始化!').test();
    return StoreProvider(
      store: createStore(),
      child: MaterialApp(
        title: '杰锅的试验app',
        debugShowCheckedModeBanner: false,
        initialRoute: '/', //默认页面，不写默认为home属性的widget
        routes: {
          '/': (context) => Home(initParams:initParams),
          '/widget': (context) => WidgetAll(),
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
          '/listview': (context) => ListViewDemo(),
          '/routerPageOne': (context) => RouterPageOne(
                title: 'routerTest',
              ),
          '/form': (context) => FormDemo(),
          '/StreamDemo': (context) => StreamDemo(),
          '/bloc': (context) => BlocDemo(),
          '/websocker': (context) => WebSockerDemo(),
          '/responsive': (context) => ResponsiveDemo(),
          '/setstatetest': (context) => SetStateTestDemo(),
          '/lifecycle': (context) => LifeCycleDemo(),
          '/richtext': (context) => RichTextDemo(),
          '/redux': (context) => ReduxDemo(),
          '/random': (context) => RandomDemo(),


          // '/dio': (context) => dioDemo(),
          // '/imgsaver': (context) => ImgSaver(),
          // '/imgdown': (context) => ImgDown(),
        },
        theme: ThemeData(
          //定义一些主题颜色
          highlightColor: Color.fromARGB(255, 255, 255, 255),
          primaryColor: Colors.yellow,
          accentColor: Color.fromRGBO(3, 54, 255, 1.0),
          fontFamily: 'PuHuiTiM',
        ),
      ),
    );
  }


}
