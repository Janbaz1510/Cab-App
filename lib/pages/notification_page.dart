import 'package:flutter/material.dart';
import 'package:testapp/utils/constants.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications",   style: TextStyle(
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
      ),
      body: Container(
        child: Align(
          alignment: Alignment.topRight,
          child: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                width: size.width,
                child: ListView(
                  physics: BouncingScrollPhysics(),
                  children: <Widget>[
                    notificationHistoryExample(
                        imageAssert: 'assets/images/ss.png',
                        name: "Offers for rides",
                        subname: "This is notification sub title example"),
                    notificationHistoryExample(
                        imageAssert: 'assets/images/ss.png',
                        name: "Offers for rides",
                        subname: "This is notification sub title example"),
                    notificationHistoryExample(
                        imageAssert: 'assets/images/ss.png',
                        name: "Offers for rides",
                        subname: "This is notification sub title example"),
                    notificationHistoryExample(
                        imageAssert: 'assets/images/ss.png',
                        name: "Offers for rides",
                        subname: "This is notification sub title example"),
                    notificationHistoryExample(
                        imageAssert: 'assets/images/ss.png',
                        name: "Offers for rides",
                        subname: "This is notification sub title example"),
                    notificationHistoryExample(
                        imageAssert: 'assets/images/ss.png',
                        name: "Offers for rides",
                        subname: "This is notification sub title example"),
                    notificationHistoryExample(
                        imageAssert: 'assets/images/ss.png',
                        name: "Offers for rides",
                        subname: "This is notification sub title example"),
                    notificationHistoryExample(
                        imageAssert: 'assets/images/ss.png',
                        name: "Offers for rides",
                        subname: "This is notification sub title example"),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//  Widget      showGeneralDialog(
//                   barrierLabel: "Label",
//                   barrierDismissible: true,
//                   barrierColor: Colors.black.withOpacity(0.5),
//                   transitionDuration: Duration(milliseconds: 700),
//                   context: context,
//                   pageBuilder: (context, anim1, anim2) {
//                     return
//                   },
//                   transitionBuilder: (context, anim1, anim2, child) {
//                     return SlideTransition(
//                       position: Tween(begin: Offset(0, 1), end: Offset(0, 0)).animate(anim1),
//                       child: child,
//                     );
//                   },
//                 );
