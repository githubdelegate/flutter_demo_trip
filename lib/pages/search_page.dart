import 'package:flutter/material.dart';
import 'package:flutter_demo/widget/search_bar.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            SearchBar(
                hint: 'hint',
                defaulText: 'defalut',
                onChange: _onChange,
                leftBtnClick: () => Navigator.pop(context))
          ],
        ));
  }

  _onChange(String txt) {
    print(txt);
  }
}
