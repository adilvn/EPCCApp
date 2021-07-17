import 'package:epcc/Models/data_modal.dart';
import 'package:epcc/main.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  var allReportsData = <Data>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  var _bpdropdown1 = "2021".obs;

  var _bpdropdown2 = "Jan".obs;
  var _bpdropdown3 = "1".obs;
  var _TPdropdown = "TP1".obs;

  var _unitdropdown = "Unit 1".obs;
  var _bpdropdown = "Back Process".obs;

  RxString get BPDropValue1 => _bpdropdown1;
  RxString get BPDropValue2 => _bpdropdown2;
  RxString get BPDropValue3 => _bpdropdown3;
  RxString get TPDropValue => _TPdropdown;
  RxString get UnitDropValue => _unitdropdown;
  RxString get BPDropValue => _bpdropdown;
  setBPDropValue1(String? val) {
    _bpdropdown1.value = val!;
  }

  setBPDropValue2(String? val) {
    _bpdropdown2.value = val!;
  }

  setBPDropValue3(String? val) {
    _bpdropdown3.value = val!;
  }

  setTPDropValue(String? val) {
    _TPdropdown.value = val!;
  }

  setUnitDropValue(String? val) {
    _unitdropdown.value = val!;
  }

  setBPDropValue(String? val) {
    _bpdropdown.value = val!;
  }

  List<String> _bpDropList1 = [
    "2021",
    "2020",
    "2019",
    "2018",
    "2017",
    "2016",
    "2015",
    "2014",
    "2013",
    "2012",
    "2011",
    "2010"
  ].obs;

  List<String> _bpDropList2 = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "June",
    "July",
    "Aug",
    "Oct",
    "Sep",
    "Nov",
    "Dec"
  ].obs;

  List<String> _bpDropList3 = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31"
  ].obs;
  List<String> _TPDropList = ["TP1", "TP2", "TP3", "TP4", "PP"].obs;

  List<String> _UnitDropList = ["Unit 1", "Unit 2"].obs;

  List<String> _BPDropList = ["Back Process", "Consumption Center"].obs;

  List<String> get BPDrop1 => _bpDropList1;

  List<String> get BPDrop2 => _bpDropList2;

  List<String> get BPDrop3 => _bpDropList3;
  List<String> get TPDrop => _TPDropList;

  List<String> get UnitDrop => _UnitDropList;

  List<String> get BPDrop => _BPDropList;
}
