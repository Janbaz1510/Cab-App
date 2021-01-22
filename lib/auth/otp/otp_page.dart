import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:testapp/auth/otp/otp_interface.dart';
import 'package:testapp/auth/otp/otp_ui.dart';

class OTPPage extends StatefulWidget {
  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> implements OTPInterface {
  String mobileNumber = "";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = "";
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    mobileNumber = ModalRoute.of(context).settings.arguments;

    return LoadingOverlay(
      isLoading: isLoading,
      child: OTPUI(
        otpInterface: this,
        mobileNumber: mobileNumber,
      ),
    );
  }

  @override
  void loginWithOTP(String otp) async {
    await _signInWithMobile(otp: otp);
  }

  @override
  Future<void> initializeOtp(String mobileNumber) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: mobileNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        _signInWithMobile(credential: credential);
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int resendToken) {
        setState(() {
          isLoading = false;
          this.verificationId = verificationId;
        });
        print("Verification ID : $verificationId");
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> _signInWithMobile({String otp, PhoneAuthCredential credential}) async {
    setState(() {
      isLoading = true;
    });
    PhoneAuthCredential cr;
    if (credential == null) {
      cr = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otp);
    } else {
      cr = credential;
    }
    UserCredential userCredential = await _auth.signInWithCredential(cr);
    User user = userCredential.user;
    print(user.uid);
    setState(() {
      isLoading = false;
    });
  }
}
