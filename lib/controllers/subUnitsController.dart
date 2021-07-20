import 'package:epcc/Models/consumptionModel.dart';
import 'package:epcc/Models/unitdatamodel.dart';
import 'package:get/get.dart';

class SubUnitsController extends GetxController {
  var _subdropdown1 = "-".obs;

  var _subdropdown2 = "-".obs;
  var _subdropdown3 = "-".obs;

  var _chartOne = <ChartDataSub>[].obs;
  List<ChartDataSub> get chartOne => _chartOne;
  setChartOne(ChartDataSub value) {
    _chartOne.add(value);
    _chartOne.refresh();
  }

  var _chartTwo = <ChartDataSub>[].obs;
  List<ChartDataSub> get chartTwo => _chartTwo;
  setChartTwo(ChartDataSub value) {
    _chartTwo.add(value);
    _chartTwo.refresh();
  }

  var _chartThree = <ChartDataSub>[].obs;
  List<ChartDataSub> get chartThree => _chartThree;
  setChartThree(ChartDataSub value) {
    _chartThree.add(value);
    _chartThree.refresh();
  }

  var _chartFour = <ChartDataSub>[].obs;
  List<ChartDataSub> get chartFour => _chartFour;
  setChartFour(ChartDataSub value) {
    _chartFour.add(value);
    _chartFour.refresh();
  }

  var _unitOnevalue = <ConsumptionValue>[].obs;
  List<ConsumptionValue> get unitOneValue => _unitOnevalue;
  setUnitOneValue(ConsumptionValue val) {
    _unitOnevalue.add(val);
  }

  var _unitTwovalue = <ConsumptionValue>[].obs;
  List<ConsumptionValue> get unitTwoValue => _unitTwovalue;
  setUnitTwoValue(ConsumptionValue val) {
    _unitTwovalue.add(val);
  }

//////

  addChartDetails(
      List<ConsumptionModel> unitDetails, int index, List<String> list) {
    if (_subdropdown1.value == "-" &&
        _subdropdown2.value == "-" &&
        _subdropdown3.value == "-") {
      print("helo");
      for (var i = 0; i < 8; i++) {
        if (unitDetails[i].centerName == list[0]) {
          setChartOne(ChartDataSub(
              x: unitDetails[i].consumptionDate,
              y: unitDetails[i].consumptionValue));
          setUnitOneValue(ConsumptionValue(
              Date: unitDetails[i].consumptionDate,
              Consumption: unitDetails[i].consumptionValue));
        } else if (index > 1) {
          if (unitDetails[i].centerName == list[1]) {
            setChartTwo(ChartDataSub(
                x: unitDetails[i].consumptionDate,
                y: unitDetails[i].consumptionValue));
            setUnitTwoValue(ConsumptionValue(
                Date: unitDetails[i].consumptionDate,
                Consumption: unitDetails[i].consumptionValue));
          }
        }
      }
    }
  }

/////
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

  List<String> _subDropList1 = [
    "-",
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

  List<String> _subDropList2 = [
    "-",
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

  List<String> _subDropList3 = [
    "-",
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

  List<String> get SubDrop1 => _subDropList1;

  List<String> get SubDrop2 => _subDropList2;

  List<String> get SubDrop3 => _subDropList3;
}

class ChartDataSub {
  ChartDataSub({this.x, this.y});
  final String? x;
  final double? y;
}

class ConsumptionValue {
  String? Date;
  double? Consumption;
  ConsumptionValue({this.Date, this.Consumption});
}
