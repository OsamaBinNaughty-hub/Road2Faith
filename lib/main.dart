import 'package:flutter/material.dart';
import 'package:road_2_faith/locator.dart';
import 'package:road_2_faith/view/page/landing_page.dart';
import 'file:///C:/Users/dries/OneDrive/Documenten/apps/road_2_faith/lib/view/page/splash_page.dart';
import 'package:road_2_faith/view/page/main_page.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Road2Faith",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => SplashPage(
          onComplete: () => Navigator.popAndPushNamed(context, "/landing"),
        ),
        "/landing": (context) => Landing(),
        "/main": (context) => MainPage(),
      },
    );
  }
}

