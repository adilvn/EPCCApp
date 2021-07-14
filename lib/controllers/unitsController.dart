import 'package:get/get.dart';

class UnitsController extends GetxController {
  var _unitdropdown1 = "2021".obs;

  var _unitdropdown2 = "Jan".obs;
  var _unitdropdown3 = "1".obs;

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

  List<String> _unitDropList1 = [
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

  List<String> _unitDropList2 = [
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

  List<String> _unitDropList3 = [
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

  List<String> get UnitDrop1 => _unitDropList1;

  List<String> get UnitDrop2 => _unitDropList2;

  List<String> get UnitDrop3 => _unitDropList3;
}
