import 'dart:async';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:testapp/helper/location_helper.dart';
import 'package:testapp/utils/constants.dart';
import 'package:testapp/utils/my_drawer.dart';
import 'package:testapp/pages/notification_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PermissionStatus permissionStatus = PermissionStatus.undetermined;
  Permission permission = Permission.location;
  LocationHelper locationHelper = LocationHelper();
  bool isLoadingPermission = true;
  bool isGettingLocation = true;
  int currentIndex;

  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 16.151926040649414);

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    locationHelper.getPermissionStatus(permission).then((value) {
      if (value != PermissionStatus.granted) {
        locationHelper.requestPermission(permission).then((val) => setState(() => permissionStatus = val));
      } else {
        setState(() {
          permissionStatus = value;
        });
      }
      setState(() {
        isLoadingPermission = false;
      });
    });
  }

  changePage(int index) {
    setState(() {
      currentIndex = index;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: MyDrawer(),
      ),
      appBar: AppBar(
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
        child: Stack(
          children: [
            isLoadingPermission
                ? Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black,
                    ),
                  )
                : GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _kGooglePlex,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
            Positioned(
              top: 50,
              right: 15,
              left: 30,
              child: Container(
                width: size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      color: Color(0xff64FFFFFF),
                      elevation: 2,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.my_location,
                            color: Colors.black,
                          ),
                          border:
                              OutlineInputBorder(borderRadius: BorderRadius.circular(0), borderSide: BorderSide.none),
                          hintText: "Enter pickup...",
                          hintStyle: TextStyle(color: Colors.black),
                          //contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          isDense: true,
                        ),
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1),
                      ),
                      color: Color(0xff64FFFFFF),
                      elevation: 2,
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.near_me,
                            color: Colors.black,
                          ),
                          border:
                              OutlineInputBorder(borderRadius: BorderRadius.circular(0), borderSide: BorderSide.none),
                          hintText: "Enter destination...",
                          hintStyle: TextStyle(color: Colors.black),
                          //contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          isDense: true,
                        ),
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              right: 30,
              child: Container(
                width: size.width,
                child: BubbleBottomBar(
                  elevation: 8,
                  opacity: 0.2,
                  backgroundColor: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  currentIndex: currentIndex,
                  hasInk: true,
                  inkColor: Colors.black12,
                  hasNotch: false,
                  onTap: changePage,
                  iconSize: 25,
                  items: bottomMenus.map((e) {
                    return BubbleBottomBarItem(
                      backgroundColor: Colors.blue,
                      icon: Icon(e['icon'], color: Colors.black),
                      activeIcon: Icon(e['icon'], color: Colors.blue),
                      title: Text(
                        e['title'],
                        textAlign: TextAlign.left,
                      ),
                      
                    );
                  }).toList(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
