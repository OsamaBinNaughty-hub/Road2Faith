import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:road_2_faith/controller/page/landing_page_controller.dart';
import 'package:road_2_faith/view/widget/base_view.dart';
import 'package:road_2_faith/view/widget/landing_big_button.dart';
import 'package:road_2_faith/view/widget/landing_text_field.dart';
import 'package:road_2_faith/view/widget/landing_title.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LandingController>(
      onControllerReady: (controller){

      },
      builder: (context, controller, child){
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            elevation: 0.0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
          ),
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
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 30.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                LandingTitle(
                                  first: "Reset",
                                  second: "your",
                                  third: "Password",
                                  fontFamily: "Playfair",
                                  fontSize: 45.0,
                                  color: "4285F4",
                                ),
                                SizedBox(height: 24.0,),
                                Container(
                                  width: 350,
                                  child: Text(
                                    "Enter the email associated with your account and we'll send an email with instructions to reset your password."
                                  ),
                                ),
                                SizedBox(height: 24.0,),
                                LandingTextField(
                                  labelText: "Enter Email",
                                  validatorText: "Email cannot be empty.",
                                  keyBoardType: TextInputType.emailAddress,
                                ),
                                SizedBox(height: 24.0,),
                                LandingBigButton(
                                  title: "Send Instructions",
                                  //TODO: Send email with instructions + temporary widget screen??
                                  onPressed: (){},
                                ),
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
}
