import 'package:epcc/Models/constants.dart';
import 'package:epcc/Models/consumptionModel.dart';
import 'package:epcc/Models/unitdatamodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DailyUnitsController extends GetxController {
  var _chartOne = <ChartData2>[].obs;
  List<ChartData2> get chartOne => _chartOne;
  setChartOne(ChartData2 value) {
    _chartOne.add(value);
    _chartOne.refresh();
  }

  var _chartTwo = <ChartData2>[].obs;
  List<ChartData2> get chartTwo => _chartTwo;
  setChartTwo(ChartData2 value) {
    _chartTwo.add(value);
    _chartTwo.refresh();
  }

  var _chartThree = <ChartData2>[].obs;
  List<ChartData2> get chartThree => _chartThree;
  setChartThree(ChartData2 value) {
    _chartThree.add(value);
    _chartThree.refresh();
  }

  var _chartFour = <ChartData2>[].obs;
  List<ChartData2> get chartFour => _chartFour;
  setChartFour(ChartData2 value) {
    _chartFour.add(value);
    _chartFour.refresh();
  }

  var _u1List = <double>[].obs;
  var _u2List = <double>[].obs;
  var _u3List = <double>[].obs;
  var _u4List = <double>[].obs;
  List<double> get U1 => _u1List;
  List<double> get U2 => _u2List;
  List<double> get U3 => _u3List;
  List<double> get U4 => _u4List;

  setU1(List<double> val) {
    _u1List.assignAll(val);
  }

  setU2(List<double> val) {
    _u2List.assignAll(val);
  }

  setU3(List<double> val) {
    _u3List.assignAll(val);
  }

  setU4(List<double> val) {
    _u4List.assignAll(val);
  }

  @override
  void onInit() {
    super.onInit();
  }

  addChartsDetails(
      List<UNITDATAMODEL> unitOneDetails,
      List<UNITDATAMODEL> unitTwoDetails,
      List<UNITDATAMODEL> unitThreeDetails,
      List<UNITDATAMODEL> unitFourDetails,
      int index) {
    if (_unitdropdown1.value == "Year" &&
        _unitdropdown2.value == "Month" &&
        _unitdropdown3.value == "Day") {
      for (var i = 0; i < 4; i++) {
        setChartOne(ChartData2(
            x: unitOneDetails[i].consumptionDate!,
            y: unitOneDetails[i].totalValue!));

        setChartTwo(ChartData2(
            x: unitTwoDetails[i].consumptionDate!,
            y: unitTwoDetails[i].totalValue!));
        // print(unitTwoDetails[i].consumptionValue!);
        if (index > 2) {
          setChartThree(ChartData2(
              x: unitThreeDetails[i].consumptionDate!,
              y: unitThreeDetails[i].totalValue!));
          setChartFour(ChartData2(
              x: unitFourDetails[i].consumptionDate!,
              y: unitFourDetails[i].totalValue!));
        }
      }
    } else if (_unitdropdown1.value != "Year" &&
        _unitdropdown2.value != "Month" &&
        _unitdropdown3.value != "Day") {
      int c = 0;
      var _month = _unitdropdown3.toUpperCase();
      var _day = _unitdropdown2.toUpperCase();
      var _year = _unitdropdown1.substring(2, 4).toUpperCase();
      var date = "$_day-$_month-$_year";

      for (var i = 0; i < unitOneDetails.length; i++) {
        var month =
            unitOneDetails[i].consumptionDate!.substring(0, 2).toUpperCase();
        var day =
            unitOneDetails[i].consumptionDate!.substring(3, 6).toUpperCase();
        var year =
            unitOneDetails[i].consumptionDate!.substring(7, 9).toUpperCase();
        var _date = "$day-$month-$year";

        if (month == _month && day == _day && year == _year) {
          c++;

          _chartOne.clear();
          setChartOne(ChartData2(
              x: unitOneDetails[i].consumptionDate!,
              y: unitOneDetails[i].totalValue!));
        }
      }
      if (c == 0) {
        _chartOne.clear();
      } else {
        c = 0;
      }
      int a = 0;
      for (var i = 0; i < unitTwoDetails.length; i++) {
        var month =
            unitTwoDetails[i].consumptionDate!.substring(0, 2).toUpperCase();
        var day =
            unitTwoDetails[i].consumptionDate!.substring(3, 6).toUpperCase();
        var year =
            unitTwoDetails[i].consumptionDate!.substring(7, 9).toUpperCase();
        var _date = "$day-$month-$year";

        if (month == _month && day == _day && year == _year) {
          // print("{$date}  $_date");
          a++;
          _chartTwo.clear();
          setChartTwo(ChartData2(
              x: unitTwoDetails[i].consumptionDate!,
              y: unitTwoDetails[i].totalValue!));
        }
      }
      if (a == 0) {
        _chartTwo.clear();
      } else {
        a = 0;
      }

      if (index > 2) {
        int b = 0;
        for (var i = 0; i < unitThreeDetails.length; i++) {
          var month = unitThreeDetails[i]
              .consumptionDate!
              .substring(0, 2)
              .toUpperCase();

          var day = unitThreeDetails[i]
              .consumptionDate!
              .substring(3, 6)
              .toUpperCase();
          var year = unitThreeDetails[i]
              .consumptionDate!
              .substring(7, 9)
              .toUpperCase();
          var _date = "$day-$month-$year";
          if (_date == date) {
            b++;
            print("{$date}  $_date");
            _chartThree.clear();
            setChartThree(ChartData2(
                x: unitThreeDetails[i].consumptionDate!,
                y: unitThreeDetails[i].totalValue!));
          }
        }
        if (b == 0) {
          _chartThree.clear();
        } else {
          b = 0;
        }
        int d = 0;
        for (var i = 0; i < unitFourDetails.length; i++) {
          var month =
              unitFourDetails[i].consumptionDate!.substring(0, 2).toUpperCase();
          var day =
              unitFourDetails[i].consumptionDate!.substring(3, 6).toUpperCase();
          var year =
              unitFourDetails[i].consumptionDate!.substring(7, 9).toUpperCase();
          var _date = "$day-$month-$year";

          if (month == _month && day == _day && year == _year) {
            print("{$date}  $_date");
            d++;
            _chartFour.clear();
            setChartFour(ChartData2(
                x: unitFourDetails[i].consumptionDate!,
                y: unitFourDetails[i].totalValue!));
          }
        }
        if (d == 0) {
          _chartFour.clear();
        } else {
          d = 0;
        }
      }
      if (index > 2) {
        if (_chartOne.isEmpty &&
            _chartTwo.isEmpty &&
            _chartThree.isEmpty &&
            _chartFour.isEmpty) {
          Get.rawSnackbar(
              duration: Duration(seconds: 2), message: "Data Not Found");
        }
      } else {
        if (_chartOne.isEmpty && _chartTwo.isEmpty) {
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
      }
    } else if (_unitdropdown1.value != "Year" ||
        _unitdropdown2.value != "Month" ||
        _unitdropdown3.value != "Day") {
      Get.rawSnackbar(
          backgroundColor: epccBlue500,
          icon: Icon(
            Icons.error,
            size: 22,
            color: Colors.white,
          ),
          message: "Select Correct Date",
          duration: Duration(seconds: 2));
      _chartOne.clear();
      _chartTwo.clear();
      _chartThree.clear();
      _chartFour.clear();
    }
  }

  var _totalunit1 = 0.0.obs;
  var _totalunit2 = 0.0.obs;
  var _totalunit3 = 0.0.obs;
  var _totalunit4 = 0.0.obs;
  double get totalunit1 => _totalunit1.value;
  double get totalunit2 => _totalunit2.value;
  double get totalunit3 => _totalunit3.value;
  double get totalunit4 => _totalunit4.value;
  setTotalUnit1(double val) {
    _totalunit1.value = val;
  }

  setTotalUnit2(double val) {
    _totalunit2.value = val;
  }

  setTotalUnit3(double val) {
    _totalunit3.value = val;
  }

  setTotalUnit4(double val) {
    _totalunit4.value = val;
  }

  var _unitdropdown1 = "Year".obs;

  var _unitdropdown2 = "Month".obs;
  var _unitdropdown3 = "Day".obs;
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

  List<String> _unitDropList2 = [
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

  List<String> _unitDropList3 = [
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

  List<String> get UnitDrop1 => _unitDropList1;

  List<String> get UnitDrop2 => _unitDropList2;

  List<String> get UnitDrop3 => _unitDropList3;

  var _unitOneDetails = <UNITDATAMODEL>[].obs;
  var _unitTwoDetails = <UNITDATAMODEL>[].obs;
  var _unitThreeDetails = <UNITDATAMODEL>[].obs;
  var _unitFourDetails = <UNITDATAMODEL>[].obs;
  var _unitOne = <ConsumptionModel>[].obs;
  var _unitTwo = <ConsumptionModel>[].obs;
  var _unitThree = <ConsumptionModel>[].obs;
  var _unitFour = <ConsumptionModel>[].obs;
  var _colors = <Color>[].obs;
  var _centerName = <String>[].obs;
  var _buttonText = <String>[].obs;
  var _buttonIndex = 0.obs;
  var _title = "".obs;
  var _locationName = "".obs;

  List<UNITDATAMODEL> get unitOneDetails => _unitOneDetails;
  List<UNITDATAMODEL> get unitTwoDetails => _unitTwoDetails;
  List<UNITDATAMODEL> get unitThreeDetails => _unitThreeDetails;
  List<UNITDATAMODEL> get unitFourDetails => _unitFourDetails;
  List<ConsumptionModel> get unitOne => _unitOne;
  List<ConsumptionModel> get unitTwo => _unitTwo;
  List<ConsumptionModel> get unitThree => _unitThree;
  List<ConsumptionModel> get unitFour => _unitFour;
  List<Color> get colors => _colors;
  List<String> get centerName => _centerName;
  List<String> get buttonText => _buttonText;
  int get buttonIndex => _buttonIndex.value;
  String get title => _title.value;
  String get locationName => _locationName.value;

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

  SetButtonIndex(int val) {
    _buttonIndex.value = val;
  }

  setUnitButtonColor(List<Color> val) {
    _colors.assignAll(val);
  }

  setUnitOneDetails(List<UNITDATAMODEL> val) {
    _unitOneDetails.assignAll(val);
  }

  setUnitTwoDetails(List<UNITDATAMODEL> val) {
    _unitTwoDetails.assignAll(val);
  }

  setUnitThreeDetails(List<UNITDATAMODEL> val) {
    _unitThreeDetails.assignAll(val);
  }

  setUnitFourDetails(List<UNITDATAMODEL> val) {
    _unitFourDetails.assignAll(val);
  }

  setunitOne(List<ConsumptionModel> val) {
    _unitOne.assignAll(val);
  }

  setunitTwo(List<ConsumptionModel> val) {
    _unitTwo.assignAll(val);
  }

  setunitThree(List<ConsumptionModel> val) {
    _unitThree.assignAll(val);
  }

  setunitFour(List<ConsumptionModel> val) {
    _unitFour.assignAll(val);
  }
}

class ChartData2 {
  ChartData2({required this.x, required this.y});
  final String? x;
  final double? y;
}
