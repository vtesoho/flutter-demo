import 'dart:async';
import 'package:flutter/material.dart';

class CustomToast {
  BuildContext context;
  OverlayState overlayState;
  OverlayEntry overlayEntry;
  Timer timer;
  factory CustomToast({contextData}) => _getInstance(contextData);

  static CustomToast _instance;
  CustomToast._internal(contextData) {
    context = contextData;
    overlayState = Overlay.of(context);
  }
  static CustomToast _getInstance(contextData) {
    if (_instance == null) {
      _instance = CustomToast._internal(contextData);
    }
    return _instance;
  }

  show({String msg}) async {
    
    if (overlayEntry != null) {
      overlayEntry.remove();
    }
    print(timer);
    if(timer != null){
      timer.cancel();
    }
    
    overlayEntry = OverlayEntry(builder: (context) {
      return ToastWidget(homeContext: context, msg: msg);
    });
    overlayState.insert(overlayEntry);
    // Future times = await Future.delayed(Duration(seconds: 3));
    timer = Timer(Duration(seconds: 3), () {
      if(overlayEntry != null){
        dismiss();
      }
    });
    
  }

  dismiss() async {
    overlayEntry.remove();
    overlayEntry = null;
    timer.cancel();
    timer = null;
  }
}

class ToastWidget extends StatelessWidget {
  final colse;
  final BuildContext homeContext;
  final String msg;
  ToastWidget({Key key, this.colse, this.homeContext, this.msg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Color(0x852D2C2C),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Text(
            msg,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}




