import 'package:epcc/controllers/BackProcess.dart';
import 'package:epcc/controllers/HomeController.dart';

import 'package:epcc/controllers/loginController.dart';
import 'package:epcc/controllers/profileController.dart';
import 'package:epcc/controllers/reportController.dart';
import 'package:epcc/controllers/subUnitsController.dart';
import 'package:epcc/controllers/unitsController.dart';
import 'package:get/get.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => ReportController());
    Get.lazyPut(() => UnitsController());
    Get.lazyPut(() => SubUnitsController());
    Get.lazyPut(() => BackProcessController());
  }
}
