import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'show_numpad_picker_method_channel.dart';

abstract class ShowNumpadPickerPlatform extends PlatformInterface {
  /// Constructs a ShowNumpadPickerPlatform.
  ShowNumpadPickerPlatform() : super(token: _token);

  static final Object _token = Object();

  static ShowNumpadPickerPlatform _instance = MethodChannelShowNumpadPicker();

  /// The default instance of [ShowNumpadPickerPlatform] to use.
  ///
  /// Defaults to [MethodChannelShowNumpadPicker].
  static ShowNumpadPickerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ShowNumpadPickerPlatform] when
  /// they register themselves.
  static set instance(ShowNumpadPickerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
