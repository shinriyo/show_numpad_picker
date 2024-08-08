import 'package:flutter_test/flutter_test.dart';
import 'package:show_numpad_picker/show_numpad_picker.dart';
import 'package:show_numpad_picker/show_numpad_picker_platform_interface.dart';
import 'package:show_numpad_picker/show_numpad_picker_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockShowNumpadPickerPlatform
    with MockPlatformInterfaceMixin
    implements ShowNumpadPickerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final ShowNumpadPickerPlatform initialPlatform = ShowNumpadPickerPlatform.instance;

  test('$MethodChannelShowNumpadPicker is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelShowNumpadPicker>());
  });

  test('getPlatformVersion', () async {
    ShowNumpadPicker showNumpadPickerPlugin = ShowNumpadPicker();
    MockShowNumpadPickerPlatform fakePlatform = MockShowNumpadPickerPlatform();
    ShowNumpadPickerPlatform.instance = fakePlatform;

    expect(await showNumpadPickerPlugin.getPlatformVersion(), '42');
  });
}
