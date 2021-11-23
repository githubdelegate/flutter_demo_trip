import 'dart:ui';

import 'package:flutter/material.dart';

/// 模糊
class BiBlur extends StatelessWidget {
  const BiBlur({Key? key, required this.blurValue, this.child})
      : super(key: key);
  final double blurValue;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blurValue, sigmaY: blurValue),
      child: Container(
        color: Colors.white10,
        child: child,
      ),
    );
  }
}
