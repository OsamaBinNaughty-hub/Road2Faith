import 'package:flutter/material.dart';
import 'file:///C:/Users/dries/OneDrive/Documenten/apps/road_2_faith/lib/view/page/splash_page.dart';
import 'package:road_2_faith/view/page/main_page.dart';

void main() {
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
          // normally to "/landing"
          onComplete: () => Navigator.popAndPushNamed(context, "/main"),
        ),
        //"/landing": (context) => Landing(),
        "/main": (context) => MainPage(),
      },
    );
  }
}

