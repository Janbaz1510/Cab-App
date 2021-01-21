import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:testapp/bookingscreen.dart';
import 'package:testapp/notification_page.dart';
import 'package:testapp/ride_history.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        bottomOpacity: 0,
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
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                icon: Icon(Icons.notifications, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NotificationPage()),
                  );
                }),
          ),
        ],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(children: [
          ClipPath(
            clipper: DiagonalPathClipperTwo(),
            child: Container(
              width: size.width,
              height: size.width / 1.5,
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
          Padding(
            padding: const EdgeInsets.only(top: 100, bottom: 20, left: 20, right: 20),
            child: Card(
              color: Color(0xFFFFFFFF),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 35, left: 10, right: 10, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 29,
                      width: 73,
                      child: RaisedButton(
                        color: Color(0xff3c2593),
                        child: Text(
                          "Edit",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "42",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff190e45),
                              ),
                            ),
                            Text(
                              "Total Rides",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff190e45),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "10",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff190e45),
                              ),
                            ),
                            Text(
                              "Cancelled",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff190e45),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "4.5",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff190e45),
                              ),
                            ),
                            Text(
                              "Rating",
                              style: TextStyle(
                                fontSize: 14,
                                color: Color(0xff190e45),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Robo Janbaz",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color(0xff190e45),
                      ),
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Text(
                      "Gorakhpur, U.P.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff190e45),
                      ),
                    ),
                    SizedBox(
                      height: 7,
                    ),
                    Text(
                      "+91 1234567890",
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff190e45),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookingScreen()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.shop_outlined,
                              size: 16,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Booking',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                   
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookingScreen()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.shop_outlined,
                              size: 16,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Booking',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                   
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookingScreen()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.shop_outlined,
                              size: 16,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Booking',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => BookingScreen()),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.shop_outlined,
                              size: 16,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              'Booking',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                   
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset("assets/images/ss.png", height: 90, width: 90),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
