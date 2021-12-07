import 'package:flutter/services.dart';

class FlutterPlayerPlugin {
  static const MethodChannel _channel = const MethodChannel('plugins');

  static Future<void> fullScreen() async {
    await _channel.invokeMethod('fullScreen');
  }
}
