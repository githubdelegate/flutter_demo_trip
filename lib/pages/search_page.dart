import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SearchPageState();
}

class _SearchPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Search")));
  }
}
