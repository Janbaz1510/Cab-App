import 'package:flutter/material.dart';
//import 'package:smooth_star_rating/smooth_star_rating.dart';

class RideComplete extends StatefulWidget {
  @override
  _RideCompleteState createState() => _RideCompleteState();
}

class _RideCompleteState extends State<RideComplete> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
       resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Your Bill",
                style: TextStyle(
              fontSize: 14,
              color: Colors.white,
          ),
              ),
            ),
            Spacer(),
            Text(
              "Support?",
             style: TextStyle(
            fontSize: 12,
            color: Colors.white,
          ),
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: <Color>[
                Color(0xff190e45),
                Color(0xff5339a5),
                Color(0xff5e43ae),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/ss.png", height: 60, width: 60),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Ride Complete",
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(0xff190e45),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/rupee.png", height: 30, width: 30),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        "251.00",
                        style: TextStyle(
                          fontSize: 40,
                          // fontWeight: FontWeight.bold,
                          color: Color(0xff190e45),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/car_bb.png", height: 40, width: 40),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "MINI",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff190e45),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/source_color.png", height: 24, width: 24),
                      Spacer(),
                      Image.asset("assets/images/ss.png", height: 40, width: 40),
                      Spacer(),
                      Image.asset("assets/images/destination_color.png", height: 24, width: 24),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Buxipur, Gorakhpur, \n273001",
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff190e45),
                        ),
                      ),
                      Spacer(),
                      Text(
                        "Rustampur, Gorakhpur, \n273001",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xff190e45),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Container(
                      width: size.width,
                      child: Stack(children: [
                        Card(
                          color: Color(0xFFFFFFFF),
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "How was your ride?",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff190e45),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: -30),
                          child: Center(child: Image.asset("assets/images/ss.png", height: 60, width: 60)),
                        ),
                      ]),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 10,
                bottom: 20,
                right: 10,
                child: Container(
                  height: 45,
                  child: RaisedButton(
                    onPressed: () {
                      // Navigator.pushReplacement(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => LoginScreen()),
                      // );
                    },
                    color: Color(0xff172B4D),
                    
                    splashColor: Colors.grey,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Text(
                        "Done",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
