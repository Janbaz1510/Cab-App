import 'package:flutter/material.dart';
import 'package:testapp/pages/splashscreen.dart';
import 'package:testapp/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes(),
      home: SplashScreen(),
    );
  }
}
