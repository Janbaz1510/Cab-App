import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:testapp/helper/helper_class.dart';

class UserModel {
  String uid;
  String name;
  String mobile;
  String gender;
  String email;
  LatLng location;
  String image;
  UserModel({
    this.uid,
    this.name,
    this.mobile,
    this.gender,
    this.email,
    this.location,
    this.image,
  });

  UserModel copyWith({
    String uid,
    String name,
    String mobile,
    String gender,
    String email,
    LatLng location,
    String image,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      name: name ?? this.name,
      mobile: mobile ?? this.mobile,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      location: location ?? this.location,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'mobile': mobile,
      'gender': gender,
      'email': email,
      'location': "${location.latitude},${location.longitude}" ?? 'NA',
      'image': image ?? 'NA',
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      uid: map['uid'],
      name: map['name'],
      mobile: map['mobile'],
      gender: map['gender'],
      email: map['email'],
      location: HelperClass.getLatLngFromString(map['location']),
      image: map['image'],
    );
  }
  factory UserModel.fromSnap(DocumentSnapshot map) {
    if (map == null) return null;

    return UserModel(
      uid: map.id,
      name: map.get('name'),
      mobile: map.get('mobile'),
      gender: map.get('gender'),
      email: map.get('email'),
      location: HelperClass.getLatLngFromString(map.get('location')),
      image: map.get('image'),
    );
  }
}
