import 'package:get_it/get_it.dart';
import 'package:road_2_faith/controller/page/main_page_controller.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerFactory(() => MainPageController());
}