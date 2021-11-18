import 'package:flutter/material.dart';
import 'package:new_fl/models/video_model.dart';
import 'package:new_fl/util/color.dart';

/// 点击可展开的info
class ExpandVideoInfoContent extends StatefulWidget {
  ExpandVideoInfoContent({Key? key, required this.model}) : super(key: key);

  final VideoModel model;

  @override
  _ExpandVideoInfoContentState createState() => _ExpandVideoInfoContentState();
}

class _ExpandVideoInfoContentState extends State<ExpandVideoInfoContent>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;

  Animatable<double> _easeTween = CurveTween(curve: Curves.easeIn);
  late AnimationController _animationController;
  late Animation<double> _heightFac;

  late CurvedAnimation _curvedAnimation;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500))
      ..addListener(() {
        print('动画的只');
        print(_animationController.value);
        print('----${_heightFac.value}');
      });
    _heightFac = _animationController.drive(_easeTween);

    _curvedAnimation =
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn);
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
        child: Column(
          children: [
            _topView(),
            _centerView(),
            _bottomView(),
          ],
        ),
      ),
    );
  }

  Widget _topView() {
    return InkWell(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
          if (isExpanded) {
            _animationController.forward();
          } else {
            _animationController.reverse();
          }
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.model.title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 18, color: Colors.black87),
          ),
          Icon(
            isExpanded ? Icons.expand_more : Icons.expand_less,
            color: defalutCor,
          )
        ],
      ),
    );
  }

  _bottomView() {
    Widget? textW;
    if (isExpanded) {
      textW = Text(
        widget.model.desc,
        style: const TextStyle(fontSize: 12, color: defalutCor),
      );
    } else {
      textW = null;
    }

    return AnimatedBuilder(
        animation: _animationController.view,
        child: textW,
        builder: (ctx, child) {
          return Align(
            heightFactor: _curvedAnimation.value,
            alignment: Alignment.topCenter,
            child: Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(top: 5),
              child: child,
            ),
          );
        });
  }
}

Widget _centerView() {
  return Row(
    children: [
      simpleIconText(Icons.live_tv_sharp, '观看'),
      simpleIconText(Icons.tv_rounded, '观看'),
      Text('日期')
    ],
  );
}
