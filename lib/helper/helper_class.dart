import 'package:google_maps_flutter/google_maps_flutter.dart';

class HelperClass {
  static LatLng getLatLngFromString(String location) {
    final locationArray = location.split(",");
    return LatLng(double.parse(locationArray[0]), double.parse(locationArray[1]));
  }
}
