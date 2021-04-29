import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';



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

  FirebaseCrashlytics crashlytics;
  _initialize() async {
    WidgetsFlutterBinding.ensureInitialized();
    /// Initialize all app dependencies
    await Firebase.initializeApp();

    /// initialize Firebase and related services


    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    final Function originalOnError = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails errorDetails)
     async {
        print(errorDetails);

        await FirebaseCrashlytics.instance.recordFlutterError(errorDetails);

        originalOnError(errorDetails);
      };


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
