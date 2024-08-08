# Numpad Picker for Flutter

`showNumpadPicker` is a Flutter widget that provides a clean and intuitive interface for numeric input via a modal bottom sheet. This widget is designed to mimic the functionality of `showDatePicker`, making it easy to collect fixed-length numeric inputs such as PIN codes, verification codes, or any other numeric data in your Flutter app.

## Features

- **Customizable Length**: Specify the exact number of digits users can input, making it suitable for various use cases.
- **Real-time Feedback**: As users input digits, they are displayed dynamically, providing immediate feedback.
- **Backspace Support**: Includes a backspace button to allow easy correction of mistakes.
- **Seamless Integration**: Once the user confirms their input by pressing the "Done" button, the entered value is returned to the calling function, enabling easy integration with forms or other input fields.

## Installation

Add this widget to your project by copying the provided code or integrating it into your own custom widget.

## Usage

To use the `showNumpadPicker`, simply call the function with the desired length:

```dart
void _pickNumber(BuildContext context) async {
  final result = await showNumpadPicker(context, length: 4);
  if (result != null) {
    print("Selected number: $result");
  }
}

