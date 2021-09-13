import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  MyPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyPageState();
}

class _MyPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
          child: NotificationListener(
              child: ListView(
            children: [
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              Text("data"),
              SizedBox(
                child: Text("data"),
              )
            ],
          )),
          onRefresh: _loadingView),
    );
  }

  Future<Null> _loadingView() async {
    return null;
  }
}
