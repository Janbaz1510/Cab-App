import 'package:flutter/material.dart';
import 'package:testapp/auth/otp/otp_interface.dart';
import 'package:testapp/routes/routes.dart';
import 'package:testapp/utils/constants.dart';

class OTPUI extends StatefulWidget {
  final OTPInterface otpInterface;
  final String mobileNumber;
  OTPUI({this.otpInterface, this.mobileNumber});

  @override
  _OTPUIState createState() => _OTPUIState();
}

class _OTPUIState extends State<OTPUI> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> _animationValue;
  bool isSendingOtp = true;

  final TextEditingController _otpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _animationValue = Tween<double>(begin: 1.1, end: 0.9).animate(animationController);
    animationController.repeat(reverse: true);
    widget.otpInterface.initializeOtp(widget.mobileNumber).then((v) {
      setState(() {
        isSendingOtp = false;
      });
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: commonBackgroundDecoration,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              top: 15,
              left: -60,
              child: ScaleTransition(
                scale: _animationValue,
                child: Container(
                  width: 162,
                  height: 162,
                  decoration: commonContainerDecoration,
                ),
              ),
            ),
            Positioned(
              top: 150,
              left: 160,
              child: ScaleTransition(
                scale: _animationValue,
                child: Container(
                  width: 105,
                  height: 105,
                  decoration: commonContainerDecoration,
                ),
              ),
            ),
            Positioned(
              right: -50,
              top: -50,
              child: ScaleTransition(
                scale: _animationValue,
                child: Container(
                  height: 199,
                  width: 199,
                  decoration: commonContainerDecoration,
                ),
              ),
            ),
            Positioned(
              bottom: 170,
              left: 45,
              child: ScaleTransition(
                scale: _animationValue,
                child: Container(
                  width: 105,
                  height: 105,
                  decoration: commonContainerDecoration,
                ),
              ),
            ),
            Container(
              height: size.height,
              width: size.width,
              color: Colors.transparent,
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 0, top: 40, right: 0, bottom: 0),
                      child: Container(
                        width: 40,
                        height: 40,
                        decoration: commonContainerDecoration,
                        child: Icon(
                          Icons.cancel_outlined,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 110,
                  ),
                  Text(
                    "Verification",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 40, right: 40, bottom: 35),
                    child: Text(
                      "Enter the 6 digit OTP sent to your mobile number",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 30, top: 30, right: 20, bottom: 40),
                      child: Container(
                        decoration: commonTextFieldDecoration,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            controller: _otpController,
                            validator: (value) {
                              if (value.isEmpty) {
                                return '*Required';
                              }
                              if (value.trim().length < 6) {
                                return '*Invalid OTP';
                              }
                              return null;
                            },
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            maxLength: 6,
                            decoration: InputDecoration(
                              counterText: "",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(0), borderSide: BorderSide.none),
                              hintText: "6-digit OTP",
                              hintStyle: TextStyle(
                                color: Colors.black,
                              ),
                              contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                              isDense: true,
                            ),
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 40,
                    width: size.width,
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 20,
                    ),
                    child: RaisedButton(
                      onPressed: isSendingOtp
                          ? () {}
                          : () {
                              if (_formKey.currentState.validate()) {
                                widget.otpInterface.loginWithOTP(_otpController.text);
                                //Navigator.pushReplacementNamed(context, registerScreen);
                              }
                            },
                      color: Colors.blueAccent,
                      splashColor: Colors.grey,
                      child: isSendingOtp
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Text(
                                "Verify",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   left: 30,
            //   bottom: 30,
            //   right: 20,
            //   child: Padding(
            //     padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            //     child: Center(
            //       child: Text(
            //         "Resend OTP?",
            //         style: TextStyle(
            //           fontSize: 14,
            //           color: Colors.red,
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
