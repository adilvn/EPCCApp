import 'package:epcc/admin/controllers/loginController.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => loginController());
  }
}
