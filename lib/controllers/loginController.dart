import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  // var _firstLogin = true.obs;
  // bool get firstLogin => _firstLogin.value;
  // setFirst(bool val) {
  //   print("called");
  //   _firstLogin.value = val;
  // }

  final FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;
  setLoading(bool value) {
    isLoading = value;
    update();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool cbRemember = false;
  setcbRemember(bool val) {
    cbRemember = val;
    update();
  }

  final formKey = GlobalKey<FormState>();
  setLogin(bool val) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("login", val);
  }

  @override
  void onClose() {
    emailController.dispose();
    passController.dispose();
    super.onClose();
  }
}
