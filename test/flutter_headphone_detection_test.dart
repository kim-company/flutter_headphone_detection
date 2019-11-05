import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_headphone_detection/flutter_headphone_detection.dart';

void main() {
  const MethodChannel channel = MethodChannel('flutter_headphone_detection');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await FlutterHeadphoneDetection.platformVersion, '42');
  });
}
