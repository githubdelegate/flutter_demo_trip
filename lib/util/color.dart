import 'package:flutter/material.dart';

const MaterialColor white = const MaterialColor(
  0xFFFFFFFF,
  <int, Color>{
    50: Color(0xFFFFFFFF),
    100: Color(0xFFFFFFFF),
    200: Color(0xFFFFFFFF),
    300: Color(0xFFFFFFFF),
    400: Color(0xFFFFFFFF),
    500: Color(0xFFFFFFFF),
    600: Color(0xFFFFFFFF),
    700: Color(0xFFFFFFFF),
    800: Color(0xFFFFFFFF),
    900: Color(0xFFFFFFFF),
  },
);

///主色调
const MaterialColor primaryCor = const MaterialColor(
  0xfffb7299,
  const <int, Color>{50: const Color(0xffff9db5)},
);

const MaterialColor defalutCor = Colors.grey;

/// 简单 图标文字组合
Widget simpleIconText(IconData? icon, String txt) {
  return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Row(
        children: [
          if (icon != null)
            Icon(
              icon,
              size: 10,
              color: defalutCor,
            ),
          const Padding(padding: EdgeInsets.only(left: 2)),
          Text(
            txt,
            style: const TextStyle(fontSize: 10, color: defalutCor),
          )
        ],
      ));
}
