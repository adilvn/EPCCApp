import 'package:get/get.dart';

class BackProcessController extends GetxController {
  var _bpdropdown1 = "2021".obs;

  var _bpdropdown2 = "Jan".obs;
  var _bpdropdown3 = "1".obs;

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

  List<String> get BPDrop1 => _bpDropList1;

  List<String> get BPDrop2 => _bpDropList2;

  List<String> get BPDrop3 => _bpDropList3;
}
