import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class SplashPage extends StatefulWidget {
  final Function onComplete;
  SplashPage({Key key, this.onComplete}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState(){
    super.initState();
    _initialize();
  }

  setupFirebase() async {
    /// Initialize Firebase
    await Firebase.initializeApp();
    debugPrint('Firebase initialized...');

    /// Enable FirebaseCrashlytics
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
      debugPrint('Firebase Crashlytics collection enabled...');

    /// Pass all uncaught errors from the framework to Crashlytics.
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
      debugPrint('Firebase Crashlytics flutter errors enabled...');
  }

  _initialize() async {
    /// Initialize all app dependencies

    /// initialize Firebase and related services

    // This should be in setupFirebase().then(_){}
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      widget.onComplete();
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
