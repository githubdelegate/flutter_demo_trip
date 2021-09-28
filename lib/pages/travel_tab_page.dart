import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/dao/travel_dao.dart';
import 'package:flutter_demo/model/travel_model.dart';
import 'package:flutter_demo/widget/loading_container.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

const kPageSize = 10;

class TravelTabpage extends StatefulWidget {
  String travelUrl;
  Map params;
  String channelCode;
  int type;

  TravelTabpage(
      {Key? key,
      required this.travelUrl,
      required this.params,
      required this.channelCode,
      required this.type})
      : super(key: key);

  @override
  _TravelTabpageState createState() => _TravelTabpageState();
}

class _TravelTabpageState extends State<TravelTabpage>
    with AutomaticKeepAliveClientMixin {
  List<TravelItem> travelItems = [];
  int pageIdx = 1;
  bool _loading = true;
  ScrollController _scrollController = ScrollController();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _loadData();
  }

  void _loadData({loadMore = false}) async {
    TravelModel model = await TravelDao.fetch(widget.travelUrl, widget.params,
        widget.channelCode, widget.type, pageIdx, kPageSize);

    setState(() {
      List<TravelItem> items = _filterItems(model.resultList);
      travelItems.addAll(items);
      _loading = false;
    });
  }

  Future _handleRefresh() async {
    _loadData();
  }

  List<TravelItem> _filterItems(List<TravelItem> list) {
    List<TravelItem> fliters = [];
    list.forEach((element) {
      fliters.add(element);
    });
    return fliters;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: StaggeredGridView.countBuilder(
          crossAxisCount: 2,
          itemCount: travelItems.length,
          itemBuilder: (BuildContext context, int index) =>
              _TravelItem(item: travelItems[index], idx: index),
          staggeredTileBuilder: (int index) => const StaggeredTile.fit(1)
          // mainAxisSpacing: 4.0,
          // crossAxisSpacing: 4.0,
          ),
      // child: StaggeredGridView.countBuilder(
      //     crossAxisCount: 2,
      //     itemCount: travelItems.length,
      //     itemBuilder: (BuildContext ctx, int idx) =>
      //         _TravelItem(item: travelItems[idx], idx: idx),
      //     staggeredTileBuilder: (int idx) => const StaggeredTile.fit(1)),
    ));
  }
}

class _TravelItem extends StatelessWidget {
  late TravelItem item;
  int idx = 0;

  _TravelItem({Key? key, required this.item, required this.idx})
      : super(key: key);

  String _poiName() {
    return item.article.pois.isEmpty ? 'unkonw' : item.article.pois[0].poiName;
  }

  Widget get _itemImage {
    return Stack(
      children: [
        Image.network(item.article.images[0].dynamicUrl),
        Positioned(
          bottom: 8,
          left: 8,
          child: Container(
            padding: EdgeInsets.fromLTRB(5, 1, 5, 1),
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                const Padding(
                    padding: EdgeInsets.only(right: 3),
                    child:
                        Icon(Icons.location_on, color: Colors.white, size: 12)),
                LimitedBox(
                  maxWidth: 130,
                  child: Text(
                    _poiName(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget get _infoTxt {
    return Container(
      padding: EdgeInsets.fromLTRB(6, 0, 6, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              PhysicalModel(
                  color: Colors.transparent,
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    item.article.author.coverImage.dynamicUrl,
                    width: 24,
                    height: 24,
                  )),
              Container(
                padding: const EdgeInsets.all(5),
                width: 90,
                child: Text(
                  item.article.author.nickName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 12),
                ),
              )
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.thumb_up,
                size: 14,
                color: Colors.grey,
              ),
              Padding(
                padding: EdgeInsets.only(left: 3),
                child: Text(item.article.likeCount.toString()),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        child: PhysicalModel(
          color: Colors.transparent,
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _itemImage,
              Container(
                padding: const EdgeInsets.all(4),
                child: Text(
                  item.article.articleTitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
              _infoTxt
            ],
          ),
        ),
      ),
    );
  }
}
