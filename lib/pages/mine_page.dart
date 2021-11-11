import 'package:flutter/material.dart';

class MinePageRoute extends StatefulWidget {
  MinePageRoute({Key? key}) : super(key: key);

  @override
  _MinePageRouteState createState() => _MinePageRouteState();
}

class _MinePageRouteState extends State<MinePageRoute> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Mine')),
    );
  }
}
