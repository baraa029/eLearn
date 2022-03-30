import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter_plus/webview_flutter_plus.dart';

import '../router/router_class.dart';

class Elearning extends StatelessWidget {
  String elearn = 'number';
  Elearning(this.elearn);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.portraitUp,
      // DeviceOrientation.portraitDown,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight
    ]);
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        Future.delayed(const Duration(milliseconds: 50), () {
          SystemChrome.setPreferredOrientations([
            DeviceOrientation.portraitUp,
            DeviceOrientation.portraitDown,
            // DeviceOrientation.landscapeLeft,
            // DeviceOrientation.landscapeRight
          ]);
        });

        return false;
      },
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('WebView Load HTML Locally From assets'),
        // ),

        backgroundColor: Colors.white,
        body: WebViewPlus(
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (controller) {
            controller.loadUrl('$elearn/story.html');
          },
        ),
      ),
    );
  }
}
