import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

const Catch_Urls = ['m.ctrip.com/', 'm.ctrip.com/html5/', 'm.ctrip.com/html5'];

class WebView extends StatefulWidget {
  final String url;
  final String? statusBarColor;
  final String title;
  final bool hideAppBar;
  final bool backForbid;

  const WebView(
      {Key? key,
      required this.url,
      this.statusBarColor = 'ffffff',
      required this.title,
      required this.hideAppBar,
      required this.backForbid})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WebViewState();
  }
}

class _WebViewState extends State<WebView> {
  final webviewReference = FlutterWebviewPlugin();
  late StreamSubscription<String> _onUrlChange;
  late StreamSubscription<WebViewStateChanged> _onStateChange;
  late StreamSubscription<WebViewHttpError> _onHttpError;

  bool _is2Main(String url) {
    bool c = false;
    for (final value in Catch_Urls) {
      if (url.endsWith(value)) {
        c = true;
        break;
      }
    }
    return c;
  }

  @override
  void initState() {
    super.initState();

    webviewReference.close();
    _onUrlChange = webviewReference.onUrlChanged.listen((event) {});
    _onStateChange = webviewReference.onStateChanged.listen((event) {
      switch (event.type) {
        case WebViewState.startLoad:
          if (_is2Main(event.url)) {
            if (widget.backForbid) {
              webviewReference.launch(widget.url);
            } else {
              Navigator.pop(context);
            }
          }
          break;
        default:
          break;
      }
    });

    _onHttpError = webviewReference.onHttpError.listen((event) {
      print(event);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _onStateChange.cancel();
    _onHttpError.cancel();
    _onUrlChange.cancel();
    webviewReference.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String statusBarColorStr = widget.statusBarColor ?? 'ffffff';
    Color backButtonColor;
    if (statusBarColorStr == 'ffffff') {
      backButtonColor = Colors.black;
    } else {
      backButtonColor = Colors.white;
    }

    return Scaffold(
      body: Column(
        children: [
          _appBar(
              Color(int.parse('0xff' + statusBarColorStr)), backButtonColor),
          Expanded(
              child: WebviewScaffold(
                  url: widget.url,
                  withZoom: true,
                  withLocalStorage: true,
                  hidden: true,
                  initialChild: Container(
                    color: Colors.white,
                    child: const Center(child: Text('waiting')),
                  )))
        ],
      ),
    );
  }

  Widget _appBar(Color backgroundColor, Color backButtonColor) {
    if (widget.hideAppBar) {
      return Container(
        color: backgroundColor,
        height: 30,
      );
    }

    return FractionallySizedBox(
        child: Stack(
      children: [
        GestureDetector(
          child: Container(
            margin: const EdgeInsets.only(left: 10),
            child: Icon(Icons.close, color: backButtonColor, size: 26),
          ),
        ),
        Positioned(
            child: Center(
                child: Text(widget.title,
                    style: TextStyle(color: backButtonColor, fontSize: 20))))
      ],
    ));
  }
}
