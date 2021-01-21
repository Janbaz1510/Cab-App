import 'package:flutter/material.dart';
import 'package:testapp/otpscreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> _animationValue;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    _animationValue = Tween<double>(begin: 1.1, end: 0.9).animate(animationController);
    animationController.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0x26FFFFFF),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 230,
              right: 20,
              child: ScaleTransition(
                scale: _animationValue,
                child: Container(
                  width: 105,
                  height: 105,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0x26FFFFFF),
                  ),
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
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0x26FFFFFF),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: 45,
              child: ScaleTransition(
                scale: _animationValue,
                child: Container(
                  width: 105,
                  height: 105,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0x26FFFFFF),
                  ),
                ),
              ),
            ),
            Container(
              height: size.height,
              width: size.width,
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 130),
                      child: Image.asset('assets/images/ss.png', height: 100, width: 100),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 35, top: 30, right: 0, bottom: 30),
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 45),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10, right: 20, bottom: 30),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0x80FFFFFF),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.phone_android,
                            color: Colors.black,
                          ),
                          border:
                              OutlineInputBorder(borderRadius: BorderRadius.circular(0), borderSide: BorderSide.none),
                          hintText: "Mobile Number",
                          hintStyle: TextStyle(color: Colors.black),
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
                  Container(
                      height: 40,
                    width: size.width,
                    padding: const EdgeInsets.only(left: 30, right: 20),
                    child: RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => OTPScreen()),
                        );
                      },
                      color: Colors.blueAccent,
                      splashColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text(
                          "Generate OTP",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "By loggin in you will agree ",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Terms & Conditions",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
