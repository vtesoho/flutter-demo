import 'dart:ui';
import 'package:flutter/material.dart';

class Util {
  //状态栏高度
  static stateHeight() {
    return MediaQueryData.fromWindow(window).padding.top;
  }

  static screenWidth() {
    return window.physicalSize;
  }
}
