import 'package:epcc/controllers/subUnitsController.dart';
import 'package:get/get.dart';

import 'HomeController.dart';

class BackProcessController extends GetxController {
  var _bpdropdown1 = "-".obs;

  var _bpdropdown2 = "-".obs;
  var _bpdropdown3 = "-".obs;

  var _chartOne = <ChartData>[].obs;
  List<ChartData> get chartOne => _chartOne;
  setChartOne(ChartData value) {
    _chartOne.add(value);
    _chartOne.refresh();
  }

  var _chartTwo = <ChartData>[].obs;
  List<ChartData> get chartTwo => _chartTwo;
  setChartTwo(ChartData value) {
    _chartTwo.add(value);
    _chartTwo.refresh();
  }

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

  var _listData = <ConsumptionValue>[].obs;
  List<ConsumptionValue> get ListData => _listData;
  setListData(ConsumptionValue item) {
    _listData.add(item);
  }

  addDetails(List<ConsumptionValue> val) {
    if (BPDropValue1.value == "-" &&
        BPDropValue2.value == "-" &&
        BPDropValue3.value == "-") {
      print(val);
      for (var i = 0; i < 4; i++) {
        setChartOne(ChartData(val[i].Date.toString(), val[i].Consumption));
        setListData(ConsumptionValue(
            Date: val[i].Date, Consumption: val[i].Consumption));
      }
    }
  }

  List<String> _bpDropList1 = [
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

  List<String> _bpDropList2 = [
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

  List<String> _bpDropList3 = [
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

  List<String> get BPDrop1 => _bpDropList1;

  List<String> get BPDrop2 => _bpDropList2;

  List<String> get BPDrop3 => _bpDropList3;
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
