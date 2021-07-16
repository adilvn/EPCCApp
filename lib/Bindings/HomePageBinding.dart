import 'package:epcc/controllers/HomeController.dart';
import 'package:epcc/controllers/reportController.dart';
import 'package:epcc/controllers/unitsController.dart';
import 'package:get/get.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => ReportController());
    Get.lazyPut(() => UnitsController());
  }
}
