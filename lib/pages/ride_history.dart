//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:testapp/pages/notification_page.dart';
import 'package:testapp/utils/constants.dart';
//import 'package:testapp/utils/notification_page.dart';

class RideHistory extends StatefulWidget {
  @override
  _RideHistoryState createState() => _RideHistoryState();
}

class _RideHistoryState extends State<RideHistory> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Ride History",   style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),),
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
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: ListView(
            children: <Widget>[
              addressHistory(
                  source: 'Buxipur, Gorakhpur', destination: "Rustampur, Gorakhpur", timeStamp: "12/01/2021"),
              addressHistory(
                  source: 'Buxipur, Gorakhpur', destination: "Rustampur, Gorakhpur", timeStamp: "12/01/2021"),
              addressHistory(
                  source: 'Buxipur, Gorakhpur', destination: "Rustampur, Gorakhpur", timeStamp: "12/01/2021"),
              addressHistory(
                  source: 'Buxipur, Gorakhpur', destination: "Rustampur, Gorakhpur", timeStamp: "12/01/2021"),
            ],
          ),
        ),
      ),
    );
  }
}
