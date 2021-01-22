import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testapp/models/user_model.dart';

class FirebaseHelper {
  static CollectionReference userCollection = FirebaseFirestore.instance.collection("Users");
  Future<UserModel> getCurrentUser(String uid) async {
    final snap = await userCollection.doc(uid).get();
  }
}
