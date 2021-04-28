import 'package:flutter/material.dart';

class LandingPasswordField extends StatefulWidget {
  const LandingPasswordField({
    this.fieldKey,
    this.labelText,
    this.validatorText,
    this.textEditingController,
    this.onFieldSubmitted,
  });

  final Key fieldKey;
  final String labelText;
  final String validatorText;
  final TextEditingController textEditingController;
  final ValueChanged<String> onFieldSubmitted;

  @override
  _LandingPasswordFieldState createState() => _LandingPasswordFieldState();
}

class _LandingPasswordFieldState extends State<LandingPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      obscureText: _obscureText,
      //maxLength: 42,
      validator: (val){
        if(val.length == 0){
          return widget.validatorText;
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: widget.labelText,
        //helperText: "Must be 8 characters",
        fillColor: Colors.white,
        suffixIcon: GestureDetector(
          onTap: (){
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(),
        ),
      ),
      controller: widget.textEditingController,
      onFieldSubmitted: widget.onFieldSubmitted,
    );
  }
}
