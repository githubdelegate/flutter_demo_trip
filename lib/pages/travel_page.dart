import 'package:flutter/material.dart';
import 'package:flutter_demo/dao/travel_tab_dao.dart';
import 'package:flutter_demo/model/travel_tab_model.dart';
import 'package:flutter_demo/pages/travel_tab_page.dart';

class TravelPage extends StatefulWidget {
  TravelPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {
  late TabController _controller;
  List<TravelTab> tabs = [];
  late TravelTabModel travelTabModel;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _loadData() async {
    _controller = TabController(length: tabs.length, vsync: this);
    try {
      TravelTabModel model = await TravelTabDao.fetch();
      setState(() {
        tabs = model.tabs;
        _controller = TabController(length: tabs.length, vsync: this);
        travelTabModel = model;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(top: 30),
            child: TabBar(
              controller: _controller,
              isScrollable: true,
              labelColor: Colors.black,
              labelPadding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
              indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(color: Color(0xff1fcfbb), width: 3),
                  insets: EdgeInsets.only(bottom: 10)),
              tabs: tabs
                  .map((e) => Tab(
                        text: e.labelName,
                      ))
                  .toList(),
            ),
          ),
          Flexible(
            child: TabBarView(
                controller: _controller,
                children: tabs.map((e) {
                  return TravelTabpage(
                      travelUrl: travelTabModel.url,
                      params: travelTabModel.params,
                      channelCode: e.groupChannelCode,
                      type: e.type);
                }).toList()),
          ),
        ],
      ),
    );
  }
}
