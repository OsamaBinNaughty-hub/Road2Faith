import 'package:flutter/material.dart';

class LandingTitle extends StatefulWidget {
  const LandingTitle({
    this.first,
    this.second,
    this.third,
    this.fontFamily,
    this.fontSize,
    this.color,
    this.crossAxisAlignment,
  });

  final String first;
  final String second;
  final String third;
  final String fontFamily;
  final double fontSize;
  final String color;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  _LandingTitleState createState() => _LandingTitleState();
}

/// This widget creates a column with the signature header in the landing page.
/// Specify the 3 Strings in first/second/third
/// Specify used font in fontFamily
/// Specify fontSize
/// Choose HEX color & will automatically make 2 opacity's
class _LandingTitleState extends State<LandingTitle> {
  @override
  Widget build(BuildContext context) {

    // Use the HEX String & make 2 colors with opacity 50% & 100%
    String strColor50 = "0x80${widget.color}";
    String strColor100 = "0xff${widget.color}";

    // parse the 2 Strings
    var c1 = int.parse(strColor50);
    var c2 = int.parse(strColor100);

    // assert the String in int
    assert(c1 is int);
    assert(c2 is int);

    return Column(
      crossAxisAlignment: widget.crossAxisAlignment,
      children: [
        Text(
          widget.first,
          style: TextStyle(
            fontFamily: widget.fontFamily,
            fontSize: widget.fontSize,
            color: Color(c1), // 50% opacity
          ),
        ),
        RichText(
          text: TextSpan(
            text: "${widget.second} ",
            style: TextStyle(
              fontFamily: widget.fontFamily,
              fontSize: widget.fontSize,
              color: Color(c1), // 50% opacity
            ),
            children: [
              TextSpan(
                text: widget.third,
                style: TextStyle(
                  fontFamily: widget.fontFamily,
                  fontSize: widget.fontSize,
                  color: Color(c2), // 100% opacity
                ),
              ),
              TextSpan(
                text: ".",
                style: TextStyle(
                  fontFamily: widget.fontFamily,
                  fontSize: widget.fontSize,
                  color: Color(c2), // 100% opacity
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

