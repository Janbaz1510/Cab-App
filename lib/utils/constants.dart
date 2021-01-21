import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

final List<Map<String, dynamic>> bottomMenus = [
  {'title': 'Home', 'icon': Icons.dashboard},
  {'title': 'Profile', 'icon': Icons.supervised_user_circle},
  {'title': 'Task', 'icon': Icons.movie_filter},
  {'title': 'Car', 'icon': Icons.car_rental},
];

Widget notificationHistoryExample({String imageAssert, String name, String subname}) {
  return Slidable(
    actionPane: SlidableScrollActionPane(),
    secondaryActions: [
      Padding(
        padding: const EdgeInsets.only(top: 15, left:-5, bottom: 4),
        child: IconSlideAction(
          icon: Icons.delete,
          caption: 'Delete',
          color: Colors.red,
          onTap: () => showMessage(),
        ),
      ),
    ],
    actionExtentRatio: 0.25,
    child: Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        color: Color(0xFFFFFFFF),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset(imageAssert, height: 50, width: 50),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        subname,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Widget addressHistory({String source, String destination, String timeStamp}) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
    child: Card(
      color: Color(0xFFFFFFFF),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      source,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Text(
                      timeStamp,
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Icon(Icons.add),
                Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      destination,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 29,
                      width: 73,
                      child: RaisedButton(
                        color: Color(0xff3c2593),
                        child: Text(
                          "View",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}



Widget showMessage({BuildContext context, String title, String message} ) {

}