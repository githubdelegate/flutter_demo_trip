import 'package:flutter/material.dart';
import 'package:new_fl/util/view_util.dart';

/// 视频的点赞 收藏 工具栏
class VideoDetailToolView extends StatelessWidget {
  const VideoDetailToolView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        border: borderLine(bottom: true, top: false),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          verticalIconText(Icons.thumb_up_alt_rounded, txt: '1000'),
          verticalIconText(Icons.thumb_down_alt_rounded, txt: '1000'),
          verticalIconText(Icons.monetization_on, txt: '1000'),
          verticalIconText(Icons.grade_rounded, txt: '1000'),
        ],
      ),
    );
  }
}
