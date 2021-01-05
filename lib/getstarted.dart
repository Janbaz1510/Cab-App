import 'package:flutter/material.dart';
import 'package:testapp/loginscreen.dart';

class GetStarted extends StatefulWidget {
  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> with SingleTickerProviderStateMixin {
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
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
              left: 25,
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
            Container(
              height: size.height,
              width: size.width,
              color: Colors.transparent,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Image.asset('assets/images/ss.png', height: 100, width: 100),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 150, right: 0, bottom: 30),
                    child: Text(
                      "Cab App",
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 35),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 0, right: 0, bottom: 0),
                    child: Text(
                      "Cab calling application",
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 30,
              bottom: 20,
              right: 20,
              child: RaisedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                color: Colors.white,
                splashColor: Colors.grey,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Login/Signup",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      Icon(Icons.arrow_right, color: Colors.black),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
