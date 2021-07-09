import 'package:epcc/controllers/HomeController.dart';
import 'package:get/get.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
