import 'show_numpad_picker_platform_interface.dart';
import 'package:flutter/material.dart';

class ShowNumpadPicker {
  Future<String?> getPlatformVersion() {
    return ShowNumpadPickerPlatform.instance.getPlatformVersion();
  }
}

Future<String?> showNumpadPicker(BuildContext context, {
  required int length,
  bool isFloat = false,
  bool isPassword = false,
  String doneMessage = 'done',
}) {
  return showModalBottomSheet<String>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      String selectedValue = '';
      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Numpad(
                    length: length,
                    isFloat: isFloat,
                    isPassword: isPassword,
                    onChange: (value) {
                      setState(() {
                        selectedValue = value;
                      });
                    },
                  ),
                  SizedBox(
                    // set maximum
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop(selectedValue);
                      },
                      child: Text(
                        doneMessage,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

class Numpad extends StatefulWidget {
  final int length;
  final bool isFloat;
  final bool isPassword;
  final Function(String) onChange;
  Numpad({
    Key? key,
    required this.length,
    required this.isFloat,
    required this.isPassword,
    required this.onChange,
  })
      : super(key: key);

  @override
  _NumpadState createState() => _NumpadState();
}

class _NumpadState extends State<Numpad> {
  String number = '';

  setValue(String val) {
    if (val == '.' && number.isEmpty) {
      // 最初に . が入力された場合、0. とする
      setState(() {
        number = '0.';
        widget.onChange(number);
      });
      return;
    }

    if (val == '.' && number.contains('.')) {
      // 既に . が含まれている場合は何もしない
      return;
    }

    if (number.length < widget.length) {
      setState(() {
        number += val;
        widget.onChange(number);
      });
    }
  }

  backspace(String text) {
    if (text.isNotEmpty) {
      setState(() {
        number = text.substring(0, text.length - 1);
        widget.onChange(number);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 50.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          widget.isPassword ?
            PasswordPreview(text: number, length: widget.length) :
            Preview(text: number, length: widget.length),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: NumpadButton(
                    text: '1',
                    onPressed: () => setValue('1'),
                  ),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: NumpadButton(
                    text: '2',
                    onPressed: () => setValue('2'),
                  ),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: NumpadButton(
                    text: '3',
                    onPressed: () => setValue('3'),
                  ),
                ),
              ),
            ],
          ),
          // 他の行のボタンを同様に配置
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: NumpadButton(
                    text: '4',
                    onPressed: () => setValue('4'),
                  ),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: NumpadButton(
                    text: '5',
                    onPressed: () => setValue('5'),
                  ),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: NumpadButton(
                    text: '6',
                    onPressed: () => setValue('6'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: NumpadButton(
                    text: '7',
                    onPressed: () => setValue('7'),
                  ),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: NumpadButton(
                    text: '8',
                    onPressed: () => setValue('8'),
                  ),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: NumpadButton(
                    text: '9',
                    onPressed: () => setValue('9'),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              widget.isFloat ?
              Expanded(
                  child: AspectRatio(
                    aspectRatio: 1.0,
                    child: NumpadButton(
                      text: '.',
                      onPressed: () => setValue('.'),
                    ),
                  )
              ) :
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: NumpadButton(haveBorder: false),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: NumpadButton(
                    text: '0',
                    onPressed: () => setValue('0'),
                  ),
                ),
              ),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: NumpadButton(
                    haveBorder: false,
                    icon: Icons.backspace,
                    onPressed: () => backspace(number),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

/// Preview  for Password
class PasswordPreview extends StatelessWidget {
  final int length;
  final String text;
  const PasswordPreview({Key? key, required this.length, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> previewLength = [];
    for (var i = 0; i < length; i++) {
      previewLength.add(Dot(isActive: text.length >= i + 1));
    }
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Wrap(children: previewLength));
  }
}

class Preview extends StatelessWidget {
  final int? length;
  final String text;
  const Preview({Key? key, this.length, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        text.isEmpty ? '0' : text,  // textが空の場合は'0'を表示
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final bool isActive;
  const Dot({Key? key, this.isActive = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: Container(
        width: 15.0,
        height: 15.0,
        decoration: BoxDecoration(
          color: isActive ? Theme.of(context).primaryColor : Colors.transparent,
          border: Border.all(width: 1.0, color: Theme.of(context).primaryColor),
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}

class NumpadButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final bool haveBorder;
  final VoidCallback? onPressed;
  const NumpadButton(
      {Key? key, this.text, this.icon, this.haveBorder = true, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle buttonStyle =
    TextStyle(fontSize: 22.0, color: Theme.of(context).primaryColor);
    Widget label = icon != null
        ? Icon(
      icon,
      color: Theme.of(context).primaryColor.withOpacity(0.8),
      size: 35.0,
    )
        : Text(this.text ?? '', style: buttonStyle);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: icon != null
              ? Colors.transparent
              : Theme.of(context).primaryColor.withOpacity(0.3),
          side: haveBorder
              ? BorderSide(color: Colors.grey[400]!)
              : BorderSide.none,
          shape: CircleBorder(),
          padding: EdgeInsets.all(20.0),
          splashFactory:
          icon != null ? NoSplash.splashFactory : InkRipple.splashFactory,
        ),
        onPressed: onPressed,
        child: label,
      ),
    );
  }
}
