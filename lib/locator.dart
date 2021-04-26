import 'package:get_it/get_it.dart';
import 'package:road_2_faith/controller/page/create_profile_controller.dart';
import 'package:road_2_faith/controller/page/landing_page_controller.dart';
import 'package:road_2_faith/controller/page/main_page_controller.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => MainPageController());
  locator.registerFactory(() => LandingController());
  //locator.registerFactory(() => CreateProfileController());
}