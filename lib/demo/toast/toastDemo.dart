import 'package:flutter/material.dart';

class ToastView {
  OverlayEntry overlayEntry;
  OverlayState overlayState;
  bool dismissed = false;

  _show() async {
    overlayState.insert(overlayEntry);
    await Future.delayed(Duration(milliseconds: 3500));
    // this.dismiss();
  }

  dismiss() async {
    if (dismissed) {
      return;
    }
    this.dismissed = true;
    overlayEntry?.remove();
  }
}


class Toast {
  BuildContext context;

  factory Toast({contextData}) => _getInstance(contextData);

  static Toast _instance;
  Toast._internal(contextData) {
    print('contextData 初始化 -- $contextData');
    context = contextData;
  }
  static Toast _getInstance(contextData){
    if (_instance == null) {
      print('初始化没有？$contextData');
      _instance = Toast._internal(contextData);
    }
    return _instance;
  }


  show() {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(builder: (context) {
      void colse (){
        overlayEntry.remove();
      }
      return NotifiA(colse:colse);
    });
    var toastView = ToastView();
    toastView.overlayEntry = overlayEntry;
    toastView.overlayState = overlayState;
    toastView._show();
  }



}

class NotifiA extends StatelessWidget {
  var colse;
  NotifiA({Key key,this.colse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30),
              // 双精度（`double`）类的无穷（`infinity`）常量，最大宽度。
              width: double.infinity,
              height: 85.0,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white.withOpacity(0.95),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff000000).withOpacity(0.1),
                        blurRadius: 5.0,
                      ),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, top: 5.0, bottom: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            '刷吃',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              colse();
                              print('aaaaaaaaaaaaaaaaaaa');
                            },
                            child: Text(
                              '关闭',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Text(
                        '111111111111',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '222222222222222222222',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}