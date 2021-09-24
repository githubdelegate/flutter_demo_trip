import 'package:flutter/material.dart';
import 'package:flutter_demo/dao/search_dao.dart';
import 'package:flutter_demo/model/search_model.dart';
import 'package:flutter_demo/widget/search_bar.dart';

const types = [
  'channelgroup',
  'gs',
  'plane',
  'train',
  'cruise',
  'district',
  'food',
  'hotel',
  'huodong',
  'shop',
  'sight',
  'ticket',
  'travelgroup'
];

const searchBarDefaultText = '网红打卡地 景点 酒店 美食';

class SearchPage extends StatefulWidget {
  final bool hideLeft;
  final String searchUrl;
  final String keyword;
  final String hint;

  const SearchPage({
    Key? key,
    this.hideLeft = true,
    this.searchUrl = '',
    this.keyword = '',
    this.hint = '',
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SearchModel? searchModel;
  String keyword = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        _appBar,
        MediaQuery.removePadding(
            removeTop: true,
            context: context,
            child: Expanded(
              flex: 1,
              child: ListView.builder(
                  itemBuilder: (BuildContext ctx, int idx) {
                    return _item(idx) as Widget;
                  },
                  itemCount: searchModel?.data.length ?? 0),
            )),
      ],
    ));
  }

  Widget? _item(int idx) {
    if (searchModel == null) return null;
    SearchItem item = searchModel!.data[idx];

    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(width: 0.3, color: Colors.grey))),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.all(1),
              child: Image(
                image: AssetImage(_typeImageName(item.type)),
                width: 26,
                height: 26,
              ),
            ),
            Column(
              children: [
                SizedBox(
                  width: 300,
                  child: _richTitle(item),
                ),
                SizedBox(
                  width: 300,
                  child: _subTitle(item),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _onTxtChange(String txt) async {
    keyword = txt;
    if (txt.isEmpty) {
      setState(() {});
      return;
    }

    try {
      SearchModel model = await SearchDao.fetch(txt);
      if (model.keyword == keyword) {
        setState(() {
          searchModel = model;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  _jump2Speak() {}

  Widget get _appBar {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0x66000000), Colors.transparent],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Container(
            padding: const EdgeInsets.only(top: 20),
            height: 80,
            decoration: const BoxDecoration(color: Colors.white),
            child: SearchBar(
              city: '',
              hideLeft: widget.hideLeft,
              defaultText: widget.keyword,
              hint: widget.hint,
              leftButtonClick: () {
                Navigator.pop(context);
              },
              onChanged: _onTxtChange,
              speakClick: _jump2Speak,
              inputBoxClick: () {},
              rightButtonClick: () {},
            ),
          ),
        )
      ],
    );
  }

  //  构建rich txt
  List<TextSpan> _keywordSpans(String word, String keyword) {
    List<TextSpan> spans = [];
    String wordl = word.toLowerCase(), keywordl = keyword.toLowerCase();
    List<String> arr = wordl.split(keywordl);

    TextStyle normalS = TextStyle(fontSize: 16, color: Colors.black87);
    TextStyle keyS = TextStyle(fontSize: 16, color: Colors.orange);

    int preIdx = 0;
    for (int i = 0; i < arr.length; i++) {
      if (i != 0) {
        preIdx = wordl.indexOf(keywordl, preIdx);
        spans.add(TextSpan(
            text: word.substring(preIdx, preIdx + keyword.length),
            style: keyS));
      }

      String val = arr[i];
      if (val.length > 0) {
        spans.add(TextSpan(text: val, style: normalS));
      }
    }

    return spans;
  }

  Widget _richTitle(SearchItem item) {
    List<TextSpan> spans = [];
    spans.addAll(_keywordSpans(item.word, searchModel!.keyword));
    spans.add(TextSpan(
        text: ' ' + (item.districtname) + ' ' + item.zonename,
        style: const TextStyle(fontSize: 12, color: Colors.grey)));

    return RichText(text: TextSpan(children: spans));
  }

  Widget _subTitle(SearchItem item) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: item.price,
          style: TextStyle(fontSize: 16, color: Colors.orange)),
      TextSpan(
          text: ' ' + item.type,
          style: TextStyle(fontSize: 16, color: Colors.grey)),
    ]));
  }

// 获取图片
  String _typeImageName(String? type) {
    if (type == null) return 'assets/images/type_travelgroup.png';
    var path = '';
    for (var innertype in types) {
      if (type.contains(innertype)) {
        path = innertype;
        break;
      }
    }
    return 'assets/images/type_$path.png';
  }
}
