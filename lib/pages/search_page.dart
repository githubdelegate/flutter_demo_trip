import 'package:flutter/material.dart';
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
        appBar: AppBar(),
        body: Column(
          children: [_appBar],
        ));
  }

  _action() {}

  _onChange(String txt) {
    print(txt);
  }

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
              leftButtonClick: () {},
              onChanged: (txt) {},
              speakClick: () {},
              inputBoxClick: () {},
              rightButtonClick: () {},
            ),
          ),
        )
      ],
    );
  }
}
