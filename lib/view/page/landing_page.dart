import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:road_2_faith/controller/page/landing_page_controller.dart';
import 'package:road_2_faith/view/widget/base_view.dart';
import 'package:road_2_faith/view/widget/title.dart';
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
                              _signIn(_rememberMe),
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
        LandingTitle(
          first: "Welcome",
          second: "to",
          third: "Road2Faith",
          fontFamily: "Playfair",
          fontSize: 45.0,
          color: "4285F4",
        ),
        SizedBox(height: 128,),
        _textFormField("Enter Email", "Email cannot be empty.", TextInputType.emailAddress),
        SizedBox(height: 24,),
        _passwordField(_formKey),
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
            TextButton(
              child: Text(
                  "Forgot Password?",
                style: TextStyle(
                  color: Color(0xff4285F4),
                ),
              ),
              onPressed: (){
                //TODO: Push to forgot password page
              },
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
        LandingTitle(
          first: "Create",
          second: "an",
          third: "Account",
          fontFamily: "Playfair",
          fontSize: 45.0,
          color: "4285F4",
        ),
        SizedBox(height: 44,),
        _textFormField("Enter Username", "Username cannot be empty.", TextInputType.name),
        SizedBox(height: 24,),
        _textFormField("Enter Email", "Email cannot be empty.", TextInputType.emailAddress),
        SizedBox(height: 24,),
        _passwordField(_formKey),
        SizedBox(height: 24,),
        _passwordField(_formKey),
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

  Widget _textFormField(String labelText, String validator, TextInputType strType){
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

  Widget _passwordField(Key formKey){
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

}
