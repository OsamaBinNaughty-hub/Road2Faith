
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:road_2_faith/controller/page/google_sign_in.dart';
import 'package:road_2_faith/controller/page/landing_page_controller.dart';
import 'package:road_2_faith/view/page/forgot_password_page.dart';
import 'package:road_2_faith/view/page/main_page.dart';
import 'package:road_2_faith/view/widget/base_view.dart';
import 'package:road_2_faith/view/widget/checkbox_with_text.dart';
import 'package:road_2_faith/view/widget/landing_big_button.dart';
import 'package:road_2_faith/view/widget/landing_bottom_text.dart';
import 'package:road_2_faith/view/widget/landing_password_field.dart';
import 'package:road_2_faith/view/widget/landing_text_field.dart';
import 'package:road_2_faith/view/widget/landing_title.dart';
import 'package:road_2_faith/controller/page/facebook_login.dart';

// TODO: No scroll physics in landing page.
// TODO: Static bottom text.
// TODO: Remember me bool should be dependend on User info.
// TODO: A way to go to the Sign Up page from Sign In.
// TODO: Better logging of onPressed/onTap functions.
// TODO: Find a way to clear the Navigator Stack in certain pushes.

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    final onAuthorization = (String content) {
      Navigator.popAndPushNamed(context, '/main');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(content)
        ),
      );
    };
    return BaseView<LandingController>(
      onControllerReady: (controller) {
        controller.onAuthorization = onAuthorization;
      },
      builder: (context, controller, child) {
        return Scaffold(
          backgroundColor: Colors.white,
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
                            Column(
                              children: [
                                _signIn(controller, context),
                              ],
                            ),
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

  Widget _signIn(LandingController controller, BuildContext context) {
    Key _formKey;
    String email;
    String password;
    return Column(
      children: [
        LandingTitle(
          first: "Welcome",
          second: "to",
          third: "Road2Faith",
          fontFamily: "Playfair",
          fontSize: 45.0,
          color: "4285F4",
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        SizedBox(height: 128,),
        LandingTextField(
          labelText: "Enter Email",
          validatorText: "Email cannot be empty.",
          keyBoardType: TextInputType.emailAddress,
          textEditingController: controller.emailController,
        ),
        SizedBox(height: 24,),
        LandingPasswordField(
          fieldKey: _formKey,
          labelText: "Enter Password",
          validatorText: "Password cannot be empty",
        ),
        SizedBox(height: 8,),
        Row(
          children: [
            CheckBoxWithText(
              text: "Remember me",
            ),
            Spacer(),
            TextButton(
              child: Text(
                "Forgot Password?",
                style: TextStyle(
                  color: Color(0xff4285F4),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ForgotPasswordPage()
                  ),
                );
              },
            ),
          ],
        ),
        SizedBox(height: 8,),
        LandingBigButton(
          title: "Sign In",
          //TODO: Sign In + push to MainPage
          onPressed: () {
    auth.signInWithEmailAndPassword(email: email, password: password).then((_){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));
          },
        );
    }
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
        SizedBox(height: 65,),
        LandingBottomText(
          show: true,
          firstStr: "Don't have an account?",
          secondStr: "Create new one!",
          pushWidget: "/signUp",
        ),
      ],
    );
  }

  // TODO: Social SignIn with FireBase.
  // TODO: Better Social bubbles.
  Widget _socialButtonRow() {
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
              onPressed: () async {
    await signUpWithFacebook();
    {print('Facebook SignIn requested');}

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
                    onPressed: () async {
                         await googleSignUp();
                          {print('Google SignIn requested');}


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
                            onPressed: () {
                              print('Twitter SignIn requested');
                            }
                          );
                        }
                        );

              }
          )

    ] );
  }
}