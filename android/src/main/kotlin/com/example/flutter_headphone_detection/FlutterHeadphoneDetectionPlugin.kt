package com.example.flutter_headphone_detection

import android.content.Context
import android.media.AudioDeviceInfo
import android.media.AudioManager
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
      channel.setMethodCallHandler(FlutterHeadphoneDetectionPlugin(registrar.context()))
    }
  }

  var context: Context? = null

  constructor(ctx: Context) {
    this.context = ctx;
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "areHeadphonesConnected") {
      val audioManager = this.context!!.getSystemService(Context.AUDIO_SERVICE) as AudioManager
      val audioDevices = audioManager.getDevices(AudioManager.GET_DEVICES_ALL)
      for (deviceInfo in audioDevices) {
        if (deviceInfo.getType() === AudioDeviceInfo.TYPE_WIRED_HEADPHONES || deviceInfo.getType() === AudioDeviceInfo.TYPE_WIRED_HEADSET) {
          result.success(true);
          return;
        }
      }

      result.success(false);
    } else {
      result.notImplemented()
    }
  }
}
