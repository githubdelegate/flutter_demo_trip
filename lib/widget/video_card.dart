import 'package:flutter/material.dart';
import 'package:new_fl/models/video_model.dart';
import 'package:new_fl/pages/video_detail_page.dart';
import 'package:new_fl/util/format_util.dart';
import 'package:new_fl/widget/placeholder_image.dart';

class VideoCard extends StatelessWidget {
  const VideoCard({Key? key, required this.model}) : super(key: key);

  final VideoModel model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(' tap video ${model.shortLink}');
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return VideoPlayRoute(model: model);
        }));
      },
      child: SizedBox(
        height: 300,
        child: Card(
            margin: EdgeInsets.only(left: 4, right: 4, bottom: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [_itemImage(), Flexible(child: _infoTxt())],
              ),
            )),
      ),
    );
  }

  Widget _itemImage() {
    return Stack(
      children: [
        Container(
          height: 120,
          color: Colors.red,
        ),
        Positioned(
            left: 0,
            top: 0,
            right: 0,
            bottom: 0,
            child: cachedPlaceholderImage(model.pic, h: 120)),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            padding:
                const EdgeInsets.only(left: 8, right: 8, bottom: 3, top: 5),
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.black54, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _iconTxt(Icons.ondemand_video, model.stat?.view ?? 0),
                _iconTxt(Icons.favorite_border, model.stat?.favorite ?? 0),
                _iconTxt(null, model.duration),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _iconTxt(IconData? iconData, int count) {
    var str = '';
    if (iconData != null) {
      str = countFormat(count);
    } else {
      str = time2String(model.duration);
    }
    return Row(
      children: [
        if (iconData != null)
          Icon(
            iconData,
            color: Colors.white,
            size: 12,
          ),
        Padding(
          padding: EdgeInsets.only(left: 3),
          child: Text(str,
              style: TextStyle(color: Colors.white, fontSize: 10),
              overflow: TextOverflow.ellipsis),
        )
      ],
    );
  }

  Widget _infoTxt() {
    return Container(
      padding: EdgeInsets.only(top: 5, left: 8, right: 8, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            model.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 12, color: Colors.black87),
          ),
          _owner()
        ],
      ),
    );
    // return Expanded(
    //     child: Container(
    //   padding: EdgeInsets.only(top: 5, left: 8, right: 8, bottom: 5),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     children: [
    //       Text(
    //         model.title,
    //         maxLines: 2,
    //         overflow: TextOverflow.ellipsis,
    //         style: TextStyle(fontSize: 12, color: Colors.black87),
    //       ),
    //       _owner()
    //     ],
    //   ),
    // ));
  }

  Widget _owner() {
    var owner = model.owner;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            ClipOval(
              child: Image.network(
                model.owner?.face ?? '',
                height: 24,
                width: 24,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: Text(model.owner?.name ?? '',
                  style: TextStyle(fontSize: 11, color: Colors.black87)),
            )
          ],
        ),
        Icon(Icons.more_vert_sharp, size: 15, color: Colors.grey)
      ],
    );
  }
}
