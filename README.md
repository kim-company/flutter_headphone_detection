# Flutter Headphone Detection

A Flutter plugin that allows to detect if headphones are currently connected to the device. Supports iOS and Android, but only detects wired headphones at this time.

## Installation

Add flutter_headphone_detection to your `pubspec.yaml` file:
```yaml
dependencies:
  ...
  flutter_headphone_detection:
    git:
        url: git://github.com/kim-company/flutter_headphone_detection.git
```

## Usage

You can check the status of the headphone connection in your dart code as following:
```dart
bool headphonesConnected;

try {
  headphonesConnected = await FlutterHeadphoneDetection.areHeadphonesConnected;
} on PlatformException {
  headphonesConnected = false;
}
```
