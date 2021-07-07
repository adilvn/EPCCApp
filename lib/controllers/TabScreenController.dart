import 'package:epcc/Screens/home_screen.dart';
import 'package:epcc/Screens/profile.dart';
import 'package:get/get.dart';

class TabScreenController extends GetxController {
  List _list = [HomeScreen(), HomeScreen(), Profile()];

  List get tabList => _list;
  int _currentIndex = 1;
  int get currentIndex => _currentIndex;
  void setTabIndex(int val) {
    _currentIndex = val;

    update();
  }
}
