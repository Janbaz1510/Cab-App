import 'package:flutter/material.dart';
import 'package:testapp/bookingscreen.dart';
import 'package:testapp/ride_history.dart';
import 'package:testapp/profile_screen.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
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
                Spacer(),
                Icon(Icons.delete_forever_outlined, size: 24,
                color: Colors.white),
              ],
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.shop_outlined, size: 16),
          title: Text('Booking'),
         // selectedTileColor: Colors.blue,
          onTap: () {
         Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookingScreen()),
                  );
          },
        ),
        
        ListTile(
          leading: Icon(Icons.history_rounded, size: 16),
          title: Text('History'),
          onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RideHistory()),
                  );
          },
          //   Navigator.pop(context);
          // },
        ),
         
        ListTile(
          leading: Icon(Icons.person_outline, size: 16),
          title: Text('Profile'),
          onTap: () {
            Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
          },
        ),
       
        ListTile(
          leading: Icon(Icons.my_location, size: 16),
          title: Text('Address'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        
         ListTile(
          leading: Icon(Icons.wallet_travel_outlined, size: 16),
          title: Text('Wallet'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 4,
            color: Colors.grey,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text('DOCUMENTATION'),
        ),
       
        ListTile(
          leading: Icon(Icons.privacy_tip_outlined, size: 16,),
          title: Text('Privacy Policy'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
       
        ListTile(
          leading: Icon(Icons.share_outlined, size: 16,),
          title: Text('Share'),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        
        ListTile(
          leading: Icon(Icons.exit_to_app_outlined, size: 16,
           color: Colors.red),
          title: Text('Logout', style: TextStyle(
            color: Colors.red,
          )),
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
