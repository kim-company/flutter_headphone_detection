package com.example.flutter_headphone_detection

import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar

class FlutterHeadphoneDetectionPlugin: MethodCallHandler {
  companion object {
    @JvmStatic
    fun registerWith(registrar: Registrar) {
      val channel = MethodChannel(registrar.messenger(), "flutter_headphone_detection")
      channel.setMethodCallHandler(FlutterHeadphoneDetectionPlugin())
    }
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "areHeadphonesConnected") {
      result.notImplemented()
    } else {
      result.notImplemented()
    }
  }
}
