import 'package:epcc/Models/consumptionModel.dart';
import 'package:epcc/Models/unitdatamodel.dart';
import 'package:get/get.dart';

class UnitsController extends GetxController {
  var _chartOne = <ChartData1>[].obs;
  List<ChartData1> get chartOne => _chartOne;
  setChartOne(ChartData1 value) {
    _chartOne.add(value);
    _chartOne.refresh();
  }

  var _chartTwo = <ChartData1>[].obs;
  List<ChartData1> get chartTwo => _chartTwo;
  setChartTwo(ChartData1 value) {
    _chartTwo.add(value);
    _chartTwo.refresh();
  }

  var _chartThree = <ChartData1>[].obs;
  List<ChartData1> get chartThree => _chartThree;
  setChartThree(ChartData1 value) {
    _chartThree.add(value);
    _chartThree.refresh();
  }

  var _chartFour = <ChartData1>[].obs;
  List<ChartData1> get chartFour => _chartFour;
  setChartFour(ChartData1 value) {
    _chartFour.add(value);
    _chartFour.refresh();
  }

  @override
  void onInit() {
    super.onInit();
    print("Called");
  }

  addChartsDetails(
      List<UNITDATAMODEL> unitOneDetails,
      List<UNITDATAMODEL> unitTwoDetails,
      List<UNITDATAMODEL> unitThreeDetails,
      List<UNITDATAMODEL> unitFourDetails,
      int index) {
    if (_unitdropdown1.value == "." &&
        _unitdropdown2.value == "." &&
        _unitdropdown3.value == ".") {
      for (var i = 0; i < 4; i++) {
        print(unitOneDetails[i].consumptionDate);
        setChartOne(ChartData1(
            x: unitOneDetails[i].consumptionDate!,
            y: unitOneDetails[i].totalValue!));

        setChartTwo(ChartData1(
            x: unitTwoDetails[i].consumptionDate!,
            y: unitTwoDetails[i].totalValue!));

        if (index > 2) {
          setChartThree(ChartData1(
              x: unitThreeDetails[i].consumptionDate!,
              y: unitThreeDetails[i].totalValue!));
          setChartFour(ChartData1(
              x: unitFourDetails[i].consumptionDate!,
              y: unitFourDetails[i].totalValue!));
        }
      }
    } else if (_unitdropdown1.value != "." &&
        _unitdropdown2.value != "." &&
        _unitdropdown3.value != ".") {
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
          print("{$date}  $_date");
          _chartOne.clear();
          setChartOne(ChartData1(
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
          print("{$date}  $_date");
          a++;
          _chartTwo.clear();
          setChartTwo(ChartData1(
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
            setChartThree(ChartData1(
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
            setChartFour(ChartData1(
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
              duration: Duration(seconds: 2), message: "Select Correct Date");
        }
      } else {
        if (_chartOne.isEmpty && _chartTwo.isEmpty) {
          Get.rawSnackbar(
              duration: Duration(seconds: 2), message: "Select Correct Date");
        }
      }
    } else if (_unitdropdown1.value != "." ||
        _unitdropdown2.value != "." ||
        _unitdropdown3.value != ".") {
      _chartOne.clear();
      _chartTwo.clear();
      _chartThree.clear();
      _chartFour.clear();
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

  List<UNITDATAMODEL> get unitOneDetails => _unitOneDetails;
  List<UNITDATAMODEL> get unitTwoDetails => _unitTwoDetails;
  List<UNITDATAMODEL> get unitThreeDetails => _unitThreeDetails;
  List<UNITDATAMODEL> get unitFourDetails => _unitFourDetails;
  List<ConsumptionModel> get unitOne => _unitOne;
  List<ConsumptionModel> get unitTwo => _unitTwo;
  List<ConsumptionModel> get unitThree => _unitThree;
  List<ConsumptionModel> get unitFour => _unitFour;

  setUnitOneDetails(UNITDATAMODEL val) {
    _unitOneDetails.add(val);
  }

  setUnitTwoDetails(UNITDATAMODEL val) {
    _unitTwoDetails.add(val);
  }

  setUnitThreeDetails(UNITDATAMODEL val) {
    _unitThreeDetails.add(val);
  }

  setUnitFourDetails(UNITDATAMODEL val) {
    _unitFourDetails.add(val);
  }

  setunitOne(ConsumptionModel val) {
    _unitOne.add(val);
  }

  setunitTwo(ConsumptionModel val) {
    _unitTwo.add(val);
  }

  setunitThree(ConsumptionModel val) {
    _unitThree.add(val);
  }

  setunitFour(ConsumptionModel val) {
    _unitFour.add(val);
  }
}

class ChartData1 {
  ChartData1({required this.x, required this.y});
  final String? x;
  final double? y;
}
