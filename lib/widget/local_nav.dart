import 'package:flutter/material.dart';
import 'package:flutter_demo/model/common_model.dart';
import 'package:flutter_demo/widget/webview.dart';

// ignore: must_be_immutable
class LocalNav extends StatelessWidget {
  final List<CommonModel> localNavList;

  const LocalNav({Key? key, required this.localNavList}) : super(key: key);

  // LocalNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(padding: const EdgeInsets.all(7), child: _items(context)),
    );
  }

  Widget? _items(BuildContext ctx) {
    if (localNavList == null) return null;
    List<Widget> items = [];

    localNavList.forEach((model) => items.add(_item(ctx, model)));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: items,
    );
  }

  Widget _item(BuildContext ctx, CommonModel model) {
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
      child: Column(
        children: [
          Image.network(model.icon, height: 32, width: 32),
          Text(model.title, style: const TextStyle(fontSize: 12))
        ],
      ),
    );
  }
}
