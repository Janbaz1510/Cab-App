import 'dart:async';

import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:testapp/helper/location_helper.dart';

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
    if (!isLoadingPermission) {
      print(permissionStatus);
    }
    return Scaffold(
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 20),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/ss.png',
                      height: 64,
                      width: 64,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Cap App",
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 5, left: 20, right: 20),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
                height: 40,
                color: Color(0xff5e72e4),
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Booking",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 5, left: 20, right: 20),
              child: Container(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "History",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 5, left: 20, right: 20),
              child: Container(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Profile",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 5, left: 20, right: 20),
              child: Container(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Address",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 10, left: 20, right: 20),
              child: Container(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Wallet",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
                left: 20,
                right: 20,
              ),
              child: Container(
                color: Colors.grey,
                height: 3,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "DOCUMENTATION",
                style: TextStyle(color: Colors.black, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25, bottom: 5, left: 20, right: 20),
              child: Container(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Pravicy Policy",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 5, left: 20, right: 20),
              child: Container(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Share",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0, bottom: 5, left: 20, right: 20),
              child: Container(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.red,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Logout",
                        style: TextStyle(color: Colors.red, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
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
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      //   backgroundColor: Colors.red,
      // ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          bottom: 15,
          left: 20,
          right: 40,
        ),
        child: BubbleBottomBar(
          elevation: 4,
          opacity: 0.2,
          backgroundColor: Colors.white,
          borderRadius: BorderRadius.circular(16),
          currentIndex: currentIndex,
          hasInk: true,
          inkColor: Colors.black12,
          hasNotch: true,
          //fabLocation: BubbleBottomBarFabLocation.end,
          onTap: changePage,
          iconSize: 10,

          items: <BubbleBottomBarItem>[
            BubbleBottomBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(Icons.dashboard, color: Colors.black),
                activeIcon: Icon(Icons.dashboard, color: Colors.blue),
                title: Text("Home")),
            BubbleBottomBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(Icons.dashboard, color: Colors.black),
                activeIcon: Icon(Icons.dashboard, color: Colors.blue),
                title: Text("Home")),
            BubbleBottomBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(Icons.dashboard, color: Colors.black),
                activeIcon: Icon(Icons.dashboard, color: Colors.blue),
                title: Text("Home")),
            BubbleBottomBarItem(
                backgroundColor: Colors.blue,
                icon: Icon(Icons.dashboard, color: Colors.black),
                activeIcon: Icon(Icons.dashboard, color: Colors.blue),
                title: Text("Home")),
          ],
        ),
      ),
      body: Container(
        child: Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          overflow: Overflow.visible,
          children: <Widget>[
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
            Container(
              height: size.height,
              width: size.width,
              child: Padding(
                padding: const EdgeInsets.only(left: 40, top: 80, right: 20, bottom: 40),
                child: Column(
                  children: [
                    Container(
                    
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0x80FFFFFF),
                        //borderRadius: BorderRadius.circular(16),
                       
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
                          hintText: "Enter pickup...",
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
                    SizedBox(
                      height: 2,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0x80FFFFFF),
                      ),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.location_city,
                            color: Colors.black,
                          ),
                          border:
                              OutlineInputBorder(borderRadius: BorderRadius.circular(0), borderSide: BorderSide.none),
                          hintText: "Enter destination...",
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
