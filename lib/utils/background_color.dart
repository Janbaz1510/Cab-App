import 'package:flutter/material.dart';

class BackgroundColor extends StatefulWidget {
  @override
  _BackgroundColorState createState() => _BackgroundColorState();
}

class _BackgroundColorState extends State<BackgroundColor> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: <Color>[
              Color(0xff281483),
              Color(0xff8F6ED5),
              Color(0xffD782D9),
            ],
          ),
        ),
      ),
    );
  }
}