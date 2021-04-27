import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:road_2_faith/controller/page/landing_page_controller.dart';
import 'package:road_2_faith/view/widget/base_view.dart';
// TODO: No scroll physics & make the Create Account text dependend on the height on the Container (Bottom of page always)
class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    // TODO: Remember me bool should be dependend on User info
    bool _rememberMe = false;
    bool _TOS = false;
    final onAuthorization = (String content){
        Navigator.popAndPushNamed(context, '/main');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(content)
            ),
        );
    };
    return BaseView<LandingController>(
        onControllerReady: (controller){
          controller.onAuthorization = onAuthorization;
        },
        builder: (context, controller, child){
          return Scaffold(
            body: AnnotatedRegion<SystemUiOverlayStyle>(
              value: SystemUiOverlayStyle.light,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      height: double.infinity,
                      child: SingleChildScrollView(
                        physics: AlwaysScrollableScrollPhysics(),
                        padding: EdgeInsets.fromLTRB(0, 15.0, 0, 30.0),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(32, 64, 32, 16),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //TODO: Wich widget should show? (SignIn / SignUp / TOS / Forgot password / ...)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
    );
  }
  Widget _signIn(bool _rememberMe){
    Key _formKey;
    return Column(
      children: [
        _title("Welcome", "to", "Road2Faith", "Playfair", 45, "4285F4", context),
        SizedBox(height: 128,),
        _textFormField("Enter Email", "Email cannot be empty.", TextInputType.emailAddress, context),
        SizedBox(height: 24,),
        _passwordField(_formKey, context),
        SizedBox(height: 8,),
        Row(
          children: [

            // 1. checkbox & Remember me
            Row(
              children: [
                // TODO: Remember me checkbox doesn't change state
                Checkbox(
                  value: _rememberMe,
                  onChanged: (value){
                    setState(() {
                      _rememberMe = !_rememberMe;
                    });
                  },
                ),
                Text("Remember me"),
              ],
            ),
            Spacer(),
            // 2. Clickable Forgot Password? text
            Text("Forgot Password?"),
          ],
        ),
        SizedBox(height: 8,),
        ButtonTheme(
          minWidth: double.infinity,
          height: 60.0,
          child: RaisedButton(
            onPressed: () {},
            color: Color(0xff4285F4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(
              "Sign In",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        SizedBox(height: 16,),
        Text(
          "or",
          style: TextStyle(
              fontSize: 18.0
          ),
        ),
        SizedBox(height: 12,),
        _socialButtonRow(),
        SizedBox(height: 94,),
        RichText(
          text: TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(
                color: Colors.black,
              ),
              children: [
                TextSpan(
                    text: "Create new one!",
                    style: TextStyle(
                      color: Color(0xff4285F4),
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // TODO: Navigate to sign up
                      }
                ),
              ]
          ),
        ),
      ],
    );
  }

  Widget _signUp(bool _TOS){
    Key _formKey;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _title("Create", "an", "Account", "Playfair", 45, "4285F4", context),
        SizedBox(height: 44,),
        _textFormField("Enter Username", "Username cannot be empty.", TextInputType.name, context),
        SizedBox(height: 24,),
        _textFormField("Enter Email", "Email cannot be empty.", TextInputType.emailAddress, context),
        SizedBox(height: 24,),
        _passwordField(_formKey, context),
        SizedBox(height: 24,),
        _passwordField(_formKey, context),
        SizedBox(height: 8,),
        Row(
          children: [

            // 1. checkbox & TOS
            Row(
              children: [
                // TODO: Remember me checkbox doesn't change state
                Checkbox(
                  value: _TOS,
                  onChanged: (value){
                    setState(() {
                      _TOS = !_TOS;
                    });
                  },
                ),
                RichText(
                  text: TextSpan(
                    text: "By signing up you accept our ",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: "Terms Of Use",
                        style: TextStyle(
                          color: Color(0xff4285F4),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 8,),
        ButtonTheme(
          minWidth: double.infinity,
          height: 60.0,
          child: RaisedButton(
            onPressed: () {},
            color: Color(0xff4285F4),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Text(
              "Sign Up",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
        ),
        SizedBox(height: 16,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "or",
              style: TextStyle(
                  fontSize: 18.0
              ),
            ),
          ],
        ),
        SizedBox(height: 12,),
        _socialButtonRow(),
        SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                  text: "Already have an account? ",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                        text: "Sign in here!",
                        style: TextStyle(
                          color: Color(0xff4285F4),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // TODO: Navigate to sign In
                          }
                    ),
                  ]
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _socialButtonRow(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              primary: Color(0xff3b5998),
          ),
          child: Container(
            width: 40.0,
            height: 40.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle
            ),
            child: Text(
              "F",
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
          onPressed: (){
            print('click clack Facebook');
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              primary: Color(0xffDB4437),
          ),
          child: Container(
            width: 40.0,
            height: 40.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle
            ),
            child: Text(
              "G",
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
          onPressed: (){
            print('click clack Google');
          },
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
              primary: Color(0xff1DA1F2),
          ),
          child: Container(
            width: 40.0,
            height: 40.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                shape: BoxShape.circle
            ),
            child: Text(
              "T",
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
          ),
          onPressed: (){
            print('click clack Twitta');
          },
        ),
      ],
    );
  }

  Widget _textFormField(String labelText, String validator, TextInputType strType, BuildContext ctx){
    return TextFormField(
      decoration: InputDecoration(
          labelText: labelText,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide(),
          )
      ),
      validator: (val){
        if(val.length == 0){
          return validator;
        } else {
          return null;
        }
      },
      keyboardType: strType,

    );
  }

  Widget _passwordField(Key formKey, BuildContext context){
    bool _obscureText = true;
    return TextFormField(
      key: formKey,
      obscureText: _obscureText,
      //maxLength: 42,
      validator: (val){
        if(val.length == 0){
          return "Password cannot be empty.";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        labelText: "Enter Password",
        //helperText: "Must be 8 characters",
        fillColor: Colors.white,
        // TODO: Obscure text state doens't work ? :/
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
    );
  }
  
  /// This widget creates a column with the signature header in the landing page.
  /// Specify the 3 Strings in first/second/third
  /// Specify used font in fontFamily
  /// Specify fontSize
  /// Choose HEX color & will automatically make 2 opacity's
  Widget _title(String first, String second, String third, String fontFamily, double fontSize, String color, BuildContext ctx){

    // Use the HEX String & make 2 colors with opacity 50% & 100%
    String strColor50 = "0x80${color}";
    String strColor100 = "0xff${color}";

    // parse the 2 Strings
    var c1 = int.parse(strColor50);
    var c2 = int.parse(strColor100);

    // assert the String in int
    assert(c1 is int);
    assert(c2 is int);

    // Header as Widget
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          first,
          style: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSize,
            color: Color(c1), // 50% opacity
          ),
        ),
        RichText(
          text: TextSpan(
            text: "${second} ",
            style: TextStyle(
              fontFamily: fontFamily,
              fontSize: fontSize,
              color: Color(c1), // 50% opacity
            ),
            children: [
              TextSpan(
                text: third,
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: fontSize,
                  color: Color(c2), // 100% opacity
                ),
              ),
              TextSpan(
                text: ".",
                style: TextStyle(
                  fontFamily: fontFamily,
                  fontSize: fontSize,
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
