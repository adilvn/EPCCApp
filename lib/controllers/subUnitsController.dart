import 'package:get/get.dart';

class SubUnitsController extends GetxController {
  var _subdropdown1 = "2021".obs;

  var _subdropdown2 = "Jan".obs;
  var _subdropdown3 = "1".obs;
  final List<ChartDataSub> chartData = [
    ChartDataSub('Jan-1', 30434),
    ChartDataSub('Jan-3', 78344),
    ChartDataSub('Jan-5', 50233),
    ChartDataSub('Jan-6', 52340),
    ChartDataSub('Jan-8', 13000),
    ChartDataSub('Jan-23', 34332),
  ];

  final List<ChartDataSub> chartData2 = [
    ChartDataSub('Jan-1', 35324),
    ChartDataSub('Jan-3', 72243),
    ChartDataSub('Jan-5', 6233),
    ChartDataSub('Jan-6', 50423),
    ChartDataSub('Jan-8', 3402),
    ChartDataSub('Jan-23', 34032),
  ];
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
  ChartDataSub(this.x, this.y);
  final String? x;
  final double? y;
}
