import 'package:flutter/material.dart';

class SpeakPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SpeakPageState();
}

class _SpeakPageState extends State<SpeakPage>
    with SingleTickerProviderStateMixin {
  String speakTips = '长按说话';
  String speakRes = '';

  late Animation<double> animation;
  late AnimationController _aniCtl;

  Widget get _topItem {
    return Column(
      children: [
        const Padding(
            padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
            child: Text('请说',
                style: TextStyle(fontSize: 16, color: Colors.black54))),
        Text(
          '故宫门票\n北京一日游\n迪士尼乐园',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15, color: Colors.grey),
        ),
        Padding(
            padding: EdgeInsets.all(20),
            child: Text(
              speakRes,
              style: TextStyle(color: Colors.blue),
            ))
      ],
    );
  }

  Widget get _bottomItem {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Stack(
        children: [
          GestureDetector(
            onTapDown: (e) {
              _speakStart();
            },
            onTapUp: (e) {
              _speakStop();
            },
            onTapCancel: () {
              _speakStop();
            },
            child: Center(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(speakTips,
                          style: TextStyle(fontSize: 12, color: Colors.blue))),
                  Stack(
                    children: [
                      Container(
                        height: micSize,
                        width: micSize,
                      ),
                      Center(
                          child: AnimatedMic(
                        animation: animation,
                      ))
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 20,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.close, size: 30, color: Colors.grey),
            ),
          )
        ],
      ),
    );
  }

  _speakStart() {
    _aniCtl.forward();
    setState(() {
      speakTips = '识别....';
    });
  }

  _speakStop() {
    _aniCtl.reset();
    _aniCtl.stop();
  }

  @override
  void initState() {
    super.initState();

    _aniCtl = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));

    animation = CurvedAnimation(parent: _aniCtl, curve: Curves.easeIn)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _aniCtl.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _aniCtl.forward();
        }
      });
  }

  @override
  void dispose() {
    _aniCtl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(30),
          child: Center(
            child: Column(
              children: [_topItem, _bottomItem],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          )),
    );
  }
}

const double micSize = 80;

class AnimatedMic extends AnimatedWidget {
  static final _alphaTween = Tween<double>(begin: 1, end: 0.5);
  static final _sizeTween = Tween<double>(begin: micSize, end: micSize - 20);

  const AnimatedMic({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Opacity(
        opacity: _alphaTween.evaluate(animation),
        child: Container(
            height: _sizeTween.evaluate(animation),
            width: _sizeTween.evaluate(animation),
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(micSize / 2)),
            child: const Icon(
              Icons.mic,
              color: Colors.white,
              size: 30,
            )));
  }
}
