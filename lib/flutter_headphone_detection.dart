import 'dart:async';
import 'package:flutter/services.dart';

class FlutterHeadphoneDetection {
  static const MethodChannel _channel = const MethodChannel('flutter_headphone_detection');

  static Future<bool> get areHeadphonesConnected async {
    final bool headphonesConnected = await _channel.invokeMethod('areHeadphonesConnected');
    return headphonesConnected;
  }
}
