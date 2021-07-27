import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epcc/controllers/loginController.dart';
import 'package:epcc/controllers/profileController.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class DBService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  Future<void> addUser(String email, String imageUrl, String uid) {
    // Call the user's CollectionReference to add a new user
    return users
        .doc(uid)
        .set({
          "uid": uid,
          'full_name': email, // John Doe
          'image': imageUrl,
        })
        .then((value) => setADDUSER(false))
        .catchError((error) => print("Failed to add user: $error"));
  }

  uploadImage(File image, String uid) async {
    if (image != null) {
      Reference storageReference = FirebaseStorage.instance.ref().child("$uid");
      final UploadTask uploadTask = storageReference.putFile(image);
      final TaskSnapshot downloadUrl = (await uploadTask);
      final String url = await downloadUrl.ref.getDownloadURL();
      await DBService().updateUser(uid, url);
    }
  }

  Future<void> updateUser(String uid, String url) {
    return users
        .doc(uid)
        .update({'image': url})
        .then((value) => print("User Updated"))
        .catchError((error) => print("Failed to update user: $error"));
  }

  void setADDUSER(bool val) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("userAdd", val);
  }

  getADDUSER() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    bool? val = _pref.getBool("userAdd");
    Get.find<LoginController>().setFirst(val!);
    return val;
  }

  void setUid(String uid) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("uid", uid);
  }

  void removeUid() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('uid');
  }

  getUid() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = pref.getString("uid");
    val != null ? Get.find<ProfileController>().setUid(val) : null;
    return val;
  }
}
