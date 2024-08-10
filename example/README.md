# show_numpad_picker Example

This example demonstrates how to use the `show_numpad_picker` plugin to allow users to input numbers using a customizable numpad picker in a Flutter application.

## Features

- **Customizable Numpad Picker**: Configure the numpad picker to accept either integers or floating-point numbers.
- **Real-Time Preview**: Display the user's input in real-time as they type.
- **Flexible Configuration**: Set options like the maximum length of the input and whether to allow floating-point numbers.

## Getting Started

Ensure you have added `show_numpad_picker` as a dependency in your main project. Here's how to use the plugin in this example:

### Example 1: Integer Input

This example shows how to allow users to pick an integer using the numpad picker.

```dart
import 'package:flutter/material.dart';
import 'package:show_numpad_picker/show_numpad_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Numpad Picker Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () => _pickInteger(context),
            child: Text('Pick an Integer'),
          ),
        ),
      ),
    );
  }

  void _pickInteger(BuildContext context) async {
    final int? result = await showNumpadPicker<int>(
      context,
      length: 4,
      isFloat: false,
    );

    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Selected integer: $result")),
      );
    }
  }
}

