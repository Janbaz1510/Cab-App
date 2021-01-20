import 'dart:async';

import 'package:flutter/material.dart';
import 'package:testapp/routes/routes.dart';
import 'package:testapp/utils/constants.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    handleTimer();
  }

  handleTimer() {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, gettingStarted);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      body: Container(
        decoration: commonBackgroundDecoration,
        child: Center(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset('assets/images/ss.png', height: 171, width: 171),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 0, top: 60, right: 0, bottom: 0),
                    child: Text(
                      "Cab App",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
