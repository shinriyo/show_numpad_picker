import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'show_numpad_picker_platform_interface.dart';

/// An implementation of [ShowNumpadPickerPlatform] that uses method channels.
class MethodChannelShowNumpadPicker extends ShowNumpadPickerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('show_numpad_picker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
