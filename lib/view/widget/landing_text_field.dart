import 'package:flutter/material.dart';

class LandingTextField extends StatefulWidget {
  const LandingTextField({
    this.labelText,
    this.validatorText,
    this.keyBoardType,
    this.textEditingController,
  });

  final String labelText;
  final String validatorText;
  final TextInputType keyBoardType;
  final TextEditingController textEditingController;

  @override
  _LandingTextFieldState createState() => _LandingTextFieldState();
}

class _LandingTextFieldState extends State<LandingTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          labelText: widget.labelText,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(),
          )
      ),
      validator: (val){
        if(val.length == 0){
          return widget.validatorText;
        } else {
          return null;
        }
      },
      keyboardType: widget.keyBoardType,
      controller: widget.textEditingController,
    );
  }
}
