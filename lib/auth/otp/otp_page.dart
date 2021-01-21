import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testapp/auth/otp/otp_interface.dart';
import 'package:testapp/auth/otp/otp_ui.dart';

class OTPPage extends StatefulWidget {
  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> implements OTPInterface {
  String mobileNumber = "";

  @override
  Widget build(BuildContext context) {
    mobileNumber = ModalRoute.of(context).settings.arguments;

    return OTPUI(
      otpInterface: this,
      mobileNumber: mobileNumber,
    );
  }

  @override
  void loginWithOTP(String otp) {
    print(otp);
  }

  @override
  Future<void> initializeOtp(String mobileNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: mobileNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int resendToken) {
        print("Verification ID : $verificationId");
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
