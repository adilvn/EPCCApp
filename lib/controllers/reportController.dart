import 'package:epcc/Models/data_modal.dart';
import 'package:epcc/Models/reportmodel.dart';
import 'package:epcc/main.dart';
import 'package:get/get.dart';

class ReportController extends GetxController {
  var allReportsData = <Data>[].obs;

  var _dataList = <ReportModel>[].obs;
  var _bpdropdown1 = "-".obs;

  var _bpdropdown2 = "-".obs;
  var _bpdropdown3 = "-".obs;
  var _TPdropdown = "-".obs;

  var _unitdropdown = "-".obs;
  var _bpdropdown = "-".obs;
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

  @override
  void onInit() {
    super.onInit();
  }

  addDataList() {
    if (YearValue == "-" &&
        MonthValue == "-" &&
        DayValue == "-" &&
        TPDropValue == "-" &&
        UnitDropValue == "-" &&
        BPDropValue == "-") {
      setValueBool(false);
      dataList.clear();
      var month = "";
      double consumptionValue = 0;
      double lastYearConsumptionValue = 0;
      for (var i = 0; i < 10; i++) {
        month = allReportsData[i].cONSUMPTIONDATE!.toString();
        consumptionValue =
            double.parse(allReportsData[i].cONSUMPTIONVALUE.toString());
        double difference = consumptionValue - lastYearConsumptionValue;
        setDataList(month, consumptionValue.toString(),
            lastYearConsumptionValue.toString(), difference.toString());
      }
    }
    //TODO reports All  Value
    else if (YearValue != "-" &&
        MonthValue != "-" &&
        DayValue != "-" &&
        TPDropValue != "-" &&
        UnitDropValue != "-" &&
        BPDropValue != "-") {
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
    else if (YearValue != "-" &&
        MonthValue == "-" &&
        DayValue == "-" &&
        TPDropValue != "-" &&
        UnitDropValue != "-" &&
        BPDropValue != "-") {
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
    } else if (YearValue != "-" &&
        MonthValue != "-" &&
        DayValue == "-" &&
        TPDropValue != "-" &&
        UnitDropValue != "-" &&
        BPDropValue != "-") {
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
    } else if (YearValue == "-" &&
        MonthValue == "-" &&
        DayValue == "-" &&
        TPDropValue != "-" &&
        UnitDropValue != "-" &&
        BPDropValue != "-") {
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
    } else if (YearValue != "-" ||
        MonthValue != "-" ||
        DayValue != "-" ||
        TPDropValue == "-" && UnitDropValue == "-" && BPDropValue == "-") {
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
    } else if (value == "-") {
      setDrop2Value(["-"]);
      setUnitsDropList("-");
    }
  }

  List<String> _BPDropList = [
    "-",
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

  List<String> _TPDropList = ["-", "TP1", "TP2", "TP3", "TP4", "PP"].obs;

  List<String> _UnitDropList = ["-"].obs;

  setDrop2Value(List<String> val) {
    _UnitDropList.clear();
    setUnitDropValue(val[0]);

    _UnitDropList.assignAll(val);
    print(_UnitDropList);
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
