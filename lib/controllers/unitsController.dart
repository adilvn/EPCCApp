import 'package:get/get.dart';

class UnitsController extends GetxController {
  var _unitdropdown1 = "3".obs;

  var _unitdropdown2 = "3".obs;
  var _unitdropdown3 = "3".obs;

  RxString get UnitDropValue1 => _unitdropdown1;
  RxString get UnitDropValue2 => _unitdropdown2;
  RxString get UnitDropValue3 => _unitdropdown3;
  setUnitDropValue1(String? val) {
    _unitdropdown1.value = val!;
  }

  setUnitDropValue2(String? val) {
    _unitdropdown2.value = val!;
  }

  setUnitDropValue3(String? val) {
    _unitdropdown3.value = val!;
  }

  List<String> _unitDropList1 = ["1", "3", "33", "32"].obs;

  List<String> _unitDropList2 = ["1", "3", "33", "32"].obs;

  List<String> _unitDropList3 = ["1", "3", "33", "31"].obs;

  List<String> get UnitDrop1 => _unitDropList1;

  List<String> get UnitDrop2 => _unitDropList2;

  List<String> get UnitDrop3 => _unitDropList3;
}
