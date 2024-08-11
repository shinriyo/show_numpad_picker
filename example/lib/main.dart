import 'package:flutter/material.dart';
import 'package:show_numpad_picker/show_numpad_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'summand Picker Example',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Numpad Picker Example')),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => _pickNumber(context, false),
              child: const Text('Pick a Number (int)'),
            ),
            ElevatedButton(
              onPressed: () => _pickNumber(context, true),
              child: const Text('Pick a Number (double)'),
            ),
          ],
        ),
      ),
    );
  }

  void _pickNumber(BuildContext context, bool isFloat) async {
    final result = await showNumpadPicker(context, length: 8, isFloat: isFloat);
    if (result != null) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Selected number: $result")),
        );
      }
    }
  }
}
