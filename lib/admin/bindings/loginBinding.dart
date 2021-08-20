import 'package:epcc/admin/controllers/loginController.dart';
import 'package:get/get.dart';

class loginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => loginController());
  }
}
