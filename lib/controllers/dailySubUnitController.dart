import 'package:epcc/Models/constants.dart';
import 'package:epcc/Models/consumptionModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DailySubUnitsController extends GetxController {
  var _subdropdown1 = "Year".obs;
  var _subdropdown2 = "Month".obs;
  var _subdropdown3 = "Day".obs;

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

  var _u1List = <double>[].obs;
  var _u2List = <double>[].obs;
  List<double> get u1 => _u1List;

  List<double> get u2 => _u2List;
  setU1(double value) {
    u1.add(value);
  }

  setU2(double value) {
    u2.add(value);
  }
//////

  addChartDetails(
      List<ConsumptionModel> unitDetails, int index, List<String> list) {
    _unitOnevalue.clear();
    _unitTwovalue.clear();
    u1.clear();
    u2.clear();
    // print("this is the ${unitDetails[171].consumptionDate}");
    for (var i = 0; i < unitDetails.length; i++) {
      if (unitDetails[i].centerName == list[0]) {
        if (unitDetails[i].consumptionValue == 0) {}
        setU1(unitDetails[i].consumptionValue);
        setUnitOneValue(ConsumptionValue(
            Date: unitDetails[i].consumptionDate,
            Consumption: unitDetails[i].consumptionValue));
      }
      if (index == 2) {
        if (unitDetails[i].centerName == list[1]) {
          if (unitDetails[i].consumptionValue == 0) {}
          setU2(unitDetails[i].consumptionValue);
          setUnitTwoValue(ConsumptionValue(
              Date: unitDetails[i].consumptionDate,
              Consumption: unitDetails[i].consumptionValue));
        }
      }
    }

    if (_subdropdown1.value == "Year" &&
        _subdropdown2.value == "Month" &&
        _subdropdown3.value == "Day") {
      for (var i = 0; i < 8; i++) {
        if (unitDetails[i].centerName == list[0]) {
          setChartOne(ChartDataSub(
              x: unitDetails[i].consumptionDate,
              y: unitDetails[i].consumptionValue));
        }
        if (index == 2) {
          if (unitDetails[i].centerName == list[1]) {
            setChartTwo(ChartDataSub(
                x: unitDetails[i].consumptionDate,
                y: unitDetails[i].consumptionValue));
          }
        }
      }
    } else if (_subdropdown1.value != "Year" &&
        _subdropdown2.value != "Month" &&
        _subdropdown3.value != "Day") {
      var _month = _subdropdown2.toUpperCase();
      var _day = _subdropdown3.toUpperCase();
      var _year = _subdropdown1.substring(2, 4).toUpperCase();
      var date = "$_day-$_month-$_year";
      chartOne.clear();
      chartTwo.clear();
      for (var i = 0; i < unitDetails.length; i++) {
        if (unitDetails[i].centerName == list[0]) {
          if (unitDetails[i].consumptionDate == date) {
            setChartOne(ChartDataSub(
                x: unitDetails[i].consumptionDate,
                y: unitDetails[i].consumptionValue));
          }
        }
        if (index == 2) {
          if (unitDetails[i].centerName == list[1]) {
            if (unitDetails[i].consumptionDate == date) {
              setChartTwo(ChartDataSub(
                  x: unitDetails[i].consumptionDate,
                  y: unitDetails[i].consumptionValue));
            }
          }
        }
      }
      if (chartOne.isEmpty && chartTwo.isEmpty) {
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
    } else if (_subdropdown1.value == "Year" ||
        _subdropdown2.value == "Month" ||
        _subdropdown3.value == "Day") {
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
      chartTwo.clear();
    }
  }

  var _unitDetails = <ConsumptionModel>[].obs;
  var _colors = <Color>[].obs;
  var _centerName = <String>[].obs;
  var _buttonText = <String>[].obs;
  var _title = "".obs;
  var _locationName = "".obs;
  var _button = 0.obs;

  List<ConsumptionModel> get unitDetails => _unitDetails;
  List<Color> get colors => _colors;
  List<String> get centerName => _centerName;
  List<String> get buttonText => _buttonText;
  String get title => _title.value;
  String get locationName => _locationName.value;
  int get button => _button.value;

  setButtonIndex(int val) {
    _button.value = val;
  }

  setUnitDetials(List<ConsumptionModel> val) {
    _unitDetails.assignAll(val);
  }

  SetTitle(String val) {
    _title.value = val;
  }

  SetLocationName(String val) {
    _locationName.value = val;
  }

  SetCenterName(List<String> val) {
    _centerName.assignAll(val);
  }

  SetButtonText(List<String> val) {
    _buttonText.assignAll(val);
  }

  setUnitButtonColor(List<Color> val) {
    _colors.assignAll(val);
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
    "Year",
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

  List<String> _subDropList3 = [
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
