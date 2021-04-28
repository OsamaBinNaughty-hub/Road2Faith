import 'package:flutter/material.dart';

class LandingBigButton extends StatefulWidget {
  const LandingBigButton({
    this.title,
    this.onPressed,
  });

  final String title;
  final Function onPressed;

  @override
  _LandingBigButtonState createState() => _LandingBigButtonState();
}

class _LandingBigButtonState extends State<LandingBigButton> {
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.infinity,
      height: 60.0,
      child: RaisedButton(
        onPressed: widget.onPressed,
        color: Color(0xff4285F4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          widget.title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
