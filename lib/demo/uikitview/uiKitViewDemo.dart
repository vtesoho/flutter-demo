import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class UiKitViewDemo extends StatefulWidget {
  UiKitViewDemo({Key key}) : super(key: key);

  _UiKitViewDemoState createState() => _UiKitViewDemoState();
}

class _UiKitViewDemoState extends State<UiKitViewDemo> {
  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      ////print('map width: ${widget.width}');
      return Container(
          // child: AndroidView(
          //   viewType: 'amap_map',
          //   creationParams: data,
          //   onPlatformViewCreated: onPlatformViewCreated,
          //   creationParamsCodec: const StandardMessageCodec(),
          // )
        );
    } else if (defaultTargetPlatform == TargetPlatform.iOS) {
      return Container(
          // width: widget.width == 0
          //     ? mediaQuery.size.width
          //     : widget.width,
          // height: widget.height == 0
          //     ? mediaQuery.size.height
          //     : widget.height,
        child: UiKitView(
          viewType: 'amap_map',
          // creationParams: data,
          // onPlatformViewCreated: onPlatformViewCreated,
          creationParamsCodec: const StandardMessageCodec(),
        )
      );
    }
  }
}