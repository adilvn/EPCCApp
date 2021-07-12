import 'package:get/get.dart';

class BackProcessController extends GetxController {
  var _bpdropdown1 = "3".obs;

  var _bpdropdown2 = "3".obs;
  var _bpdropdown3 = "3".obs;

  RxString get BPDropValue1 => _bpdropdown1;
  RxString get BPDropValue2 => _bpdropdown2;
  RxString get BPDropValue3 => _bpdropdown3;
  setBPDropValue1(String? val) {
    _bpdropdown1.value = val!;
  }

  setBPDropValue2(String? val) {
    _bpdropdown2.value = val!;
  }

  setBPDropValue3(String? val) {
    _bpdropdown3.value = val!;
  }

  List<String> _bpDropList1 = ["1", "3", "33", "32"].obs;

  List<String> _bpDropList2 = ["1", "3", "33", "32"].obs;

  List<String> _bpDropList3 = ["1", "3", "33", "31"].obs;

  List<String> get BPDrop1 => _bpDropList1;

  List<String> get BPDrop2 => _bpDropList2;

  List<String> get BPDrop3 => _bpDropList3;
}
