import 'package:epcc/controllers/BackProcess.dart';
import 'package:epcc/controllers/HomeController.dart';
import 'package:epcc/controllers/dailySubUnitController.dart';
import 'package:epcc/controllers/dailyUnitController.dart';
import 'package:epcc/controllers/dailyUsageController.dart';
import 'package:epcc/controllers/loginController.dart';
import 'package:epcc/controllers/profileController.dart';
import 'package:epcc/controllers/reportController.dart';
import 'package:epcc/controllers/subUnitsController.dart';
import 'package:epcc/controllers/unitsController.dart';
import 'package:get/get.dart';

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(DailyController());
    Get.put(DailyUnitsController());
    Get.put(DailySubUnitsController());
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => HomeController());
    // Get.lazyPut(() => DailyController());
    // Get.lazyPut(() => DailyUnitsController());
    // Get.lazyPut(() => DailySubUnitsController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => ReportController());
    Get.lazyPut(() => UnitsController());
    Get.lazyPut(() => SubUnitsController());
    Get.lazyPut(() => BackProcessController());
  }
}
