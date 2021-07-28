import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  var _firstLogin = true.obs;
  bool get firstLogin => _firstLogin.value;
  setFirst(bool val) {
    _firstLogin.value = val;
  }

  setLogin(bool val) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("login", val);
  }
}
