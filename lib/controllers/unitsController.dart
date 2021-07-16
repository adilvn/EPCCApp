import 'package:epcc/Models/unitdatamodel.dart';
import 'package:get/get.dart';

class UnitsController extends GetxController {
  var _unitOneDetails = <UNITDATAMODEL>[].obs;
  var _unitTwoDetails = <UNITDATAMODEL>[].obs;

  var _chartOne = <ChartData1>[].obs;
  List<ChartData1> get chartOne => _chartOne;
  setChartOne(ChartData1 value) {
    _chartOne.add(value);
  }

  var _chartTwo = <ChartData1>[].obs;
  List<ChartData1> get chartTwo => _chartTwo;
  setChartTwo(ChartData1 value) {
    _chartTwo.add(value);
  }

  @override
  void onInit() {
    super.onInit();
    print("Called");
  }

  addChartsDetails(
      List<UNITDATAMODEL> unitOneDetails, List<UNITDATAMODEL> unitTwoDetails) {
    if (_unitdropdown1.value == "." &&
        _unitdropdown2.value == "." &&
        _unitdropdown3.value == ".") {
      for (var i = 0; i < 10; i++) {
        setChartOne(ChartData1(
            x: unitOneDetails[i].consumptionDate!,
            y: unitOneDetails[i].totalValue!));
        print(unitTwoDetails[i].totalValue);
        setChartTwo(ChartData1(
            x: unitTwoDetails[i].consumptionDate!,
            y: unitTwoDetails[i].totalValue!));
      }
    } else {
      print("not called");
    }
  }

  var _unitdropdown1 = ".".obs;

  var _unitdropdown2 = ".".obs;
  var _unitdropdown3 = ".".obs;
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
    ".",
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
    ".",
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
    ".",
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

class ChartData1 {
  ChartData1({required this.x, required this.y});
  final String? x;
  final double? y;
}
