import 'package:flutter/material.dart';
import 'package:testapp/pages/homepage.dart';
import 'package:testapp/utils/constants.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Animation<double> _animationValue;
  String genderValue;

  @override
  void initState() {
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
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: commonBackgroundDecoration,
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          overflow: Overflow.visible,
          children: <Widget>[
            Positioned(
              bottom: 100,
              left: -70,
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
              bottom: 200,
              right: 30,
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
              top: 250,
              left: 20,
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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    height: 60,
                  ),
                  Center(
                    child: Image.asset('assets/images/ss.png', height: 90, width: 90),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: Text(
                      "Registration",
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 40, right: 20, bottom: 0),
                    child: Container(
                      decoration: commonTextFieldDecoration,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                          border:
                              OutlineInputBorder(borderRadius: BorderRadius.circular(0), borderSide: BorderSide.none),
                          hintText: "Name ",
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
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10, right: 20, bottom: 0),
                    child: Container(
                      decoration: commonTextFieldDecoration,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.black,
                          ),
                          border:
                              OutlineInputBorder(borderRadius: BorderRadius.circular(0), borderSide: BorderSide.none),
                          hintText: "Email ",
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
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10, right: 20, bottom: 50),
                    child: Container(
                      height: 40,
                      width: size.width,
                      decoration: commonTextFieldDecoration,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: DropdownButton(
                          value: genderValue,
                          isExpanded: true,
                          icon: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black,
                          ),
                          hint: Text(
                            'Select Gender',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          items: <String>['Male', 'Female'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (_) {
                            setState(() {
                              genderValue = _;
                            });
                          },
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
                          MaterialPageRoute(builder: (context) => HomePage()),
                        );
                      },
                      color: Colors.blueAccent,
                      splashColor: Colors.grey,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Text(
                          "Continue",
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
          ],
        ),
      ),
    );
  }
}