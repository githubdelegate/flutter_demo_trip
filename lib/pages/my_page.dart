import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  MyPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyPageState();
}

class _MyPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("My")));
  }
}
