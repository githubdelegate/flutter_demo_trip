import 'package:flutter/material.dart';
import 'package:flutter_demo/model/common_model.dart';
import 'package:flutter_demo/model/grid_nav_model.dart';
import 'package:flutter_demo/widget/webview.dart';

class GridNav extends StatelessWidget {
  final GridNavModel? gridNavModel;

  const GridNav({Key? key, this.gridNavModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: _gridNavItems(context),
        ));
  }

  _gridNavItems(BuildContext ctx) {
    List<Widget> items = [];
    if (gridNavModel == null) return items;

    if (gridNavModel?.hotel != null) {
      items.add(_gridNavItem(ctx, gridNavModel!.hotel, true));
    }

    if (gridNavModel!.flight != null) {
      items.add(_gridNavItem(ctx, gridNavModel!.flight, false));
    }
    if (gridNavModel!.travel != null) {
      items.add(_gridNavItem(ctx, gridNavModel!.travel, false));
    }

    return items;
  }

  Widget _gridNavItem(BuildContext ctx, GridNavItem model, bool first) {
    List<Widget> items = [];
    items.add(_mainItem(ctx, model.mainItem));

    items.add(_doubleItem(ctx, model.item1, model.item2));

    items.add(_doubleItem(ctx, model.item3, model.item4));

    List<Widget> expandItems = [];
    items.forEach((element) {
      expandItems.add(Expanded(
        child: element,
        flex: 1,
      ));
    });

    Color startCor = Color(int.parse('0xff' + model.startColor));
    Color endCor = Color(int.parse('0xff' + model.endColor));

    return Container(
      height: 88,
      margin: first ? null : EdgeInsets.only(top: 3),
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: [startCor, endCor])),
      child: Row(children: expandItems),
    );
  }

  Widget _mainItem(BuildContext ctx, CommonModel model) {
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
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            Image.network(model.icon,
                fit: BoxFit.contain,
                height: 88,
                width: 121,
                alignment: AlignmentDirectional.bottomEnd),
            Container(
              margin: EdgeInsets.only(top: 11),
              child: Text(
                model.title,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            )
          ],
        ));
  }

  Widget _doubleItem(BuildContext ctx, CommonModel model, CommonModel model2) {
    return Column(
      children: [
        Expanded(child: _item(ctx, model, true)),
        Expanded(child: _item(ctx, model2, true))
      ],
    );
  }

  Widget _item(BuildContext ctx, CommonModel model, bool first) {
    BorderSide bs = const BorderSide(width: 0.8, color: Colors.white);
    return FractionallySizedBox(
      widthFactor: 1,
      heightFactor: 1,
      child: Container(
          decoration: BoxDecoration(
              border: Border(left: bs, bottom: first ? bs : BorderSide.none)),
          child: _wrapGesture(
              ctx,
              Center(
                  child: Text(model.title,
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(fontSize: 14, color: Colors.white))),
              model)),
    );
  }

  Widget _wrapGesture(BuildContext ctx, Widget wd, CommonModel model) {
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
