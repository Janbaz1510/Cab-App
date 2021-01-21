import 'package:flutter/material.dart';
import 'package:testapp/auth/otp/otp_interface.dart';
import 'package:testapp/auth/otp/otp_ui.dart';

class OTPPage extends StatefulWidget {
  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> implements OTPInterface {
  @override
  Widget build(BuildContext context) {
    return OTPUI(otpInterface: this,);
  }

  @override
  void loginWithOTP(String otp) {
    print(otp);
  }
}