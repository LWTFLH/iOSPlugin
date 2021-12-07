import 'dart:async';

import 'package:flutter/services.dart';

class FlutterPlayerPlugin {
  static const MethodChannel _channel = const MethodChannel('plugins');

  static Future<void> fullScreen() async {
    await _channel.invokeMethod('fullScreen');
  }
}

class FlutterPluginTest {
  static const MethodChannel _channel =
      const MethodChannel('flutter_plugin_test');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
