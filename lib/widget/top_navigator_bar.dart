import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';

class TopNavigationBar extends StatefulWidget {
  const TopNavigationBar(
      {Key? key, this.child, this.height = 46, this.color = Colors.white})
      : super(key: key);

  final Widget? child;
  final double height;
  final Color color;

  @override
  _TopNavigationBarState createState() => _TopNavigationBarState();
}

class _TopNavigationBarState extends State<TopNavigationBar> {
  @override
  Widget build(BuildContext context) {
    var top = MediaQuery.of(context).padding.top;

    FlutterStatusbarManager.setStyle(StatusBarStyle.LIGHT_CONTENT);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: widget.height + top,
      child: widget.child,
      padding: EdgeInsets.only(top: top),
      decoration: BoxDecoration(color: widget.color),
    );
  }
}
