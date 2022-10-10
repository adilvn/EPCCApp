import 'dart:developer';

import 'package:epcc/Models/constants.dart';
import 'package:epcc/Models/data_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReportController extends GetxController {
  var allReportsData = <Data>[].obs;

  var _monthDataList = <MonthSum>[].obs;
  var _yearDropDown = 'Year'.obs;

  var _monthDropDown = "Month".obs;
  var _dayDropDown = "Day".obs;
  var _TPdropdown = "TP/PP".obs;

  var _unitdropdown = "Unit".obs;
  var _consumptionDropDown = "Consumption".obs;

  String get YearValue => _yearDropDown.value;

  String get MonthValue => _monthDropDown.value;

  String get DayValue => _dayDropDown.value;

  String get TPDropValue => _TPdropdown.value;

  String get UnitDropValue => _unitdropdown.value;

  String get ConsumptionDropValue => _consumptionDropDown.value;

  List<MonthSum> get dataList => _monthDataList;

  setDataList(String name, double value) {
    _monthDataList.add(MonthSum(monthName: name, monthSum: value));
  }

  var _isLoading = true.obs;

  bool get isLoading => _isLoading.value;

  setValueBool(bool val) {
    _isLoading.value = val;
  }

  double janSum = 0.0;
  double febSum = 0.0;
  double marSum = 0.0;
  double aprSum = 0.0;
  double maySum = 0.0;
  double junSum = 0.0;
  double julSum = 0.0;
  double augSum = 0.0;
  double sepSum = 0.0;
  double octSum = 0.0;
  double novSum = 0.0;
  double decSum = 0.0;

  void clearAllMonthlySum() {
    janSum = 0;
    febSum = 0;
    marSum = 0;
    aprSum = 0;
    maySum = 0;
    junSum = 0;
    julSum = 0;
    augSum = 0;
    sepSum = 0;
    octSum = 0;
    novSum = 0;
    decSum = 0;
  }

  void setAllValues(_year) {
    setDataList("JAN-${_year.toString().substring(2, 4)}", janSum);
    setDataList("FEB-${_year.toString().substring(2, 4)}", febSum);
    setDataList("MAR-${_year.toString().substring(2, 4)}", marSum);
    setDataList("APR-${_year.toString().substring(2, 4)}", aprSum);
    setDataList("MAY-${_year.toString().substring(2, 4)}", maySum);
    setDataList("JUN-${_year.toString().substring(2, 4)}", junSum);
    setDataList("JUL-${_year.toString().substring(2, 4)}", julSum);
    setDataList("AUG-${_year.toString().substring(2, 4)}", augSum);
    setDataList("SEP-${_year.toString().substring(2, 4)}", sepSum);
    setDataList("OCT-${_year.toString().substring(2, 4)}", octSum);
    setDataList("NOV-${_year.toString().substring(2, 4)}", novSum);
    setDataList("DEC-${_year.toString().substring(2, 4)}", decSum);
  }

  List<String> date = [];

  addDataList() {
    if (YearValue == "Year" &&
        MonthValue == "Month" &&
        TPDropValue == "TP/PP" &&
        UnitDropValue == "Unit" &&
        ConsumptionDropValue == "Consumption") {
      log('addDataList run if YearValue == "Year" && MonthValue == Month && TPDropValue == TP/PP && UnitDropValue == Unit && ConsumptionDropValue == Consumption');
      log('addDataList YearValue: $YearValue');
      log('addDataList MonthValue: $MonthValue');
      log('addDataList TPDropValue: $TPDropValue');
      log('addDataList UnitDropValue: $UnitDropValue');
      log('addDataList ConsumptionDropValue: $ConsumptionDropValue');

      setValueBool(false);
      dataList.clear();
      log("Report on the basis of nothing");
      var _year;
      for (var i = 0; i < allReportsData.length; i++) {
        _year = DateTime.now().year;
        final year =
            allReportsData[i].cONSUMPTIONDATE!.substring(7, 9).toString();

        if (_year.toString().substring(2, 4) == year) {
          if (allReportsData[i].cONSUMPTIONDATE!.substring(3, 6).toString() ==
              "JAN") {
            janSum = janSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "FEB") {
            febSum = febSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "MAR") {
            marSum = marSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "APR") {
            aprSum = aprSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "MAY") {
            maySum = maySum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "JUN") {
            junSum = junSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "JUL") {
            julSum = julSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "AUG") {
            augSum = augSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "SEP") {
            sepSum = sepSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "OCT") {
            log("Name:  ${allReportsData[i].nAME} "
                "Name1:  ${allReportsData[i].nAME1} "
                "Consumption Value: ${allReportsData[i].cONSUMPTIONVALUE} "
                "Consumption Date:  ${allReportsData[i].cONSUMPTIONDATE} ");

            octSum = octSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "NOV") {
            novSum = novSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "DEC") {
            decSum = decSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          }
        } else {
          break;
        }
      }
      setAllValues(_year);

      clearAllMonthlySum();
    }
    //Checks if YearValue == current year, MonthValue == month, TPDropValue == TP/PP,  unit == Unit, ConsumptionDropValue == Consumption
    if (YearValue == DateFormat('yyyy').format(DateTime.now()) &&
        MonthValue == "Month" &&
        TPDropValue == "TP/PP" &&
        UnitDropValue == "Unit" &&
        ConsumptionDropValue == "Consumption") {
      log('addDataList run if YearValue == "Year" && MonthValue == Month && TPDropValue == TP/PP && UnitDropValue == Unit && ConsumptionDropValue == Consumption');
      log('addDataList YearValue: $YearValue');
      log('addDataList MonthValue: $MonthValue');
      log('addDataList TPDropValue: $TPDropValue');
      log('addDataList UnitDropValue: $UnitDropValue');
      log('addDataList ConsumptionDropValue: $ConsumptionDropValue');

      setValueBool(false);
      dataList.clear();
      log("Report on the basis of nothing");
      var _year;
      for (var i = 0; i < allReportsData.length; i++) {
        _year = DateTime.now().year;
        final year =
            allReportsData[i].cONSUMPTIONDATE!.substring(7, 9).toString();

        if (_year.toString().substring(2, 4) == year) {
          if (allReportsData[i].cONSUMPTIONDATE!.substring(3, 6).toString() ==
              "JAN") {
            janSum = janSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "FEB") {
            febSum = febSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "MAR") {
            marSum = marSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "APR") {
            aprSum = aprSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "MAY") {
            maySum = maySum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "JUN") {
            junSum = junSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "JUL") {
            julSum = julSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "AUG") {
            augSum = augSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "SEP") {
            sepSum = sepSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "OCT") {
            log("Name:  ${allReportsData[i].nAME} "
                "Name1:  ${allReportsData[i].nAME1} "
                "Consumption Value: ${allReportsData[i].cONSUMPTIONVALUE} "
                "Consumption Date:  ${allReportsData[i].cONSUMPTIONDATE} ");

            octSum = octSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "NOV") {
            novSum = novSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "DEC") {
            decSum = decSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          }
        } else {
          break;
        }
      }
      setAllValues(_year);

      clearAllMonthlySum();
    }

    //Checks if year, month, unit & consumption are null and gives yearly data for TP
    else if (YearValue == "Year" &&
        MonthValue == "Month" &&
        TPDropValue != "TP/PP" &&
        UnitDropValue == "Unit" &&
        ConsumptionDropValue == "Consumption") {
      log('addDataList run if YearValue == "Year" && MonthValue == Month && TPDropValue != TP/PP && UnitDropValue == Unit && ConsumptionDropValue == Consumption');
      log('addDataList YearValue: $YearValue');
      log('addDataList MonthValue: $MonthValue');
      log('addDataList TPDropValue: $TPDropValue');
      log('addDataList UnitDropValue: $UnitDropValue');
      log('addDataList ConsumptionDropValue: $ConsumptionDropValue');
      setValueBool(false);
      dataList.clear();
      var _year;
      for (var i = 0; i < allReportsData.length; i++) {
        _year = DateTime.now().year;
        final year =
            allReportsData[i].cONSUMPTIONDATE!.substring(7, 9).toString();
        if (_year.toString().substring(2, 4) == year &&
            allReportsData[i].s == TPDropValue) {
          log("Report on the basis of TP/PP only");
          if (allReportsData[i].cONSUMPTIONDATE!.substring(3, 6).toString() ==
              "JAN") {
            janSum = janSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
            log("January Sum");
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "FEB") {
            febSum = febSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
            log("Feb Sum");
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "MAR") {
            marSum = marSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
            log("MAR Sum");
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "APR") {
            aprSum = aprSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
            log("Apr Sum");
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "MAY") {
            maySum = maySum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "JUN") {
            junSum = junSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "JUL") {
            julSum = julSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "AUG") {
            augSum = augSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "SEP") {
            sepSum = sepSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "OCT") {
            octSum = octSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
            log("OCTSum");
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "NOV") {
            novSum = novSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
            log("NOV Sum");
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "DEC") {
            decSum = decSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
            log("DEC Sum");
          }
        }
      }
      setAllValues(_year);
      clearAllMonthlySum();
    }

    //Showing data for unit based on the yearly basis
    else if (YearValue == "Year" &&
        MonthValue == "Month" &&
        TPDropValue != "TP/PP" &&
        UnitDropValue != "Unit" &&
        ConsumptionDropValue == "Consumption") {
      log('addDataList run if YearValue == "Year" && MonthValue == Month && TPDropValue != TP/PP && UnitDropValue != Unit && ConsumptionDropValue == Consumption');
      log('addDataList YearValue: $YearValue');
      log('addDataList MonthValue: $MonthValue');
      log('addDataList TPDropValue: $TPDropValue');
      log('addDataList UnitDropValue: $UnitDropValue');
      log('addDataList ConsumptionDropValue: $ConsumptionDropValue');
      setValueBool(false);
      dataList.clear();
      var _year;
      for (var i = 0; i < allReportsData.length; i++) {
        _year = DateTime.now().year;
        final year =
            allReportsData[i].cONSUMPTIONDATE!.substring(7, 9).toString();
        if (_year.toString().substring(2, 4) == year &&
            allReportsData[i].s == TPDropValue &&
            allReportsData[i].nAME == UnitDropValue) {
          log("Report on the basis of TP/PP and Unit on Yearly Basis");
          if (allReportsData[i].cONSUMPTIONDATE!.substring(3, 6).toString() ==
              "JAN") {
            janSum = janSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
            log("January Sum");
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "FEB") {
            febSum = febSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
            log("Feb Sum");
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "MAR") {
            marSum = marSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
            log("MAR Sum");
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "APR") {
            aprSum = aprSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
            log("Apr Sum");
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "MAY") {
            maySum = maySum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "JUN") {
            junSum = junSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "JUL") {
            julSum = julSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "AUG") {
            augSum = augSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "SEP") {
            sepSum = sepSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "OCT") {
            octSum = octSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
            log("OCTSum");
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "NOV") {
            novSum = novSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
            log("NOV Sum");
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "DEC") {
            decSum = decSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
            log("DEC Sum");
          }
        }
      }
      setAllValues(_year);
      clearAllMonthlySum();
    }

    //Showing data for consumption based on the yearly basis
    else if (YearValue == "Year" &&
        MonthValue == "Month" &&
        TPDropValue != "TP/PP" &&
        UnitDropValue != "Unit" &&
        ConsumptionDropValue != "Consumption") {
      log('addDataList run if YearValue == "Year" && MonthValue == Month && TPDropValue != TP/PP && UnitDropValue != Unit && ConsumptionDropValue != Consumption');
      log('addDataList YearValue: $YearValue');
      log('addDataList MonthValue: $MonthValue');
      log('addDataList TPDropValue: $TPDropValue');
      log('addDataList UnitDropValue: $UnitDropValue');
      log('addDataList ConsumptionDropValue: $ConsumptionDropValue');
      setValueBool(false);
      dataList.clear();
      var _year;
      for (var i = 0; i < allReportsData.length; i++) {
        _year = DateTime.now().year;
        final year =
            allReportsData[i].cONSUMPTIONDATE!.substring(7, 9).toString();
        if (_year.toString().substring(2, 4) == year &&
            allReportsData[i].s == TPDropValue &&
            allReportsData[i].nAME == UnitDropValue &&
            allReportsData[i].nAME1!.toUpperCase().toString() ==
                ConsumptionDropValue.toUpperCase()) {
          log("Report on the basis of TP/PP Unit & Consumption on Yearly Basis No month selected");
          if (allReportsData[i].cONSUMPTIONDATE!.substring(3, 6).toString() ==
              "JAN") {
            janSum = janSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
            log("January Sum");
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "FEB") {
            febSum = febSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
            log("Feb Sum");
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "MAR") {
            marSum = marSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
            log("MAR Sum");
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "APR") {
            aprSum = aprSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
            log("Apr Sum");
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "MAY") {
            maySum = maySum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "JUN") {
            junSum = junSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "JUL") {
            julSum = julSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "AUG") {
            augSum = augSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "SEP") {
            sepSum = sepSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "OCT") {
            octSum = octSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
            log("OCTSum");
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "NOV") {
            novSum = novSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
            log("NOV Sum");
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "DEC") {
            decSum = decSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
            log("DEC Sum");
          }
        }
      }
      setAllValues(_year);
      clearAllMonthlySum();
    }

//TODO report on the basis of TP/PP -> Unit
    else if (YearValue != "Year" &&
        MonthValue != "Month" &&
        TPDropValue != "TP/PP" &&
        UnitDropValue != "Unit" &&
        ConsumptionDropValue == "Consumption") {
      log('addDataList run if YearValue != "Year" && MonthValue != Month && TPDropValue != TP/PP && UnitDropValue != Unit && ConsumptionDropValue == Consumption');
      log('addDataList YearValue: $YearValue');
      log('addDataList MonthValue: $MonthValue');
      log('addDataList TPDropValue: $TPDropValue');
      log('addDataList UnitDropValue: $UnitDropValue');
      log('addDataList ConsumptionDropValue: $ConsumptionDropValue');
      log("Report on the basis of TP/PP");
      var _month = MonthValue.toUpperCase();

      var _year = YearValue.substring(2, 4).toUpperCase();

      var date = "$_month-$_year";
      int a = 0;
      double monthsum = 0.0;

      for (var i = 0; i < allReportsData.length; i++) {
        if (allReportsData[i].s == TPDropValue &&
            allReportsData[i].nAME == UnitDropValue &&
            // allReportsData[i].nAME1!.toUpperCase().toString() ==
            //     ConsumptionDropValue.toUpperCase() &&
            allReportsData[i].cONSUMPTIONDATE!.substring(3, 9) == date) {
          dataList.clear();

          if (allReportsData[i].cONSUMPTIONDATE!.substring(3, 6).toString() ==
                  MonthValue.toUpperCase() &&
              allReportsData[i].s == TPDropValue &&
              allReportsData[i].nAME == UnitDropValue) {
            a++;
            monthsum = monthsum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          }

          log("Month sum of Report on the basis of TP/PP Year Month: $monthsum & report name ${allReportsData[i].s} && Unit Name is ${allReportsData[i].nAME}");
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

    //TODO reports All  Value
    else if (YearValue != "Year" &&
        MonthValue != "Month" &&
        TPDropValue != "TP/PP" &&
        UnitDropValue != "Unit" &&
        ConsumptionDropValue != "Consumption") {
      log('addDataList run if YearValue != "Year" && MonthValue != Month && TPDropValue != TP/PP && UnitDropValue != Unit && ConsumptionDropValue != Consumption');
      log('addDataList YearValue: $YearValue');
      log('addDataList MonthValue: $MonthValue');
      log('addDataList TPDropValue: $TPDropValue');
      log('addDataList UnitDropValue: $UnitDropValue');
      log('addDataList ConsumptionDropValue: $ConsumptionDropValue');
      var _month = MonthValue.toUpperCase();

      var _year = YearValue.substring(2, 4).toUpperCase();

      var date = "$_month-$_year";

      int a = 0;
      double monthsum = 0.0;
      for (var i = 0; i < allReportsData.length; i++) {
        if (allReportsData[i].s == TPDropValue &&
            allReportsData[i].nAME == UnitDropValue &&
            allReportsData[i].nAME1!.toUpperCase().toString() ==
                ConsumptionDropValue.toUpperCase() &&
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
    } else if (YearValue != "Year" &&
        MonthValue == "Month" &&
        TPDropValue != "TP/PP" &&
        UnitDropValue != "Unit" &&
        ConsumptionDropValue != "Consumption") {
      log('addDataList run if YearValue != "Year" && MonthValue == Month && TPDropValue != TP/PP && UnitDropValue != Unit && ConsumptionDropValue != Consumption');
      log('addDataList YearValue: $YearValue');
      log('addDataList MonthValue: $MonthValue');
      log('addDataList TPDropValue: $TPDropValue');
      log('addDataList UnitDropValue: $UnitDropValue');
      log('addDataList ConsumptionDropValue: $ConsumptionDropValue');
      dataList.clear();
      var _year = YearValue;

      int a = 0;
      for (var i = 0; i < allReportsData.length; i++) {
        var date =
            allReportsData[i].cONSUMPTIONDATE!.substring(7, 9).toString();
        if (allReportsData[i].s == TPDropValue &&
            allReportsData[i].nAME == UnitDropValue &&
            allReportsData[i].nAME1!.toUpperCase().toString() ==
                ConsumptionDropValue.toUpperCase() &&
            date == YearValue.substring(2, 4).toUpperCase()) {
          a++;

          if (allReportsData[i].cONSUMPTIONDATE!.substring(3, 6).toString() ==
              "JAN") {
            janSum = janSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "FEB") {
            febSum = febSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "MAR") {
            marSum = marSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "APR") {
            aprSum = aprSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "MAY") {
            maySum = maySum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "JUN") {
            junSum = junSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "JUL") {
            julSum = julSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "AUG") {
            augSum = augSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "SEP") {
            sepSum = sepSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "OCT") {
            octSum = octSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "NOV") {
            novSum = novSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          } else if (allReportsData[i]
                  .cONSUMPTIONDATE!
                  .substring(3, 6)
                  .toString() ==
              "DEC") {
            decSum = decSum +
                double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
          }
        }
      }
      if (a > 0) {
        // setDataList("JAN-${_year.toString().substring(2, 4)}", janSum);
        // setDataList("FEB-${_year.toString().substring(2, 4)}", febSum);
        // setDataList("MAR-${_year.toString().substring(2, 4)}", marSum);
        // setDataList("APR-${_year.toString().substring(2, 4)}", aprSum);
        // setDataList("MAY-${_year.toString().substring(2, 4)}", maySum);
        // setDataList("JUN-${_year.toString().substring(2, 4)}", junSum);
        // setDataList("JUL-${_year.toString().substring(2, 4)}", julSum);
        // setDataList("AUG-${_year.toString().substring(2, 4)}", augSum);
        // setDataList("SEP-${_year.toString().substring(2, 4)}", sepSum);
        // setDataList("OCT-${_year.toString().substring(2, 4)}", octSum);
        // setDataList("NOV-${_year.toString().substring(2, 4)}", novSum);
        // setDataList("DEC-${_year.toString().substring(2, 4)}", decSum);
        setAllValues(_year);

        clearAllMonthlySum();

        a = 0;
      } else {
        dataList.clear();

        _showSnak("Data not Found");
      }
    }
    //  else if (YearValue == "Year" &&
    //     MonthValue == "Month" &&
    //     TPDropValue != "TP/PP" &&
    //     UnitDropValue != "Unit" &&
    //     ConsumptionDropValue != "Consumption") {
    //   dataList.clear();
    //
    //   _showSnak("Choose Year OR Month");
    //
    //   // int a = 0;
    //   // int b = 0;
    //   // for (var i = 0; i < allReportsData.length; i++) {
    //   //   if (allReportsData[i].s2 == TPDropValue &&
    //   //       allReportsData[i].nAME == UnitDropValue &&
    //   //       allReportsData[i].nAME1!.toUpperCase().toString() ==
    //   //           BPDropValue.toUpperCase()) {
    //
    //   //   }
    //   // }
    //
    // }
    else if (YearValue == "Year" &&
        MonthValue != "Month" &&
        TPDropValue == "TP/PP" &&
        UnitDropValue == "Unit" &&
        ConsumptionDropValue == "Consumption") {
      log('addDataList run if YearValue == "Year" && MonthValue != Month && TPDropValue == TP/PP && UnitDropValue == Unit && ConsumptionDropValue == Consumption');
      log('addDataList YearValue: $YearValue');
      log('addDataList MonthValue: $MonthValue');
      log('addDataList TPDropValue: $TPDropValue');
      log('addDataList UnitDropValue: $UnitDropValue');
      log('addDataList ConsumptionDropValue: $ConsumptionDropValue');
      _monthDataList.clear();
      setValueBool(false);
      _showSnak("Select Year");
    } else if (YearValue != "Year" &&
        MonthValue == "Month" &&
        TPDropValue == "TP/PP" &&
        UnitDropValue == "Unit" &&
        ConsumptionDropValue == "Consumption") {
      log('addDataList run if YearValue != "Year" && MonthValue == Month && TPDropValue == TP/PP && UnitDropValue == Unit && ConsumptionDropValue == Consumption');
      log('addDataList YearValue: $YearValue');
      log('addDataList MonthValue: $MonthValue');
      log('addDataList TPDropValue: $TPDropValue');
      log('addDataList UnitDropValue: $UnitDropValue');
      log('addDataList ConsumptionDropValue: $ConsumptionDropValue');
      _monthDataList.clear();
      setValueBool(false);
      setTPDropDownValue('TP1');
      setDrop2List("TP1");
      addDataList();
    } else if (YearValue != "Year" &&
        MonthValue != "Month" &&
        TPDropValue == "TP/PP" &&
        UnitDropValue == "Unit" &&
        ConsumptionDropValue == "Consumption") {
      log('addDataList run if YearValue != "Year" && MonthValue != Month && TPDropValue == TP/PP && UnitDropValue == Unit && ConsumptionDropValue == Consumption');
      log('addDataList YearValue: $YearValue');
      log('addDataList MonthValue: $MonthValue');
      log('addDataList TPDropValue: $TPDropValue');
      log('addDataList UnitDropValue: $UnitDropValue');
      log('addDataList ConsumptionDropValue: $ConsumptionDropValue');
      _monthDataList.clear();
      setValueBool(false);
      setTPDropDownValue('TP1');
      setDrop2List("TP1");
      addDataList();
    } else {
      log('result');
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
      setUnitDropListValue([
        "Unit",
        "I",
        "II",
      ]);
      // setUnitsDropList("I");
    } else if (value == "TP2") {
      setUnitDropListValue([
        "Unit",
        "I",
        "II",
      ]);
      //setUnitsDropList("I");
    } else if (value == "TP3") {
      setUnitDropListValue([
        "Unit",
        "I",
        "II",
      ]);
      //setUnitsDropList("I");
    } else if (value == "TP4") {
      setUnitDropListValue([
        "Unit",
        'Section 1',
        "Section 2",
        "Section 3",
        "Section 4",
      ]);
      // setUnitsDropList("Section 1");
    } else if (value == "PP") {
      setUnitDropListValue(["Unit", "PP1", "PP2", "PP3", "Utilities"]);
      //  setUnitsDropList("PP1");
    } else if (value == "TP/PP") {
      setUnitDropListValue(["Unit"]);
      setUnitsDropList("Unit");
      setYearDropDownValue("Year");
      setMonthDropDownValue("Month");
    }
  }

  List<String> _ConsumptionDropList = [
    "Consumption",
  ].obs;

  setBPDropListValue(List<String> value) {
    _ConsumptionDropList.clear();
    setConsumptionDropValue(value[0]);
    _ConsumptionDropList.assignAll(value);
  }

  setUnitsDropList(String? val) {
    if (val == "I") {
      setBPDropListValue(
          ["Consumption", "Back process Unit 1", "Spinning /winding unit 1"]);
      // setYearDropDownValue("2021");
    } else if (val == "II") {
      setBPDropListValue([
        "Consumption",
        "Back process Unit 2\r\n",
        "Spinning/winding unit 2"
      ]);
    } else if (val == "Section 1") {
      setBPDropListValue([
        "Consumption",
        "Back process 25k",
        "Spinning /winding 25k",
      ]);
      //  setYearDropDownValue("2021");
    } else if (val == "Section 2") {
      setBPDropListValue([
        "Consumption",
        "Back process 25k",
        "Spinning /winding 25k",
      ]);
    } else if (val == "Section 3") {
      setBPDropListValue([
        "Consumption",
        "Back process 25k",
        "Spinning /winding 25k",
      ]);
    } else if (val == "Section 4") {
      setBPDropListValue([
        "Consumption",
        "Back process 25k",
        "Spinning /winding 25k",
      ]);
    } else if (val == "PP1") {
      setBPDropListValue([
        "Consumption",
        "polymer/spinning",
        "Draw lines",
      ]);
      //    setYearDropDownValue("2021");
    } else if (val == "PP2") {
      setBPDropListValue([
        "Consumption",
        "polymer/spinning",
        "Draw Lines",
      ]);
    } else if (val == "PP3") {
      setBPDropListValue([
        "Consumption",
        "polymer/spinning",
        "Draw lines",
      ]);
    } else if (val == "Utilities") {
      setBPDropListValue(["Consumption", "PP1 ,PP2 ,PP3\r\n"]);
    } else if (val == "Unit") {
      setBPDropListValue(["Consumption"]);
      // setYearDropDownValue("Year");
    }
  }

  setYearDropDownValue(String? val) {
    _yearDropDown.value = val!;
  }

  setMonthDropDownValue(String? val) {
    _monthDropDown.value = val!;
  }

  setDayDropDownValue(String? val) {
    _dayDropDown.value = val!;
  }

  setTPDropDownValue(String? val) {
    _TPdropdown.value = val!;
  }

  setUnitDropDownValue(String? val) {
    log('$val');
    _unitdropdown.value = val!;
  }

  setConsumptionDropValue(String? val) {
    _consumptionDropDown.value = val!;
  }

  List<String> _TPDropDownList =
      ["TP/PP", "TP1", "TP2", "TP3", "TP4", "PP"].obs;

  List<String> _UnitDropDownList = ["Unit"].obs;

  setUnitDropListValue(List<String> val) {
    _UnitDropDownList.clear();
    setUnitDropDownValue(val[0]);

    _UnitDropDownList.assignAll(val);
    log('$_UnitDropDownList');
  }

  List<String> _yearDropList = [
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

  List<String> _monthDropList = [
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

  List<String> _dayDropList = [
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

  List<String> get yearDropList => _yearDropList;

  List<String> get monthDropList => _monthDropList;

  List<String> get dayDropList => _dayDropList;

  List<String> get TPDropDownList => _TPDropDownList;

  List<String> get UnitDropDownList => _UnitDropDownList;

  List<String> get ConsumptionDropList => _ConsumptionDropList;
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
