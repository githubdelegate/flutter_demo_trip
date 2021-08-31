import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
  TravelPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TravelPageState();
}

class _TravelPageState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Travel")));
  }
}
