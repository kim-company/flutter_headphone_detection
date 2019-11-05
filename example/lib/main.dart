import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_headphone_detection/flutter_headphone_detection.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _headphonesConnected = false;

  @override
  void initState() {
    super.initState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> checkHeadphonesStatus() async {
    bool headphonesConnected;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      headphonesConnected = await FlutterHeadphoneDetection.areHeadphonesConnected;
    } on PlatformException {
      headphonesConnected = false;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _headphonesConnected = headphonesConnected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Headphone detection example app'),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                RaisedButton(child: Text('Check headphone status'), onPressed: checkHeadphonesStatus),
                SizedBox(height: 16),
                Text('Headphones connected: $_headphonesConnected\n'),
              ]),
        ),
      ),
    );
  }
}
