import 'package:epcc/Models/consumptionModel.dart';
import 'package:epcc/Models/data_modal.dart';
import 'package:epcc/Models/reportmodel.dart';
import 'package:epcc/main.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  var allReportsData = <Data>[].obs;

  var _dataList = <ReportModel>[].obs;
  var _bpdropdown1 = "Year".obs;

  var _bpdropdown2 = "Month".obs;
  var _bpdropdown3 = "Day".obs;
  var _TPdropdown = "TP/PP".obs;

  var _unitdropdown = "Unit".obs;
  var _bpdropdown = "Consumption".obs;
  String get YearValue => _bpdropdown1.value;
  String get MonthValue => _bpdropdown2.value;
  String get DayValue => _bpdropdown3.value;
  String get TPDropValue => _TPdropdown.value;
  String get UnitDropValue => _unitdropdown.value;
  String get BPDropValue => _bpdropdown.value;

  List<ReportModel> get dataList => _dataList;

  setDataList(String? monthValue, String? consumption, String? lastYear,
      String? change) {
    _dataList.add(ReportModel(
        monthValue: monthValue!,
        consumption: consumption!,
        lastYear: lastYear!,
        change: change!));
  }

  var _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  setValueBool(bool val) {
    _isLoading.value = val;
  }

////TODO report Unit Details

  List<ConsumptionModel> _TP1UnitOne = [];
  List<ConsumptionModel> get TP1UnitOneDetails => _TP1UnitOne;
  setTP1UnitOne(List<ConsumptionModel> value) {
    _TP1UnitOne.assignAll(value);
  }

  List<ConsumptionModel> _TP1UnitTwo = [];
  List<ConsumptionModel> get TP1UnitTwoDetails => _TP1UnitTwo;
  setTp1UnitTwo(List<ConsumptionModel> value) {
    _TP1UnitTwo.assignAll(value);
  }

  List<ConsumptionModel> _TP2UnitOne = [];
  List<ConsumptionModel> get TP2UnitOneDetails => _TP2UnitOne;
  setTP2UnitOne(List<ConsumptionModel> value) {
    _TP2UnitOne.assignAll(value);
  }

  List<ConsumptionModel> _TP2UnitTwo = [];
  List<ConsumptionModel> get TP2UnitTwoDetails => _TP2UnitTwo;
  setTp2UnitTwo(List<ConsumptionModel> value) {
    _TP2UnitTwo.assignAll(value);
  }

  List<ConsumptionModel> _TP3UnitOne = [];
  List<ConsumptionModel> get TP3UnitOneDetails => _TP3UnitOne;
  setTP3UnitOne(List<ConsumptionModel> value) {
    _TP3UnitOne.assignAll(value);
  }

  List<ConsumptionModel> _TP3UnitTwo = [];
  List<ConsumptionModel> get TP3UnitTwoDetails => _TP3UnitTwo;
  setTp3UnitTwo(List<ConsumptionModel> value) {
    _TP3UnitTwo.assignAll(value);
  }

//Sections

  List<ConsumptionModel> _TP4SOne = [];
  List<ConsumptionModel> get TP4SOneDetails => _TP4SOne;
  setTP4SOne(List<ConsumptionModel> value) {
    _TP4SOne.assignAll(value);
  }

  List<ConsumptionModel> _TP4STwo = [];
  List<ConsumptionModel> get TP4STwoDetails => _TP4STwo;
  setTP4STwo(List<ConsumptionModel> value) {
    _TP4STwo.assignAll(value);
  }

  List<ConsumptionModel> _TP4SThree = [];
  List<ConsumptionModel> get TP4SThreeDetails => _TP4SThree;
  setTP4SThree(List<ConsumptionModel> value) {
    _TP4SThree.assignAll(value);
  }

  List<ConsumptionModel> _TP4SFour = [];
  List<ConsumptionModel> get TP4SFourDetails => _TP4SFour;
  setTP4SFour(List<ConsumptionModel> value) {
    _TP4SFour.assignAll(value);
  }

//PP

  List<ConsumptionModel> _PPOne = [];
  List<ConsumptionModel> get PPOneDetails => _PPOne;
  setPPOne(List<ConsumptionModel> value) {
    _PPOne.assignAll(value);
  }

  List<ConsumptionModel> _PPTwo = [];
  List<ConsumptionModel> get PPTwoDetails => _PPTwo;
  setPPTwo(List<ConsumptionModel> value) {
    _PPTwo.assignAll(value);
  }

  List<ConsumptionModel> _PPThree = [];
  List<ConsumptionModel> get PPThreeDetails => _PPThree;
  setPPThree(List<ConsumptionModel> value) {
    _PPThree.assignAll(value);
  }

  List<ConsumptionModel> _Utilities = [];
  List<ConsumptionModel> get UtilitiesDetails => _Utilities;
  setUtilitie(List<ConsumptionModel> value) {
    _Utilities.assignAll(value);
  }

  List<DateInfo> _allYaers = <DateInfo>[].obs;
  List<DateInfo> get allYears => _allYaers;
  setAllyear(String year, List<String> date) {
    print("addd $year");
    _allYaers.add(DateInfo(year: year, date: date));
  }

  List<String> date = [];
  addDataList() {
    if (YearValue == "Year" &&
        MonthValue == "Month" &&
        DayValue == "Day" &&
        TPDropValue == "TP/PP" &&
        UnitDropValue == "Unit" &&
        BPDropValue == "Consumption") {
      // int a = 0;
      // for (var i = 0; i < TP1UnitOneDetails.length; i++) {
      //   String _year =
      //       TP1UnitOneDetails[i].consumptionDate!.substring(0, 9).toString();
      //   // print(TP2UnitOneDetails[i].consumptionDate);
      //   print(_year);
      //   if (date.isEmpty) {
      //     date.add(TP1UnitOneDetails[i].consumptionDate.toString());
      //   }
      //   if (date.isNotEmpty) {
      //     if (_year == date.last.substring(7, 9)) {
      //       date.add(TP1UnitOneDetails[i].consumptionDate.toString());
      //     }
      //   }
      // }
      // for (var i = 0; i < _allYaers.length; i++) {
      //   print("loop");
      //   if (_allYaers[i].year == "20") {
      //     print("ok");
      //     print(_allYaers[i].date.length);
      //     for (var a = 0; a < _allYaers[i].date.length; a++) {
      //       print(_allYaers[i].date[a]);
      //     }
      //   }
      // }
      setValueBool(false);
      dataList.clear();
      var month = "";
      double consumptionValue = 0;
      double lastYearConsumptionValue = 0;
      for (var i = 0; i < 27; i++) {
        month = allReportsData[i].cONSUMPTIONDATE!.substring(3, 6).toString();
        consumptionValue =
            double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
        double difference = consumptionValue - lastYearConsumptionValue;
        setDataList(month, consumptionValue.toString(),
            lastYearConsumptionValue.toString(), difference.toString());
      }
    }
    //TODO reports All  Value
    else if (YearValue != "Year" &&
        MonthValue != "Month" &&
        DayValue != "Day" &&
        TPDropValue != "TP/PP" &&
        UnitDropValue != "Unit" &&
        BPDropValue != "Consumption") {
      var _month = MonthValue.toUpperCase();
      var _day = DayValue.toUpperCase();
      var _year = YearValue.substring(2, 4).toUpperCase();
      var _prevYear = int.parse(_year) - 1;

      var date = "$_day-$_month-$_year";
      var _prevData = "$_day-$_month-$_prevYear";

      var month = "";
      double consumptionValue = 0;
      double lastYearConsumptionValue = 0;

      int a = 0;
      for (var i = 0; i < allReportsData.length; i++) {
        if (allReportsData[i].s2 == TPDropValue &&
            allReportsData[i].nAME == UnitDropValue &&
            allReportsData[i].s8!.toUpperCase().toString() ==
                BPDropValue.toUpperCase() &&
            allReportsData[i].cONSUMPTIONDATE == date) {
          dataList.clear();

          month = allReportsData[i].cONSUMPTIONDATE!.toString();
          consumptionValue =
              double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          a++;
        }
      }

      // for (var i = 0; i < allReportsData.length; i++) {
      //   if (allReportsData[i].s2 == TPDropValue &&
      //       allReportsData[i].nAME == UnitDropValue &&
      //       allReportsData[i].nAME1 == BPDropValue &&
      //       allReportsData[i].cONSUMPTIONDATE == _prevData) {

      //   }
      // }
      if (a > 0) {
        double difference = consumptionValue - lastYearConsumptionValue;
        setDataList(month, consumptionValue.toString(),
            lastYearConsumptionValue.toString(), difference.toString());

        a = 0;
      } else {
        dataList.clear();
        Get.rawSnackbar(
            message: "No Data Found", duration: Duration(seconds: 2));
      }
    }
    // TODO reports per year
    else if (YearValue != "Year" &&
        MonthValue == "Month" &&
        DayValue == "Day" &&
        TPDropValue != "TP/PP" &&
        UnitDropValue != "Unit" &&
        BPDropValue != "Consumption") {
      dataList.clear();
      var _year = YearValue.substring(2, 4).toUpperCase();
      var _prevYear = int.parse(_year) - 1;
      var _prevData = "$_prevYear";
      var month = "";
      double consumptionValue = 0;
      double lastYearConsumptionValue = 0;

      int a = 0;
      int b = 0;
      for (var i = 0; i < allReportsData.length; i++) {
        var date =
            allReportsData[i].cONSUMPTIONDATE!.substring(7, 9).toString();
        if (allReportsData[i].s2 == TPDropValue &&
            allReportsData[i].nAME == UnitDropValue &&
            allReportsData[i].nAME1!.toUpperCase().toString() ==
                BPDropValue.toUpperCase() &&
            date == _year) {
          print("called");
          b++;

          month = allReportsData[i].cONSUMPTIONDATE!.substring(3, 6).toString();
          consumptionValue =
              double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          a++;
        }

        // for (var i = 0; i < allReportsData.length; i++) {
        //   if (allReportsData[i].s2 == TPDropValue &&
        //       allReportsData[i].nAME == UnitDropValue &&
        //       allReportsData[i].nAME1 == BPDropValue &&
        //       allReportsData[i].cONSUMPTIONDATE == _prevData) {
        //     lastYearConsumptionValue =
        //         double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
        //   }
        // }

        if (a > 0) {
          double difference = consumptionValue - lastYearConsumptionValue;
          setDataList(month, consumptionValue.toString(),
              lastYearConsumptionValue.toString(), difference.toString());
          a = 0;
        }
      }

      if (b == 0) {
        dataList.clear();

        setValueBool(false);
        Get.rawSnackbar(
            message: "No Data Found", duration: Duration(seconds: 2));
      } else {
        setValueBool(false);
      }
    } else if (YearValue != "Year" &&
        MonthValue != "Month" &&
        DayValue == "Day" &&
        TPDropValue != "TP/PP" &&
        UnitDropValue != "Unit" &&
        BPDropValue != "Consumption") {
      dataList.clear();
      var _month = MonthValue.toUpperCase();

      var _year = YearValue.substring(2, 4).toUpperCase();
      var _prevYear = int.parse(_year) - 1;
      var _prevData = "$_prevYear";
      var month = "";
      var newdate = "$_month-$_year";
      double consumptionValue = 0;
      double lastYearConsumptionValue = 0;

      int a = 0;
      int b = 0;
      for (var i = 0; i < allReportsData.length; i++) {
        var date =
            allReportsData[i].cONSUMPTIONDATE!.substring(3, 9).toString();
        if (allReportsData[i].s2 == TPDropValue &&
            allReportsData[i].nAME == UnitDropValue &&
            allReportsData[i].nAME1!.toUpperCase().toString() ==
                BPDropValue.toUpperCase() &&
            date == newdate) {
          b++;

          month = allReportsData[i].cONSUMPTIONDATE!.substring(3, 6).toString();
          consumptionValue =
              double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          a++;
        }

        // for (var i = 0; i < allReportsData.length; i++) {
        //   if (allReportsData[i].s2 == TPDropValue &&
        //       allReportsData[i].nAME == UnitDropValue &&
        //       allReportsData[i].nAME1 == BPDropValue &&
        //       allReportsData[i].cONSUMPTIONDATE == _prevData) {
        //     lastYearConsumptionValue =
        //         double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
        //   }
        // }

        if (a > 0) {
          double difference = consumptionValue - lastYearConsumptionValue;
          setDataList(month, consumptionValue.toString(),
              lastYearConsumptionValue.toString(), difference.toString());
          a = 0;
        }
      }

      if (b == 0) {
        dataList.clear();
        Get.rawSnackbar(
            message: "No Data Found", duration: Duration(seconds: 2));
      }
    } else if (YearValue == "Year" &&
        MonthValue == "Month" &&
        DayValue == "Day" &&
        TPDropValue != "TP/PP" &&
        UnitDropValue != "Unit" &&
        BPDropValue != "Consumption") {
      dataList.clear();
      // var _month = MonthValue.toUpperCase();
      // var _year = YearValue.substring(2, 4).toUpperCase();
      // var _prevYear = int.parse(_year) - 1;
      // var _prevData = "$_prevYear";
      var month = "";
      // var newdate = "$_month-$_year";
      double consumptionValue = 0;
      double lastYearConsumptionValue = 0;

      int a = 0;
      int b = 0;
      for (var i = 0; i < allReportsData.length; i++) {
        // var _day =
        //     allReportsData[i].cONSUMPTIONDATE!.substring(0, 2).toString();
        // var _month =
        //     allReportsData[i].cONSUMPTIONDATE!.substring(3, 6).toString();
        // var _year = int.parse(
        //     allReportsData[i].cONSUMPTIONDATE!.substring(7, 9).toString());
        // var _prevY = _year - 1;
        // var _prevData = "$_day-$_month-$_prevY";
        if (allReportsData[i].s2 == TPDropValue &&
            allReportsData[i].nAME == UnitDropValue &&
            allReportsData[i].nAME1!.toUpperCase().toString() ==
                BPDropValue.toUpperCase()) {
          b++;

          month = allReportsData[i].cONSUMPTIONDATE!.substring(3, 6).toString();
          consumptionValue =
              double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          a++;
        }

        // for (var i = 0; i < allReportsData.length; i++) {
        //   if (allReportsData[i].s2 == TPDropValue &&
        //       allReportsData[i].nAME == UnitDropValue &&
        //       allReportsData[i].nAME1 == BPDropValue &&
        //       allReportsData[i].cONSUMPTIONDATE == _prevData) {
        //     lastYearConsumptionValue =
        //         double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
        //   }
        // }

        if (a > 0) {
          double difference = consumptionValue - lastYearConsumptionValue;
          setDataList(month, consumptionValue.toString(),
              lastYearConsumptionValue.toString(), difference.toString());
          a = 0;
        }
      }

      if (b == 0) {
        dataList.clear();
        Get.rawSnackbar(
            message: "No Data Found", duration: Duration(seconds: 2));
      }
    } else if (YearValue != "Year" ||
        MonthValue != "Month" ||
        DayValue != "Day" ||
        TPDropValue == "TP/PP" && UnitDropValue == "Unit" && BPDropValue == "Consumption") {
      _dataList.clear();
      setValueBool(false);
      Get.rawSnackbar(message: "No Data Found", duration: Duration(seconds: 2));
    }
  }

  setDrop2List(String? value) {
    if (value == "TP1") {
      setDrop2Value([
        "I",
        "II",
      ]);
      setUnitsDropList("I");
    } else if (value == "TP2") {
      setDrop2Value([
        "I",
        "II",
      ]);
      setUnitsDropList("I");
    } else if (value == "TP3") {
      setDrop2Value([
        "I",
        "II",
      ]);
      setUnitsDropList("I");
    } else if (value == "TP4") {
      setDrop2Value([
        'Section 1',
        "Section 2",
        "Section 3",
        "Section 4",
      ]);
      setUnitsDropList("Section 1");
    } else if (value == "PP") {
      setDrop2Value(["PP1", "PP2", "PP3", "Utilities"]);
      setUnitsDropList("PP1");
    } else if (value == "TP/PP") {
      setDrop2Value(["Consumption"]);
      setUnitsDropList("Unit");
    }
  }

  List<String> _BPDropList = [
    "Consumption",
  ].obs;
  setBPDropListValue(List<String> value) {
    _BPDropList.clear();
    setBPDropValue(value[0]);
    _BPDropList.assignAll(value);
  }

  setUnitsDropList(String? val) {
    if (val == "I") {
      setBPDropListValue(["Back process Unit 1", "Spinning /winding unit 1"]);
    } else if (val == "II") {
      setBPDropListValue(
          ["Back process Unit 2\r\n", "Spinning/winding unit 2"]);
    } else if (val == "Section 1") {
      setBPDropListValue([
        "Back process 25k",
        "Spinning /winding 25k",
      ]);
    } else if (val == "Section 2") {
      setBPDropListValue([
        "Back process 25k",
        "Spinning /winding 25k",
      ]);
    } else if (val == "Section 3") {
      setBPDropListValue([
        "Back process 25k",
        "Spinning /winding 25k",
      ]);
    } else if (val == "Section 4") {
      setBPDropListValue([
        "Back process 25k",
        "Spinning /winding 25k",
      ]);
    } else if (val == "PP1") {
      setBPDropListValue([
        "polymer/spinning",
        "Draw lines",
      ]);
    } else if (val == "PP2") {
      setBPDropListValue([
        "polymer/spinning",
        "Draw Lines",
      ]);
    } else if (val == "PP3") {
      setBPDropListValue([
        "polymer/spinning",
        "Draw lines",
      ]);
    } else if (val == "Utilities") {
      setBPDropListValue(["PP1 ,PP2 ,PP3\r\n"]);
    } else if (val == "-") {
      setBPDropListValue(["-"]);
    }
  }

  setBPDropValue1(String? val) {
    _bpdropdown1.value = val!;
  }

  setBPDropValue2(String? val) {
    _bpdropdown2.value = val!;
  }

  setBPDropValue3(String? val) {
    _bpdropdown3.value = val!;
  }

  setTPDropValue(String? val) {
    _TPdropdown.value = val!;
  }

  setUnitDropValue(String? val) {
    print(val);
    _unitdropdown.value = val!;
  }

  setBPDropValue(String? val) {
    _bpdropdown.value = val!;
  }

  List<String> _TPDropList = ["TP/PP", "TP1", "TP2", "TP3", "TP4", "PP"].obs;

  List<String> _UnitDropList = ["Unit"].obs;

  setDrop2Value(List<String> val) {
    _UnitDropList.clear();
    setUnitDropValue(val[0]);

    _UnitDropList.assignAll(val);
    print(_UnitDropList);
  }

  List<String> _bpDropList1 = [
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

  List<String> _bpDropList2 = [
    "Month",
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
  List<String> get TPDrop => _TPDropList;

  List<String> get UnitDrop => _UnitDropList;

  List<String> get BPDrop => _BPDropList;
}

class DateInfo {
  String year;
  List<String> date;
  DateInfo({required this.year, required this.date});
}
