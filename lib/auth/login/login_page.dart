import 'package:flutter/material.dart';
import 'package:testapp/auth/login/login_interface.dart';
import 'package:testapp/auth/login/login_ui.dart';
import 'package:testapp/routes/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginInterface {
  @override
  Widget build(BuildContext context) {
    return LoginUI(
      interface: this,
    );
  }

  @override
  void loginWithMobile(String mobile) {
    Navigator.pushNamed(context, otpScreen, arguments: mobile);
  }
}
