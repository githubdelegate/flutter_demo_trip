import 'package:flutter/material.dart';
import 'package:new_fl/util/color.dart';

/// 垂直的图标 文字
Widget verticalIconText(IconData? icon,
    {Color cor = defalutCor, String? txt = ''}) {
  return Column(
    children: [
      if (icon != null)
        Icon(
          icon,
          color: cor,
          size: 20,
        ),
      biSpace(height: 5),
      Text(
        txt ??= '',
        style: const TextStyle(color: defalutCor, fontSize: 12),
      )
    ],
  );
}

/// 当做空间距 padding
Widget biSpace({double height = 0, double wid = 0}) {
  return SizedBox(
    height: height,
    width: wid,
  );
}

/// 设置 border line
borderLine({bottom: true, top: true}) {
  BorderSide side = BorderSide(width: 0.5, color: Colors.grey[200]!);
  return Border(
    bottom: bottom ? side : BorderSide.none,
    top: top ? side : BorderSide.none,
  );
}
