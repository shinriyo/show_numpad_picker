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
        child: ElevatedButton(
          onPressed: () => _pickNumber(context),
          child: const Text('Pick a Number'),
        ),
      ),
    );
  }

  void _pickNumber(BuildContext context) async {
    final result = await showNumpadPicker(context, length: 4);
    if (result != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Selected number: $result")),
      );
    }
  }
}
