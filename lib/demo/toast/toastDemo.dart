import 'package:flutter/material.dart';

class ToastNotifi {
  BuildContext context;
  OverlayState overlayState;
  OverlayEntry overlayEntry;
  factory ToastNotifi({contextData}) => _getInstance(contextData);

  static ToastNotifi _instance;
  ToastNotifi._internal(contextData) {
    context = contextData;
    overlayState = Overlay.of(context);
  }
  static ToastNotifi _getInstance(contextData) {
    if (_instance == null) {
      _instance = ToastNotifi._internal(contextData);
    }
    return _instance;
  }

  show({Widget child}) {
    if (overlayEntry != null) {
      overlayEntry.remove();
    }
    overlayEntry = OverlayEntry(builder: (context) {
      return NotifiBaseWidget(homeContext: context, child: child);
    });
    overlayState.insert(overlayEntry);
  }

  dismiss() async {
    overlayEntry.remove();
    overlayEntry = null;
  }
}

class NotifiBaseWidget extends StatelessWidget {
  final colse;
  final BuildContext homeContext;
  final Widget child;
  NotifiBaseWidget({Key key, this.colse, this.homeContext, this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(homeContext).padding.top),
        child: Column(
          children: <Widget>[
            child,
          ],
        ),
      ),
    );
  }
}
