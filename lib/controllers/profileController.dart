import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var _gmail = "".obs;
  String get gmail => _gmail.value;
  setGamil(String val) {
    _gmail.value = val;
  }

  setGamilValue(String? val) async {
    print(val);
    SharedPreferences _pref = await SharedPreferences.getInstance();

    _pref.setString("Uname", val!);
  }

  getGamilValue() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    String? value = _pref.getString("Uname")!;
    print(value);
    return value;
  }
}
