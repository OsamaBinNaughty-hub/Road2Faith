import 'package:flutter/material.dart';

class CheckBoxWithText extends StatefulWidget {
  const CheckBoxWithText({
    this.text,
  });

  final String text;

  @override
  _CheckBoxWithTextState createState() => _CheckBoxWithTextState();
}

class _CheckBoxWithTextState extends State<CheckBoxWithText> {
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _checkbox,
          onChanged: (value) {
            setState(() {
              _checkbox = !_checkbox;
            });
          },
        ),
        Text(widget.text),
      ],
    );
  }
}

class CheckBoxWithTextAndButton extends StatefulWidget {
  const CheckBoxWithTextAndButton({
    this.text,
    this.textInButton,
    this.onPressed,
  });

  final String text;
  final String textInButton;
  final Function onPressed;

  @override
  _CheckBoxWithTextAndButtonState createState() => _CheckBoxWithTextAndButtonState();
}

class _CheckBoxWithTextAndButtonState extends State<CheckBoxWithTextAndButton> {
  bool _checkbox = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _checkbox,
          onChanged: (value) {
            setState(() {
              _checkbox = !_checkbox;
            });
          },
        ),
        Text(widget.text),
        TextButton(
          child: Text(
            widget.textInButton,
            style: TextStyle(
              color: Color(0xff4285F4),
            ),
          ),
          onPressed: widget.onPressed,
        ),
      ],
    );
  }
}

