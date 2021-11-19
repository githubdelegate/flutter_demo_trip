import 'package:flutter/material.dart';

abstract class BiState<T extends StatefulWidget> extends State<T> {
  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    } else {
      print('页面已经被销毁了-本次setState 不执行了');
    }
  }
}
