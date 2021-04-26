import 'package:flutter/cupertino.dart';

class CreateProfileController extends ChangeNotifier {
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  // birth-date controller
  // gender buttons controller
  // Religion dropdown controller
  // Nationality dropdown controller

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    super.dispose();
  }

  // submit function

}