import 'package:epcc/Models/constants.dart';
import 'package:epcc/controllers/subUnitsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackProcessController extends GetxController {
  var _bpdropdown1 = "Year".obs;

  var _bpdropdown2 = "Month".obs;
  var _bpdropdown3 = "Day".obs;

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
  List<ConsumptionValue>? get ListData => _listData;
  setListData(ConsumptionValue item) {
    _listData.add(item);
  }

  var _title = "".obs;
  var _locationName = "".obs;
  String get locationName => _locationName.value;
  String get title => _title.value;

  SetLocationName(String val) {
    _locationName.value = val;
  }

  SetTitle(String val) {
    _title.value = val;
  }

  addDetails(List<ConsumptionValue> val) {
    if (BPDropValue1.value == "Year" &&
        BPDropValue2.value == "Month" &&
        BPDropValue3.value == "Day") {
      chartOne.clear();
      _listData.clear();
      for (var i = 0; i < val.length; i++) {
        setChartOne(ChartData(val[i].Date.toString(), val[i].Consumption));
        setListData(ConsumptionValue(
            Date: val[i].Date, Consumption: val[i].Consumption));
      }
    } else if (BPDropValue1.value == "Year" &&
        BPDropValue2.value != "Month" &&
        BPDropValue3.value != "Day") {
      chartOne.clear();
      _listData.clear();
      Get.rawSnackbar(
          backgroundColor: epccBlue500,
          icon: Icon(
            Icons.error,
            size: 22,
            color: Colors.white,
          ),
          message: "Data Not Found",
          duration: Duration(seconds: 2));
    } else if (BPDropValue1.value == "Year" &&
        BPDropValue2.value == "Month" &&
        BPDropValue3.value != "Day") {
      chartOne.clear();
      _listData.clear();
      Get.rawSnackbar(
          backgroundColor: epccBlue500,
          icon: Icon(
            Icons.error,
            size: 22,
            color: Colors.white,
          ),
          message: "Data Not Found",
          duration: Duration(seconds: 2));
    } else if (BPDropValue1.value != "Year" &&
        BPDropValue2.value != "Month" &&
        BPDropValue3.value != "Day") {
      var _month = _bpdropdown2.toUpperCase();
      var _day = _bpdropdown3.toUpperCase();
      var _year = _bpdropdown1.substring(2, 4).toUpperCase();
      var date = "$_day-$_month-$_year";
      chartOne.clear();
      _listData.clear();
      for (var i = 0; i < val.length; i++) {
        if (date == val[i].Date) {
          setChartOne(ChartData(val[i].Date.toString(), val[i].Consumption));
          setListData(ConsumptionValue(
              Date: val[i].Date, Consumption: val[i].Consumption));
          continue;
        }
      }
      if (chartOne.isEmpty && ListData!.isEmpty) {
        Get.rawSnackbar(
            backgroundColor: epccBlue500,
            icon: Icon(
              Icons.error,
              size: 22,
              color: Colors.white,
            ),
            message: "Select Correct Date",
            duration: Duration(seconds: 2));
      }
    } else if (BPDropValue1.value != "Year" &&
        BPDropValue2.value == "Month" &&
        BPDropValue3.value == "Day") {
      chartOne.clear();
      _listData.clear();
      var _year = _bpdropdown1.substring(2, 4).toUpperCase();

      for (var i = 0; i < val.length; i++) {
        var _yearValue = val[i].Date!.substring(7, 9).toString();
        if (_yearValue == _year) {
          setChartOne(ChartData(val[i].Date.toString(), val[i].Consumption));
          setListData(ConsumptionValue(
              Date: val[i].Date, Consumption: val[i].Consumption));
        }
      }
      if (chartOne.isEmpty && ListData!.isEmpty) {
        chartOne.clear();
        _listData.clear();

        Get.rawSnackbar(
            backgroundColor: epccBlue500,
            icon: Icon(
              Icons.error,
              size: 22,
              color: Colors.white,
            ),
            message: "Data Not Found",
            duration: Duration(seconds: 2));
      }
    } else if (BPDropValue1.value != "Year" &&
        BPDropValue2.value != "Month" &&
        BPDropValue3.value == "Day") {
      chartOne.clear();
      _listData.clear();
      var _month = _bpdropdown2.toUpperCase();
      var _year = _bpdropdown1.substring(2, 4).toUpperCase();
      var date = "$_month-$_year";

      for (var i = 0; i < val.length; i++) {
        var _yearValue = val[i].Date!.substring(7, 9).toString();
        var _monthValue = val[i].Date!.substring(3, 6);
        var newValue = "$_monthValue-$_yearValue";
        if (newValue == date) {
          setChartOne(ChartData(val[i].Date.toString(), val[i].Consumption));
          setListData(ConsumptionValue(
              Date: val[i].Date, Consumption: val[i].Consumption));
        }
      }
      if (chartOne.isEmpty && ListData!.isEmpty) {
        chartOne.clear();
        _listData.clear();

        Get.rawSnackbar(
            backgroundColor: epccBlue500,
            icon: Icon(
              Icons.error,
              size: 22,
              color: Colors.white,
            ),
            message: "Data Not Found",
            duration: Duration(seconds: 2));
      }
    } else if (BPDropValue1.value == "Year" &&
        BPDropValue2.value == "Month" &&
        BPDropValue3.value == "Day") {
      Get.rawSnackbar(
          backgroundColor: epccBlue500,
          icon: Icon(
            Icons.error,
            size: 22,
            color: Colors.white,
          ),
          message: "Select Correct Date",
          duration: Duration(seconds: 2));
      chartOne.clear();
      _listData.clear();
    }
  }

  List<String> _bpDropList1 = [
    "Year",
    "2025",
    "2024",
    "2023",
    "2022",
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
    "Month",
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ].obs;

  List<String> _bpDropList3 = [
    "Day",
    "01",
    "02",
    "03",
    "04",
    "05",
    "06",
    "07",
    "08",
    "09",
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
