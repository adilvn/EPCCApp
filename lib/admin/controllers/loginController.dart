import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class loginController extends GetxController {
  var _isloading = false.obs;
  TextEditingController email = TextEditingController();
  final formState = GlobalKey<FormState>();
  TextEditingController pass = TextEditingController();
  TextEditingController conPass = TextEditingController();
  var _showPass = true.obs;
  bool get showPass => _showPass.value;
  void setPassView(bool val) {
    _showPass.value = val;
  }

  bool get isLoading => _isloading.value;

  setLoading(bool val) {
    _isloading.value = val;
  }
}
