import 'package:flutter/cupertino.dart';

class LandingController extends ChangeNotifier {
   //call this function if you want to go to MainPage
   Function(String) onAuthorization;

   // Tex
   TextEditingController usernameController = new TextEditingController();
   TextEditingController emailController = new TextEditingController();
   TextEditingController passwordController = new TextEditingController();
   TextEditingController passwordVerifyController = new TextEditingController();

   @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    passwordVerifyController.dispose();
    super.dispose();
  }

  // sign in function

  // remember me function

  // forgot password function

  // sign up function

  // TOS accept function

  // sign in with facebook function

  // sign in with google function

  // sign in with twitter function
}