import 'package:flutter/material.dart';
import 'package:new_fl/models/video_model.dart';
import 'package:new_fl/pages/video_detail_page.dart';
import 'package:new_fl/util/color.dart';
import 'package:new_fl/util/view_util.dart';

class VideoLargeImageCard extends StatelessWidget {
  const VideoLargeImageCard({Key? key, required this.model}) : super(key: key);
  final VideoModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return VideoPlayRoute(model: model);
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
        height: 106,
        decoration: BoxDecoration(border: borderLine(bottom: true, top: false)),
        child: Row(
          children: [_buildImage(), _buildInfo()],
        ),
      ),
    );
  }

  /// 图片
  _buildImage() {
    var height = 90.0;
    var width = 16 / 9 * height;
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Stack(
        children: [
          Container(
            width: width,
            height: height,
            color: Colors.red,
            child: Image.network(model.pic, fit: BoxFit.fitWidth
                // height: height,
                // width: width,
                ),
          ),
          // FittedBox(
          //   fit: BoxFit.fitWidth,
          //   child: Image.network(
          //     model.pic,
          //     height: height,
          //     width: width,
          //   ),
          // ),
          Positioned(
              bottom: 5,
              right: 5,
              child: Container(
                padding: EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.black38,
                    borderRadius: BorderRadius.circular(2)),
                child: Text(
                  '12:00',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                  ),
                ),
              ))
        ],
      ),
    );
  }

  _buildInfo() {
    return Expanded(
        child: Container(
      padding: EdgeInsets.only(top: 5, left: 8, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.title,
            style: TextStyle(fontSize: 12, color: Colors.black87),
          ),
          _buildContentInfo()
        ],
      ),
    ));
  }

  _buildContentInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [_buildUpView(), biSpace(height: 5), _buildStaView()],
    );
  }

  _buildUpView() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: defalutCor)),
          child: const Text(
            'up',
            style: TextStyle(
                color: defalutCor, fontSize: 8, fontWeight: FontWeight.bold),
          ),
        ),
        biSpace(wid: 8),
        Text(
          model.owner!.name,
          style: TextStyle(fontSize: 11, color: defalutCor),
        ),
      ],
    );
  }

  _buildStaView() {
    return Row(
      children: [
        simpleIconText(Icons.tv_sharp, '7.43万'),
        simpleIconText(Icons.tv_sharp, '7.43万'),
      ],
    );
  }
}
