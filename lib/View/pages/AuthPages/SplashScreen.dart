import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pak_endo/View/pages/AuthPages/Signin.dart';
import 'package:pak_endo/View/pages/UserMain.dart';
import 'package:pak_endo/View/pages/homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _iconAnimationController;
  late Animation<double> _iconAnimation;

  void handleTimeout() {
    Navigator.of(context).pushReplacement(
        new MaterialPageRoute(builder: (_) => new memberIdSigninpage()));
  }

  startTimeout() async {
    var duration = const Duration(seconds: 4);
    return new Timer(duration, handleTimeout);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 2500));

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeIn);
    _iconAnimation.addListener(() => this.setState(() {}));

    _iconAnimationController.forward();

    startTimeout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
          body: Center(
              child: Image.asset(
        "assets/Logo_Icon.png",
        width: _iconAnimation.value * 400,
        height: _iconAnimation.value * 400,
      ))),
    );
  }
}