import 'dart:async';
import 'package:flutter/material.dart';

// TODO: 第3步：实现“路由导航”。

void openTopReminder(context, String reminderText) {
  Navigator.of(context).push(
    PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return TopReminder(reminderText: reminderText);
      },
    ),
  );
}

/// 自定义的顶部提醒组件。
class TopReminder extends StatefulWidget {
  /// 提醒文本。
  final String reminderText;

  TopReminder({
    @required
    this.reminderText,
  });

  @override
  _TopReminderState createState() => _TopReminderState();
}

/// 与自定义的顶部提醒组件关联的状态子类。
class _TopReminderState extends State<TopReminder> {
  // TODO: 第4步：实现“倒计时抛”。

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop(true);
      },
      child: Column(
        children: <Widget>[
          Container(
            // 双精度（`double`）类的无穷（`infinity`）常量，最大宽度。
            width: double.infinity,
            height: 85.0,
            color: const Color(0xFFFF6F6F),
            child: Align(
              alignment: Alignment.bottomCenter,
              // 使用材料（`Material`）组件来避免文本下方的黄色线条。
              child: Material(
                color: const Color(0xFFFF6F6F),
                child: Text(
                  widget.reminderText,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: const Color(0xFF282828),
                  ),
                ),
              ),
            ),
            // 容器（`Container`）组件的填充（`padding`）属性，将子组件放在这个填充内。
            padding: EdgeInsets.only(bottom: 7.0),
          ),
          Container(
            height: 3.0,
            color: const Color(0xFF4A4A4A),
          ),
          // 不透明度（`Opacity`）组件，使子组件部分透明。
          Opacity(
            // 不透明度（`opacity`）属性，缩放子组件的阿尔法通道（`alpha`）值的分数。
            // 不透明度为1.0是完全不透明的，不透明度为0.0是完全透明的（即不可见）。
            opacity: 0.5,
            child: Container(
              height: 4.0,
              color: const Color(0xFFCCCCCC),
            ),
          ),
        ],
      ),
      // TODO: 第3步：实现“路由导航”，点击提醒页面时返回。
    );
  }
}
