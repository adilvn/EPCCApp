import 'package:get/get.dart';

class LoginController extends GetxController {
  var _firstLogin = true.obs;
  bool get firstLogin => _firstLogin.value;
  setFirst(bool val) {
    _firstLogin.value = val;
  }
}
