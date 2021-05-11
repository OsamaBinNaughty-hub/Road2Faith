import 'package:flutter/material.dart';

class LandingBottomText extends StatefulWidget {
  LandingBottomText({
    this.show,
    this.firstStr,
    this.secondStr,
    this.pushWidget,
  });

  final bool show;
  final String firstStr;
  final String secondStr;
  final String pushWidget;

  @override
  _LandingBottomTextState createState() => _LandingBottomTextState();
}

class _LandingBottomTextState extends State<LandingBottomText> {
  @override
  Widget build(BuildContext context) {
    if(widget.show == true){
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.firstStr),
          TextButton(
            child: Text(
              widget.secondStr,
              style: TextStyle(
                color: Color(0xff4285F4),
              ),
            ),
            onPressed: () => Navigator.popAndPushNamed(context, widget.pushWidget),
          ),
        ],
      );
    } else {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Positioned(
          child: Text("Nothing to see here :)"),
        ),
      );
    }
  }
}