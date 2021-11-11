import 'package:flutter/material.dart';

class FavoritePageRoute extends StatefulWidget {
  FavoritePageRoute({Key? key}) : super(key: key);

  @override
  _FavorPageRouteState createState() => _FavorPageRouteState();
}

class _FavorPageRouteState extends State<FavoritePageRoute> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Fav')),
    );
  }
}
