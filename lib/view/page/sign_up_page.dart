import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:road_2_faith/controller/page/landing_page_controller.dart';
import 'package:road_2_faith/view/widget/base_view.dart';
import 'package:road_2_faith/view/widget/checkbox_with_text.dart';
import 'package:road_2_faith/view/widget/landing_big_button.dart';
import 'package:road_2_faith/view/widget/landing_bottom_text.dart';
import 'package:road_2_faith/view/widget/landing_password_field.dart';
import 'package:road_2_faith/view/widget/landing_text_field.dart';
import 'package:road_2_faith/view/widget/landing_title.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LandingController>(
      onControllerReady: (controller){

      },
      builder: (context, controller, child){
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
                                _signUp(controller, context),
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

  Widget _signUp(LandingController controller, BuildContext context){
    String password;
    String email;
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
          crossAxisAlignment: CrossAxisAlignment.start,
        ),
        SizedBox(height: 44,),
        LandingTextField(
          labelText: "Enter Username",
          validatorText: "Username cannot be empty.",
          keyBoardType: TextInputType.name,
          textEditingController: controller.usernameController,
        ),
        SizedBox(height: 24,),
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
          validatorText: "Password must atleast be 8 characters.",
          onFieldSubmitted: (value) => password,
          textEditingController: controller.passwordController,
        ),
        SizedBox(height: 24,),
        LandingPasswordField(
          fieldKey: _formKey,
          labelText: "Verify Password",
          validatorText: "Must match the other password.",
          textEditingController: controller.passwordVerifyController,
        ),
        SizedBox(height: 8,),
        CheckBoxWithTextAndButton(
          text: "By signing up you accept the",
          textInButton: "Terms Of Use",
          onPressed: (){},
        ),
        SizedBox(height: 8,),
        LandingBigButton(
          title: "Sign Up",
          // TODO: Sign Up + push to Sing In
          onPressed: (){}
        ),

        SizedBox(height: 80,),
        LandingBottomText(
          show: true,
          firstStr: "Already have an account?",
          secondStr: "Sign in here!",
          pushWidget: "/landing",
        ),
      ],
    );
  }

}