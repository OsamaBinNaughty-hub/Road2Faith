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
