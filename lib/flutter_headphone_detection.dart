import 'dart:async';
import 'package:flutter/services.dart';

class FlutterHeadphoneDetection {
  static const MethodChannel _channel = const MethodChannel('flutter_headphone_detection');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
