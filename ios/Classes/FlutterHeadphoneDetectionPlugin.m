#import "FlutterHeadphoneDetectionPlugin.h"
#import <flutter_headphone_detection/flutter_headphone_detection-Swift.h>

@implementation FlutterHeadphoneDetectionPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftFlutterHeadphoneDetectionPlugin registerWithRegistrar:registrar];
}
@end
