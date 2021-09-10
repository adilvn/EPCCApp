import 'package:epcc/Models/constants.dart';
import 'package:epcc/Models/consumptionModel.dart';
import 'package:epcc/Models/data_modal.dart';
import 'package:epcc/Models/reportmodel.dart';
import 'package:epcc/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  var allReportsData = <Data>[].obs;

  var _dataList = <MonthSum>[].obs;
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

  List<MonthSum> get dataList => _dataList;

  setDataList(String name, double value) {
    _dataList.add(MonthSum(monthName: name, monthSum: value));
  }

  var _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  setValueBool(bool val) {
    _isLoading.value = val;
  }

  double jansum = 0;
  double febsum = 0;
  double marsum = 0;
  double aprsum = 0;
  double maysum = 0;
  double junsum = 0;
  double julsum = 0;
  double augsum = 0;
  double sepsum = 0;
  double octsum = 0;
  double novsum = 0;
  double decsum = 0;

  List<String> date = [];
  addDataList() {
    if (YearValue == "Year" &&
        MonthValue == "Month" &&
        TPDropValue == "TP/PP" &&
        UnitDropValue == "Unit" &&
        BPDropValue == "Consumption") {
      setValueBool(false);
      dataList.clear();

      var _year;
      for (var i = 0; i < allReportsData.length; i++) {
        _year = DateTime.now().year;
        final year =
            allReportsData[i].cONSUMPTIONDATE!.substring(7, 9).toString();

        if (_year.toString().substring(2, 4) == year) {
          if (allReportsData[i].cONSUMPTIONDATE!.substring(3, 6).toString() ==
              "JAN") {
            jansum = jansum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "FEB") {
            febsum = febsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "MAR") {
            marsum = marsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "APR") {
            aprsum = aprsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "MAY") {
            maysum = maysum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "JUN") {
            junsum = junsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "JUL") {
            julsum = julsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "AUG") {
            augsum = augsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "SEP") {
            sepsum = sepsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "OCT") {
            octsum = octsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "NOV") {
            novsum = novsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "DEC") {
            decsum = decsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          }
        } else {
          break;
        }
      }
      setDataList("JAN-${_year.toString().substring(2, 4)}", jansum);
      setDataList("FEB-${_year.toString().substring(2, 4)}", febsum);
      setDataList("MAR-${_year.toString().substring(2, 4)}", marsum);
      setDataList("APR-${_year.toString().substring(2, 4)}", aprsum);
      setDataList("MAY-${_year.toString().substring(2, 4)}", maysum);
      setDataList("JUN-${_year.toString().substring(2, 4)}", junsum);
      setDataList("JUL-${_year.toString().substring(2, 4)}", julsum);
      setDataList("AUG-${_year.toString().substring(2, 4)}", augsum);
      setDataList("SEP-${_year.toString().substring(2, 4)}", sepsum);
      setDataList("OCT-${_year.toString().substring(2, 4)}", octsum);
      setDataList("NOV-${_year.toString().substring(2, 4)}", novsum);
      setDataList("DEC-${_year.toString().substring(2, 4)}", decsum);
      jansum = 0;
      febsum = 0;
      marsum = 0;
      aprsum = 0;
      maysum = 0;
      junsum = 0;
      julsum = 0;
      augsum = 0;
      sepsum = 0;
      octsum = 0;
      novsum = 0;
      decsum = 0;
    }
    //TODO reports All  Value
    else if (YearValue != "Year" &&
        MonthValue != "Month" &&
        TPDropValue != "TP/PP" &&
        UnitDropValue != "Unit" &&
        BPDropValue != "Consumption") {
      var _month = MonthValue.toUpperCase();

      var _year = YearValue.substring(2, 4).toUpperCase();

      var date = "$_month-$_year";

      int a = 0;
      double monthsum = 0.0;
      for (var i = 0; i < allReportsData.length; i++) {
        if (allReportsData[i].s == TPDropValue &&
            allReportsData[i].nAME == UnitDropValue &&
            allReportsData[i].nAME1!.toUpperCase().toString() ==
                BPDropValue.toUpperCase() &&
            allReportsData[i].cONSUMPTIONDATE!.substring(3, 9) == date) {
          dataList.clear();

          if (allReportsData[i].cONSUMPTIONDATE!.substring(3, 6).toString() ==
              MonthValue.toUpperCase()) {
            a++;
            monthsum = monthsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          }
        }
      }

      if (a > 0) {
        setDataList(
            "${MonthValue.toUpperCase()}-${YearValue.substring(2, 4).toString()}",
            monthsum);

        a = 0;
        monthsum = 0;
      } else {
        dataList.clear();
        _showSnak("Data not Found");
      }
    }
    // TODO reports per year
    else if (YearValue != "Year" &&
        MonthValue == "Month" &&
        TPDropValue != "TP/PP" &&
        UnitDropValue != "Unit" &&
        BPDropValue != "Consumption") {
      dataList.clear();
      var _year = YearValue;

      int a = 0;

      for (var i = 0; i < allReportsData.length; i++) {
        var date =
            allReportsData[i].cONSUMPTIONDATE!.substring(7, 9).toString();
        if (allReportsData[i].s == TPDropValue &&
            allReportsData[i].nAME == UnitDropValue &&
            allReportsData[i].nAME1!.toUpperCase().toString() ==
                BPDropValue.toUpperCase() &&
            date == YearValue.substring(2, 4).toUpperCase()) {
          a++;

          if (allReportsData[i].cONSUMPTIONDATE!.substring(3, 6).toString() ==
              "JAN") {
            jansum = jansum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "FEB") {
            febsum = febsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "MAR") {
            marsum = marsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "APR") {
            aprsum = aprsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "MAY") {
            maysum = maysum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "JUN") {
            junsum = junsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "JUL") {
            julsum = julsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "AUG") {
            augsum = augsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "SEP") {
            sepsum = sepsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "OCT") {
            octsum = octsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "NOV") {
            novsum = novsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "DEC") {
            decsum = decsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          }
        }
      }
      if (a > 0) {
        setDataList("JAN-${_year.toString().substring(2, 4)}", jansum);
        setDataList("FEB-${_year.toString().substring(2, 4)}", febsum);
        setDataList("MAR-${_year.toString().substring(2, 4)}", marsum);
        setDataList("APR-${_year.toString().substring(2, 4)}", aprsum);
        setDataList("MAY-${_year.toString().substring(2, 4)}", maysum);
        setDataList("JUN-${_year.toString().substring(2, 4)}", junsum);
        setDataList("JUL-${_year.toString().substring(2, 4)}", julsum);
        setDataList("AUG-${_year.toString().substring(2, 4)}", augsum);
        setDataList("SEP-${_year.toString().substring(2, 4)}", sepsum);
        setDataList("OCT-${_year.toString().substring(2, 4)}", octsum);
        setDataList("NOV-${_year.toString().substring(2, 4)}", novsum);
        setDataList("DEC-${_year.toString().substring(2, 4)}", decsum);
        jansum = 0;
        febsum = 0;
        marsum = 0;
        aprsum = 0;
        maysum = 0;
        junsum = 0;
        julsum = 0;
        augsum = 0;
        sepsum = 0;
        octsum = 0;
        novsum = 0;
        decsum = 0;

        a = 0;
      } else {
        dataList.clear();

        _showSnak("Data not Found");
      }
    } else if (YearValue == "Year" &&
        MonthValue == "Month" &&
        TPDropValue != "TP/PP" &&
        UnitDropValue != "Unit" &&
        BPDropValue != "Consumption") {
      dataList.clear();

      _showSnak("Choose Year OR Month");

      // int a = 0;
      // int b = 0;
      // for (var i = 0; i < allReportsData.length; i++) {
      //   if (allReportsData[i].s2 == TPDropValue &&
      //       allReportsData[i].nAME == UnitDropValue &&
      //       allReportsData[i].nAME1!.toUpperCase().toString() ==
      //           BPDropValue.toUpperCase()) {

      //   }
      // }

    } else if (YearValue == "Year" &&
        MonthValue != "Month" &&
        TPDropValue == "TP/PP" &&
        UnitDropValue == "Unit" &&
        BPDropValue == "Consumption") {
      _dataList.clear();
      setValueBool(false);
      _showSnak("Select Year");
    } else if (YearValue != "Year" &&
        MonthValue == "Month" &&
        TPDropValue == "TP/PP" &&
        UnitDropValue == "Unit" &&
        BPDropValue == "Consumption") {
      _dataList.clear();
      setValueBool(false);
      setTPDropValue('TP1');
      setDrop2List("TP1");
      addDataList();
    } else if (YearValue != "Year" &&
        MonthValue != "Month" &&
        TPDropValue == "TP/PP" &&
        UnitDropValue == "Unit" &&
        BPDropValue == "Consumption") {
      _dataList.clear();
      setValueBool(false);
      setTPDropValue('TP1');
      setDrop2List("TP1");
      addDataList();
    }
  }

  _showSnak(String message) {
    return Get.rawSnackbar(
        backgroundColor: epccBlue500,
        icon: Icon(
          Icons.error,
          color: white,
        ),
        message: message,
        barBlur: 1.2,
        duration: Duration(seconds: 2));
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
      setDrop2Value(["Unit"]);
      setUnitsDropList("Unit");
      setBPDropValue1("Year");
      setBPDropValue2("Month");
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
      setBPDropValue1("2021");
    } else if (val == "II") {
      setBPDropListValue(
          ["Back process Unit 2\r\n", "Spinning/winding unit 2"]);
    } else if (val == "Section 1") {
      setBPDropListValue([
        "Back process 25k",
        "Spinning /winding 25k",
      ]);
      setBPDropValue1("2021");
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
      setBPDropValue1("2021");
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
    } else if (val == "Unit") {
      setBPDropListValue(["Consumption"]);
      setBPDropValue1("Year");
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
  List<String> get TPDrop => _TPDropList;

  List<String> get UnitDrop => _UnitDropList;

  List<String> get BPDrop => _BPDropList;
}

class DateInfo {
  String year;
  List<String> date;
  DateInfo({required this.year, required this.date});
}

class MonthSum {
  String? monthName;
  double? monthSum;
  MonthSum({this.monthName, this.monthSum});
}
