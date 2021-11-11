import 'package:flutter/material.dart';

class RankPageRoute extends StatefulWidget {
  RankPageRoute({Key? key}) : super(key: key);

  @override
  _RankPageRouteState createState() => _RankPageRouteState();
}

class _RankPageRouteState extends State<RankPageRoute> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Rank')),
    );
  }
}
