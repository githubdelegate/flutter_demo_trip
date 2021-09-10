import 'package:flutter/material.dart';
import 'package:flutter_demo/model/common_model.dart';
import 'package:flutter_demo/model/sales_box_model.dart';
import 'package:flutter_demo/widget/common_util.dart';

class SalesBox extends StatelessWidget {
  final SalesBoxModel? salesBoxModel;

  const SalesBox({Key? key, this.salesBoxModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: _items(context),
    );
  }

  Widget? _items(BuildContext ctx) {
    if (salesBoxModel == null) return null;

    List<Widget> items = [];

    var row1 = _doubleItme(
        ctx, salesBoxModel!.bigCard1, salesBoxModel!.bigCard2, true, false);

    var row2 = _doubleItme(ctx, salesBoxModel!.smallCard1,
        salesBoxModel!.smallCard2, false, false);

    var row3 = _doubleItme(
        ctx, salesBoxModel!.smallCard3, salesBoxModel!.smallCard4, false, true);

    items.add(row1);
    items.add(row2);
    items.add(row3);

    return Column(
      children: [
        Container(
          height: 44,
          margin: EdgeInsets.only(left: 10),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: 1, color: Color(0xfff2f2f2)))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                salesBoxModel!.icon,
                height: 15,
                fit: BoxFit.fill,
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(10, 1, 8, 1),
                  margin: EdgeInsets.only(right: 7),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                          colors: [Color(0xffff4e63), Color(0xffff6cc9)])),
                  child: CommonUtil.wrapGesture(
                      ctx,
                      Text(
                        '获取更多福利 > ',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      CommonModel(url: salesBoxModel!.moreUrl))),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.sublist(0, 1),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.sublist(1, 2),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: items.sublist(2, 3),
        ),
      ],
    );
  }

  Widget _doubleItme(BuildContext ctx, CommonModel model1, CommonModel model2,
      bool isBig, bool isLast) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _item(ctx, model1, isBig, true, isLast),
        _item(ctx, model2, isBig, false, isLast),
      ],
    );
  }

  Widget _item(
      BuildContext ctx, CommonModel model, bool big, bool left, bool last) {
    BorderSide borderSide =
        const BorderSide(width: 0.8, color: Color(0xfff2f2f2));
    return CommonUtil.wrapGesture(
        ctx,
        Container(
          decoration: BoxDecoration(
            border: Border(
                right: left ? borderSide : BorderSide.none,
                bottom: last ? BorderSide.none : borderSide),
          ),
          child: Image.network(
            model.icon,
            fit: BoxFit.fill,
            width: MediaQuery.of(ctx).size.width / 2 - 10,
            height: big ? 129 : 80,
          ),
        ),
        model);
  }
}
