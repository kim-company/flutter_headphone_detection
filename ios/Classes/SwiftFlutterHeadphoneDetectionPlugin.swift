import Flutter
import UIKit
import AVFoundation

public class SwiftFlutterHeadphoneDetectionPlugin: NSObject, FlutterPlugin {
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "flutter_headphone_detection", binaryMessenger: registrar.messenger())
        
        let instance = SwiftFlutterHeadphoneDetectionPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "areHeadphonesConnected" {
            let currentAudioRoute = AVAudioSession.sharedInstance().currentRoute
            let headphoneOutputs = currentAudioRoute.outputs.filter({ $0.portType == AVAudioSessionPortHeadphones })
            
            result(headphoneOutputs.count >= 1)
        }
        else {
            result(FlutterMethodNotImplemented)
        }
    }
    
}
