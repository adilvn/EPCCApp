import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epcc/controllers/profileController.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DBService {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;
  Future<void> addUser(String email, String uid) {
    // Call the user's CollectionReference to add a new user

    return users
        .doc(uid)
        .set({
          "uid": uid,
          'full_name': email, // John Doe
        })
        .then((value) => Get.rawSnackbar(message: "User has been added successfully", duration: Duration(seconds: 2)))
        .catchError((error) => Get.rawSnackbar(message: "Failed to add a User", duration: Duration(seconds: 2)));
  }

  uploadImage(File image, String uid) async {
    Reference storageReference = FirebaseStorage.instance.ref().child("$uid");
    final UploadTask uploadTask = storageReference.putFile(image);
    final TaskSnapshot downloadUrl = (await uploadTask);
    final String url = await downloadUrl.ref.getDownloadURL();
    await DBService().updateUser(uid, url);
  }

  Future<void> updateUser(String uid, String url) {
    return users.doc(uid).update({'image': url}).then((value) {
      return Get.rawSnackbar(message: "Image has been added successfully", duration: Duration(seconds: 2));
    }).catchError((error) => Get.rawSnackbar(message: "Image adding failed $error", duration: Duration(seconds: 2)));
  }

  void setpass(String val) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString("userAdd", val);
  }

  getPass() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();

    String? val = _pref.getString("userAdd") ?? "";

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
    String val = pref.getString("uid") ?? "";
    val != "" ? Get.find<ProfileController>().setUid(val) : "";
  }
}
