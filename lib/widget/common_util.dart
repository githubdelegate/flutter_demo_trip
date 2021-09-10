import 'package:flutter/material.dart';
import 'package:flutter_demo/model/common_model.dart';
import 'package:flutter_demo/widget/webview.dart';

class CommonUtil {
  static Widget wrapGesture(BuildContext ctx, Widget wd, CommonModel model) {
    return GestureDetector(
        onTap: () {
          Navigator.push(ctx, MaterialPageRoute(builder: (BuildContext ctx) {
            return WebView(
                url: model.url,
                statusBarColor: model.statusBarColor,
                title: model.title,
                hideAppBar: model.hideAppBar,
                backForbid: false);
          }));
        },
        child: wd);
  }
}
