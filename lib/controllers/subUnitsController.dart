import 'package:get/get.dart';

class SubUnitsController extends GetxController {
  var _subdropdown1 = "3".obs;

  var _subdropdown2 = "3".obs;
  var _subdropdown3 = "3".obs;

  RxString get SubDropValue1 => _subdropdown1;
  RxString get SubDropValue2 => _subdropdown2;
  RxString get SubDropValue3 => _subdropdown3;
  setSubDropValue1(String? val) {
    _subdropdown1.value = val!;
  }

  setSubDropValue2(String? val) {
    _subdropdown2.value = val!;
  }

  setSubDropValue3(String? val) {
    _subdropdown3.value = val!;
  }

  List<String> _subDropList1 = ["1", "3", "33", "32"].obs;

  List<String> _subDropList2 = ["1", "3", "33", "32"].obs;

  List<String> _subDropList3 = ["1", "3", "33", "31"].obs;

  List<String> get SubDrop1 => _subDropList1;

  List<String> get SubDrop2 => _subDropList2;

  List<String> get SubDrop3 => _subDropList3;
}
