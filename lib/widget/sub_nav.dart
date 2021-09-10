import 'package:flutter/material.dart';
import 'package:flutter_demo/model/common_model.dart';
import 'package:flutter_demo/widget/common_util.dart';
import 'package:flutter_demo/widget/webview.dart';

// ignore: must_be_immutable
class SubNav extends StatelessWidget {
  List<CommonModel>? subnavlist;

  SubNav({Key? key, this.subnavlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(padding: const EdgeInsets.all(7), child: _items(context)),
    );
  }

  Widget? _items(BuildContext ctx) {
    if (subnavlist == null) return null;
    List<Widget> items = [];

    int colNum = (subnavlist!.length / 2 + 0.5).toInt();

    for (var model in subnavlist!) {
      items.add(_item(ctx, model));
    }

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.sublist(0, colNum),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: items.sublist(colNum, subnavlist!.length)))
      ],
    );
  }

  Widget _item(BuildContext ctx, CommonModel model) {
    return Expanded(
        flex: 1,
        child: CommonUtil.wrapGesture(
            ctx,
            Column(
              children: [
                Image.network(model.icon, height: 18, width: 18),
                Padding(
                  padding: EdgeInsets.only(top: 3),
                  child:
                      Text(model.title, style: const TextStyle(fontSize: 12)),
                )
              ],
            ),
            model));
  }
}
