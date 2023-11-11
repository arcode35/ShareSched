import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/models/user.dart';
import 'package:myapp/models/user_model.dart';

String userDocID = "";
class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final newDocRef = DocumentReference;

  createUser(UserModel user) async {
    DocumentReference newDocRef = await _db.collection("Users").add(user.toJson());
    userDocID = newDocRef.id;
    print(newDocRef.id);
    //FirebaseFirestore.instance.collection('Users').add(user.toJson());
    //await _db.collection("Users").add(user.toJson());
    // .whenComplete(
    //   () => Get.snackbar("Success", "Your account has been created.",
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.green.withOpacity(0.1),
    //       colorText: Colors.green),
    //   )

    // .catchError((error, stackTrace) {
    //   Get.snackbar("Error", "Something went wrong. Try Again",
    //     snackPosition: SnackPosition.BOTTOM,
    //     backgroundColor: Colors.redAccent.withOpacity(0.1),
    //     colorText: Colors.red);

    //   print(error.toString());
    // });
  
  }

  // Future<UserModel> getUser(String uid) async {
  //   var doc = await _db.collection("Users").doc(uid).get();;
  // }

  Future<String> getUserDocId() async{
    return userDocID;
  }
}