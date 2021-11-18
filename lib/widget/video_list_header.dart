import 'package:flutter/material.dart';
import 'package:new_fl/models/video_model.dart';
import 'package:new_fl/util/color.dart';

/// 视频列表 头部 作者信息
class VideoListHeader extends StatelessWidget {
  const VideoListHeader({Key? key, required this.owner}) : super(key: key);

  final Owner owner;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ClipOval(
                  child: Image.network(
                    owner.face,
                    height: 30,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        owner.name,
                        style: const TextStyle(fontSize: 16, color: primaryCor),
                      ),
                      Text('${owner.mid}粉丝',
                          style:
                              const TextStyle(fontSize: 11, color: defalutCor)),
                    ],
                  ),
                )
              ],
            ),
            MaterialButton(
              onPressed: () {},
              child: const Text('+ 关注', style: TextStyle(color: Colors.white)),
              color: primaryCor,
            ),
          ],
        ));
  }
}
