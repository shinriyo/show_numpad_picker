
import 'show_numpad_picker_platform_interface.dart';

class ShowNumpadPicker {
  Future<String?> getPlatformVersion() {
    return ShowNumpadPickerPlatform.instance.getPlatformVersion();
  }
}
