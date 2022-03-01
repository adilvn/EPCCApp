import 'package:epcc/Authentication/ApiService.dart';
import 'package:epcc/Models/consumptionModel.dart';
import 'package:epcc/Models/data_modal.dart';
import 'package:epcc/Models/unitdatamodel.dart';
import 'package:epcc/controllers/dailyUnitController.dart';
import 'package:epcc/controllers/reportController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DailyController extends GetxController with StateMixin<List<List<dynamic>>> {
  List<Color> colors = [Color(0xffFF6F00), Color(0xff7C4DFF), Color(0xff2196F3), Color(0xffFF4040), Color(0xffFFA640)];
  var response = true.obs;
  setResponse(bool val) {
    response.value = val;
  }

  double _totalKWh = 0;
  double get totalKwh => _totalKWh;
  setTotal(double t1, double t2, double t3, double t4, double pp) {
    _totalKWh = t1 + t2 + t3 + t4 + pp;
  }

  double _t1 = 0;
  double _t2 = 0;
  double _t3 = 0;
  double _t4 = 0;
  double _pp = 0;
  double get t1 => _t1;
  double get t2 => _t2;
  double get t3 => _t3;
  double get t4 => _t4;
  double get pp => _pp;

  setTotalTP1(double i) {
    _t1 = _t1 + i;
  }

  setTotalTP2(double i) {
    _t2 = _t2 + i;
  }

  setTotalTP3(double i) {
    _t3 = _t3 + i;
  }

  setTotalTP4(double i) {
    _t4 = _t4 + i;
  }

  setTotalPP(double i) {
    _pp = _pp + i;
  }

  List<Data> _TP1 = [];
  List<Data> get TP1 => _TP1;
  setTP1(var value) {
    _TP1.add(value);
  }

  List<Data> _TP2 = [];
  List<Data> get TP2 => _TP2;
  setTP2(var value) {
    _TP2.add(value);
  }

  List<Data> _TP3 = [];
  List<Data> get TP3 => _TP3;
  setTP3(var value) {
    _TP3.add(value);
  }

  List<Data> _TP4 = [];
  List<Data> get TP4 => _TP4;
  setTP4(var value) {
    _TP4.add(value);
  }

  List<Data> _PP = [];
  List<Data> get PP => _PP;
  setPP(var value) {
    _PP.add(value);
  }

// TODO Unit Calculation

  List<UNITDATAMODEL> _TP1UNIT1DATA = [];
  List<UNITDATAMODEL> get TP1UNIT1DATA => _TP1UNIT1DATA;
  setTp1Unit1Data(var value) {
    _TP1UNIT1DATA.add(value);
  }

  List<UNITDATAMODEL> _TP1UNIT2DATA = [];
  List<UNITDATAMODEL> get TP1UNIT2DATA => _TP1UNIT2DATA;
  setTp1Unit2Data(var value) {
    _TP1UNIT2DATA.add(value);
  }

  List<UNITDATAMODEL> _TP2UNIT1DATA = [];
  List<UNITDATAMODEL> get TP2UNIT1DATA => _TP2UNIT1DATA;
  setTp2Unit1Data(var value) {
    _TP2UNIT1DATA.add(value);
  }

  List<UNITDATAMODEL> _TP2UNIT2DATA = [];
  List<UNITDATAMODEL> get TP2UNIT2DATA => _TP2UNIT2DATA;
  setTp2Unit2Data(var value) {
    _TP2UNIT2DATA.add(value);
  }

  List<UNITDATAMODEL> _TP3UNIT1DATA = [];
  List<UNITDATAMODEL> get TP3UNIT1DATA => _TP3UNIT1DATA;
  setTp3Unit1Data(var value) {
    _TP3UNIT1DATA.add(value);
  }

  List<UNITDATAMODEL> _TP3UNIT2DATA = [];
  List<UNITDATAMODEL> get TP3UNIT2DATA => _TP3UNIT2DATA;
  setTp3Unit2Data(var value) {
    _TP3UNIT2DATA.add(value);
  }

  List<UNITDATAMODEL> _TP4SECTION1DATA = [];
  List<UNITDATAMODEL> get TP4SECTION1DATA => _TP4SECTION1DATA;
  setTP4Sec1(var value) {
    _TP4SECTION1DATA.add(value);
  }

  List<UNITDATAMODEL> _TP4SECTION2DATA = [];
  List<UNITDATAMODEL> get TP4SECTION2DATA => _TP4SECTION2DATA;
  setTP4Sec2(var value) {
    _TP4SECTION2DATA.add(value);
  }

  List<UNITDATAMODEL> _TP4SECTION3DATA = [];
  List<UNITDATAMODEL> get TP4SECTION3DATA => _TP4SECTION3DATA;
  setTP4Sec3(var value) {
    _TP4SECTION3DATA.add(value);
  }

  List<UNITDATAMODEL> _TP4SECTION4DATA = [];
  List<UNITDATAMODEL> get TP4SECTION4DATA => _TP4SECTION4DATA;
  setTP4Sec4(var value) {
    _TP4SECTION4DATA.add(value);
  }

  List<UNITDATAMODEL> _PP1DATA = [];
  List<UNITDATAMODEL> get PP1DATA => _PP1DATA;
  setPP1(var value) {
    _PP1DATA.add(value);
  }

  List<UNITDATAMODEL> _PP2DATA = [];
  List<UNITDATAMODEL> get PP2DATA => _PP2DATA;
  setPP2(var value) {
    _PP2DATA.add(value);
  }

  List<UNITDATAMODEL> _PP3DATA = [];
  List<UNITDATAMODEL> get PP3DATA => _PP3DATA;
  setPP3(var value) {
    _PP3DATA.add(value);
  }

  List<UNITDATAMODEL> _UTILITIESDATA = [];
  List<UNITDATAMODEL> get UTILITIESDATA => _UTILITIESDATA;
  setUtilities(var value) {
    _UTILITIESDATA.add(value);
  }

  List<ConsumptionModel> _TP1UnitOne = [];
  List<ConsumptionModel> get TP1UnitOneDetails => _TP1UnitOne;
  setTP1UnitOne(ConsumptionModel value) {
    _TP1UnitOne.add(value);
  }

  List<ConsumptionModel> _TP1UnitTwo = [];
  List<ConsumptionModel> get TP1UnitTwoDetails => _TP1UnitTwo;
  setTp1UnitTwo(ConsumptionModel value) {
    _TP1UnitTwo.add(value);
  }

  List<ConsumptionModel> _TP2UnitOne = [];
  List<ConsumptionModel> get TP2UnitOneDetails => _TP2UnitOne;
  setTP2UnitOne(ConsumptionModel value) {
    _TP2UnitOne.add(value);
  }

  List<ConsumptionModel> _TP2UnitTwo = [];
  List<ConsumptionModel> get TP2UnitTwoDetails => _TP2UnitTwo;
  setTp2UnitTwo(ConsumptionModel value) {
    _TP2UnitTwo.add(value);
  }

  List<ConsumptionModel> _TP3UnitOne = [];
  List<ConsumptionModel> get TP3UnitOneDetails => _TP3UnitOne;
  setTP3UnitOne(ConsumptionModel value) {
    _TP3UnitOne.add(value);
  }

  List<ConsumptionModel> _TP3UnitTwo = [];
  List<ConsumptionModel> get TP3UnitTwoDetails => _TP3UnitTwo;
  setTp3UnitTwo(ConsumptionModel value) {
    _TP3UnitTwo.add(value);
  }

//Sections

  List<ConsumptionModel> _TP4SOne = [];
  List<ConsumptionModel> get TP4SOneDetails => _TP4SOne;
  setTP4SOne(ConsumptionModel value) {
    _TP4SOne.add(value);
  }

  List<ConsumptionModel> _TP4STwo = [];
  List<ConsumptionModel> get TP4STwoDetails => _TP4STwo;
  setTP4STwo(ConsumptionModel value) {
    _TP4STwo.add(value);
  }

  List<ConsumptionModel> _TP4SThree = [];
  List<ConsumptionModel> get TP4SThreeDetails => _TP4SThree;
  setTP4SThree(ConsumptionModel value) {
    _TP4SThree.add(value);
  }

  List<ConsumptionModel> _TP4SFour = [];
  List<ConsumptionModel> get TP4SFourDetails => _TP4SFour;
  setTP4SFour(ConsumptionModel value) {
    _TP4SFour.add(value);
  }

//PP

  List<ConsumptionModel> _PPOne = [];
  List<ConsumptionModel> get PPOneDetails => _PPOne;
  setPPOne(ConsumptionModel value) {
    _PPOne.add(value);
  }

  List<ConsumptionModel> _PPTwo = [];
  List<ConsumptionModel> get PPTwoDetails => _PPTwo;
  setPPTwo(ConsumptionModel value) {
    _PPTwo.add(value);
  }

  List<ConsumptionModel> _PPThree = [];
  List<ConsumptionModel> get PPThreeDetails => _PPThree;
  setPPThree(ConsumptionModel value) {
    _PPThree.add(value);
  }

  List<ConsumptionModel> _Utilities = [];
  List<ConsumptionModel> get UtilitiesDetails => _Utilities;
  setUtilitie(ConsumptionModel value) {
    _Utilities.add(value);
  }

// initialize
  @override
  void onInit() {
    Get.lazyPut(() => DailyUnitsController());
    Get.lazyPut(() => ReportController());
    apiCall();
    super.onInit();
  }

//TODO separate UNITs calculate

  var _TP1U1List = <double>[].obs;
  List<double> get TP1U1List => _TP1U1List;
  setTP1U1List(double val) {
    _TP1U1List.add(val);
  }

  var _TP1U2List = <double>[].obs;
  List<double> get TP1U2List => _TP1U2List;
  setTP1U2List(double val) {
    _TP1U2List.add(val);
  }

  var _TP2U1List = <double>[].obs;
  List<double> get TP2U1List => _TP2U1List;
  setTP2U1List(double val) {
    _TP2U1List.add(val);
  }

  var _TP2U2List = <double>[].obs;
  List<double> get TP2U2List => _TP2U2List;
  setTP2U2List(double val) {
    _TP2U2List.add(val);
  }

  var _TP3U1List = <double>[].obs;
  List<double> get TP3U1List => _TP3U1List;
  setTP3U1List(double val) {
    _TP3U1List.add(val);
  }

  var _TP3U2List = <double>[].obs;
  List<double> get TP3U2List => _TP3U2List;
  setTP3U2List(double val) {
    _TP3U2List.add(val);
  }

  var _TP4S1List = <double>[].obs;
  List<double> get TP4S1List => _TP4S1List;
  setTP4S1List(double val) {
    _TP4S1List.add(val);
  }

  var _TP4S2List = <double>[].obs;
  List<double> get TP4S2List => _TP4S2List;
  setTP4S2List(double val) {
    _TP4S2List.add(val);
  }

  var _TP4S3List = <double>[].obs;
  List<double> get TP4S3List => _TP4S3List;
  setTP4S3List(double val) {
    _TP4S3List.add(val);
  }

  var _TP4S4List = <double>[].obs;
  List<double> get TP4S4List => _TP4S4List;
  setTP4S4List(double val) {
    _TP4S4List.add(val);
  }

  var _PP1List = <double>[].obs;
  List<double> get PP1List => _PP1List;
  setPP1List(double val) {
    _PP1List.add(val);
  }

  var _PP2List = <double>[].obs;
  List<double> get PP2List => _PP2List;
  setPP2List(double val) {
    _PP2List.add(val);
  }

  var _PP3List = <double>[].obs;
  List<double> get PP3List => _PP3List;
  setPP3List(double val) {
    _PP3List.add(val);
  }

  var _UTILITIESList = <double>[].obs;
  List<double> get UTILITIESList => _UTILITIESList;
  setUTILITIESList(double val) {
    _UTILITIESList.add(val);
  }

  ///TODO TP list
  var _TP1List = <double>[].obs;
  List<double> get TP1List => _TP1List;
  setTP1List(double val) {
    _TP1List.add(val);
  }

  var _TP2List = <double>[].obs;
  List<double> get TP2List => _TP2List;
  setTP2List(double val) {
    _TP2List.add(val);
  }

  var _TP3List = <double>[].obs;
  List<double> get TP3List => _TP3List;
  setTP3List(double val) {
    _TP3List.add(val);
  }

  var _TP4List = <double>[].obs;
  List<double> get TP4List => _TP4List;
  setTP4List(double val) {
    _TP4List.add(val);
  }

  var _PPList = <double>[].obs;
  List<double> get PPList => _PPList;
  setPPList(double val) {
    _PPList.add(val);
  }

  double _TP1_UNIT1_DATA_SUM = 0;
  double _TP1_UNIT2_DATA_SUM = 0;
  double _TP2_UNIT1_DATA_SUM = 0;
  double _TP2_UNIT2_DATA_SUM = 0;
  double _TP3_UNIT1_DATA_SUM = 0;
  double _TP3_UNIT2_DATA_SUM = 0;
  double _TP4_SECTION1_DATA_SUM = 0;
  double _TP4_SECTION2_DATA_SUM = 0;
  double _TP4_SECTION3_DATA_SUM = 0;
  double _TP4_SECTION4_DATA_SUM = 0;
  double _PP_PP1_DATA_SUM = 0;
  double _PP_PP2_DATA_SUM = 0;
  double _PP_PP3_DATA_SUM = 0;
  double _PP_UTILITIES_DATA_SUM = 0;

//TODO UnitS Sum
  double get TP1_UNIT1_DATA_SUM => _TP1_UNIT1_DATA_SUM;
  double get TP1_UNIT2_DATA_SUM => _TP1_UNIT2_DATA_SUM;
  double get TP2_UNIT1_DATA_SUM => _TP2_UNIT1_DATA_SUM;
  double get TP2_UNIT2_DATA_SUM => _TP2_UNIT2_DATA_SUM;
  double get TP3_UNIT1_DATA_SUM => _TP3_UNIT1_DATA_SUM;
  double get TP3_UNIT2_DATA_SUM => _TP3_UNIT2_DATA_SUM;
  double get TP4_SECTION1_DATA_SUM => _TP4_SECTION1_DATA_SUM;
  double get TP4_SECTION2_DATA_SUM => _TP4_SECTION2_DATA_SUM;
  double get TP4_SECTION3_DATA_SUM => _TP4_SECTION3_DATA_SUM;
  double get TP4_SECTION4_DATA_SUM => _TP4_SECTION4_DATA_SUM;
  double get PP_PP1_DATA_SUM => _PP_PP1_DATA_SUM;
  double get PP_PP2_DATA_SUM => _PP_PP2_DATA_SUM;
  double get PP_PP3_DATA_SUM => _PP_PP3_DATA_SUM;
  double get PP_UTILITIES_DATA_SUM => _PP_UTILITIES_DATA_SUM;

  ///----------------------------------------------------------///
  setTotalTP1Unit1DataSum(double i) {
    //sets the total sum of the whole day for the text plant 1 unit 1
    _TP1_UNIT1_DATA_SUM = _TP1_UNIT1_DATA_SUM + i;
  }

  setTotalTP1Unit2DataSum(double i) {
    //sets the total sum of the whole day for the text plant 1 unit 2
    _TP1_UNIT2_DATA_SUM = _TP1_UNIT2_DATA_SUM + i;
  }

  setTotalTP2Unit1DataSum(double i) {
    //sets the total sum of the whole day for the text plant 2 unit 1

    _TP2_UNIT1_DATA_SUM = _TP2_UNIT1_DATA_SUM + i;
  }

  setTotalTP2Unit2DataSum(double i) {
    //sets the total sum of the whole day for the text plant 2 unit 2
    _TP2_UNIT2_DATA_SUM = _TP2_UNIT2_DATA_SUM + i;
  }

  setTotalTP3Unit1DataSum(double i) {
    //sets the total sum of the whole day for the text plant 3 unit 1

    _TP3_UNIT1_DATA_SUM = _TP3_UNIT1_DATA_SUM + i;
  }

  setTotalTP3Unit2DataSum(double i) {
    //sets the total sum of the whole day for the text plant 3 unit 2
    _TP3_UNIT2_DATA_SUM = _TP3_UNIT2_DATA_SUM + i;
  }

  setTotalTP4Section1DataSum(double i) {
    //sets the total sum of the whole day for the textile plant 4 section 1

    _TP4_SECTION1_DATA_SUM = _TP4_SECTION1_DATA_SUM + i;
  }

  setTotalTP4Section2DataSum(double i) {
    //sets the total sum of the whole day for the textile plant 4 section 2
    _TP4_SECTION2_DATA_SUM = _TP4_SECTION2_DATA_SUM + i;
  }

  setTotalTP4Section3DataSum(double i) {
    //sets the total sum of the whole day for the textile plant 4 section 3
    _TP4_SECTION3_DATA_SUM = _TP4_SECTION3_DATA_SUM + i;
  }

  setTotalTP4Section4DataSum(double i) {
    //sets the total sum of the whole day for the textile plant 4 section 2
    _TP4_SECTION4_DATA_SUM = _TP4_SECTION4_DATA_SUM + i;
  }

  setTotalPPP1UnitDataSum(double i) {
    _PP_PP1_DATA_SUM = _PP_PP1_DATA_SUM + i;
  }

  setTotalPP2UnitDataSum(double i) {
    _PP_PP2_DATA_SUM = _PP_PP2_DATA_SUM + i;
  }

  setTotalPP3UnitDataSum(double i) {
    _PP_PP3_DATA_SUM = _PP_PP3_DATA_SUM + i;
  }

  setTotalPPUTILITIESUnitDataSum(double i) {
    _PP_UTILITIES_DATA_SUM = _PP_UTILITIES_DATA_SUM + i;
  }

  ///----------------------------------------------------------///
  //
  // setTotalTP1UnitDataSum(double i) {
  //   _TP1_UNIT1_DATA_SUM = _TP1_UNIT1_DATA_SUM + i;
  // }

  String _latestDate = '';
  String get latestDate => _latestDate;
  var TP1Date = null;
  var TP2Date = null;
  var TP3Date = null;
  var TP4Date = null;
  var PPDate = null;

  int a = 0;
  int b = 0;
  int c = 0;
  int d = 0;
  int e = 0;

//  final reportData = Get.find<ReportController>();
  apiCall() {
    ApiService().fetchDetails().then((data) {
      if (data[0] == "success") {
        for (var i = 0; i < data[1].length; i++) {
          Data _data = Data.fromJson(data[1][i]);
          _latestDate = data[1][0]['CONSUMPTION_DATE'];
          //Get.find<ReportController>().allReportsData.add(_data);

          if (data[1][i]["0"] == "TP1") {
            Data _data = Data.fromJson(data[1][i]);
            if (TP1Date == null) {
              TP1Date = _data.cONSUMPTIONDATE;
              print("This is TP1 date" + TP1Date);
            }
            if (TP1Date == data[1][i]['CONSUMPTION_DATE']) {
              if (_data.nAME == "I" || _data.nAME == "II") {
                if (a < 4) {
                  if (_data.nAME == "I") {
                    setTP1U1List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                    setTotalTP1Unit1DataSum(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                    setTP1UnitOne(ConsumptionModel(
                        consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                        consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                        centerName: data[1][i]["NAME_1"]));

                    print("TP1_UNIT1_DATA_SUM:  $TP1_UNIT1_DATA_SUM");

                    a++;
                  } else if (_data.nAME == "II") {
                    setTP1U2List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                    setTotalTP1Unit2DataSum(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                    // _TP1_UNIT2_DATA_SUM = _TP1_UNIT2_DATA_SUM +
                    //     double.parse(data[1][i]["CONSUMPTION_VALUE"]);
                    setTp1UnitTwo(ConsumptionModel(
                        consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                        consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                        centerName: data[1][i]["NAME_1"]));
                    a++;
                  } else if (_data.nAME == "Section 1") {}
                }
                if (a == 4) {
                  setTp1Unit1Data(UNITDATAMODEL(
                      consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                      unitName: "Unit 1",
                      consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                      totalValue: _TP1_UNIT1_DATA_SUM));
                  setTp1Unit2Data(UNITDATAMODEL(
                      consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                      unitName: "Unit 2",
                      consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                      totalValue: _TP1_UNIT2_DATA_SUM));

                  // _TP1_UNIT1_DATA_SUM = 0;
                  // _TP1_UNIT2_DATA_SUM = 0;
                  a = 0;
                }
                setTP1List(double.parse(_data.cONSUMPTIONVALUE!));
                setTotalTP1(double.parse(_data.cONSUMPTIONVALUE!));
                setTP1(_data);
              } else {
                print("helo");
              }
            }
          } else if (data[1][i]["0"] == "TP2") {
            Data _data = Data.fromJson(data[1][i]);

            if (TP2Date == null) {
              TP2Date = _data.cONSUMPTIONDATE;
              print("This is TP2 date" + TP2Date);
            }

            if (TP2Date == data[1][i]['CONSUMPTION_DATE']) {
              if (b < 4) {
                if (_data.nAME == "I") {
                  setTP2U1List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                  // _TP2_UNIT1_DATA_SUM = _TP2_UNIT1_DATA_SUM +
                  //     double.parse(data[1][i]["CONSUMPTION_VALUE"]);

                  setTotalTP2Unit1DataSum(double.parse(data[1][i]["CONSUMPTION_VALUE"]));

                  setTP2UnitOne(ConsumptionModel(
                      consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                      consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                      centerName: data[1][i]["NAME_1"]));
                  b++;
                } else if (_data.nAME == "II") {
                  setTP2U2List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                  // _TP2_UNIT2_DATA_SUM = _TP2_UNIT2_DATA_SUM +
                  //     double.parse(data[1][i]["CONSUMPTION_VALUE"]);
                  setTotalTP2Unit2DataSum(double.parse(data[1][i]["CONSUMPTION_VALUE"]));

                  setTp2UnitTwo(ConsumptionModel(
                      consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                      consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                      centerName: data[1][i]["NAME_1"]));
                  b++;
                }
              }
              if (b == 4) {
                setTp2Unit1Data(UNITDATAMODEL(
                    consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                    unitName: "Unit 1",
                    consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                    totalValue: _TP2_UNIT1_DATA_SUM));
                setTp2Unit2Data(UNITDATAMODEL(
                    consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                    unitName: "Unit 2",
                    consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                    totalValue: _TP2_UNIT2_DATA_SUM));

                // _TP2_UNIT1_DATA_SUM = 0;
                // _TP2_UNIT2_DATA_SUM = 0;
                b = 0;
              }
              setTP2List(double.parse(_data.cONSUMPTIONVALUE!));
              setTotalTP2(double.parse(_data.cONSUMPTIONVALUE!));
              setTP2(_data);
            }
          } else if (data[1][i]["0"] == "TP3") {
            Data _data = Data.fromJson(data[1][i]);
            if (TP3Date == null) {
              TP3Date = _data.cONSUMPTIONDATE;
              print("This is TP3 date" + TP3Date);
            }
            if (TP3Date == data[1][i]['CONSUMPTION_DATE']) {
              if (c < 4) {
                if (_data.nAME == "I") {
                  setTP3U1List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                  // _TP3_UNIT1_DATA_SUM = _TP3_UNIT1_DATA_SUM +
                  //     double.parse(data[1][i]["CONSUMPTION_VALUE"]);
                  setTotalTP3Unit1DataSum(double.parse(data[1][i]["CONSUMPTION_VALUE"]));

                  setTP3UnitOne(ConsumptionModel(
                      consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                      consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                      centerName: data[1][i]["NAME_1"]));
                  c++;
                } else if (_data.nAME == "II") {
                  setTP3U2List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                  // _TP3_UNIT2_DATA_SUM = _TP3_UNIT2_DATA_SUM +
                  //     double.parse(data[1][i]["CONSUMPTION_VALUE"]);
                  setTotalTP3Unit2DataSum(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                  setTp3UnitTwo(ConsumptionModel(
                      consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                      consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                      centerName: data[1][i]["NAME_1"]));
                  c++;
                }
              }
              if (c == 4) {
                setTp3Unit1Data(UNITDATAMODEL(
                    consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                    unitName: "Unit 1",
                    consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                    totalValue: _TP3_UNIT1_DATA_SUM));
                setTp3Unit2Data(UNITDATAMODEL(
                    consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                    unitName: "Unit 2",
                    consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                    totalValue: _TP3_UNIT2_DATA_SUM));

                // _TP3_UNIT1_DATA_SUM = 0;
                // _TP3_UNIT2_DATA_SUM = 0;
                c = 0;
              }
              setTP3List(double.parse(_data.cONSUMPTIONVALUE!));
              setTotalTP3(double.parse(_data.cONSUMPTIONVALUE!));
              setTP3(_data);
            }
          } else if (data[1][i]["0"] == "TP4") {
            Data _data = Data.fromJson(data[1][i]);
            if (TP4Date == null) {
              TP4Date = _data.cONSUMPTIONDATE;
              print("This is TP4 date" + TP4Date);
            }
            if (TP4Date == data[1][i]['CONSUMPTION_DATE']) {
              if (d < 8) {
                if (_data.nAME == "Section 1") {
                  setTP4S1List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                  // _TP4_SECTION1_DATA_SUM = _TP4_SECTION1_DATA_SUM +
                  //     double.parse(data[1][i]["CONSUMPTION_VALUE"]);

                  setTotalTP4Section1DataSum(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                  setTP4SOne(ConsumptionModel(
                      consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                      consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                      centerName: data[1][i]["NAME_1"]));

                  d++;
                } else if (_data.nAME == "Section 2") {
                  setTP4S2List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                  // _TP4_SECTION2_DATA_SUM = _TP4_SECTION2_DATA_SUM +
                  //     double.parse(data[1][i]["CONSUMPTION_VALUE"]);

                  setTotalTP4Section2DataSum(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                  setTP4STwo(ConsumptionModel(
                      consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                      consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                      centerName: data[1][i]["NAME_1"]));

                  d++;
                } else if (_data.nAME == "Section 3") {
                  setTP4S3List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                  // _TP4_SECTION3_DATA_SUM = _TP4_SECTION3_DATA_SUM +
                  //     double.parse(data[1][i]["CONSUMPTION_VALUE"]);

                  setTotalTP4Section3DataSum(double.parse(data[1][i]["CONSUMPTION_VALUE"]));

                  setTP4SThree(ConsumptionModel(
                      consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                      consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                      centerName: data[1][i]["NAME_1"]));

                  d++;
                } else if (_data.nAME == "Section 4") {
                  setTP4S4List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                  // _TP4_SECTION4_DATA_SUM = _TP4_SECTION4_DATA_SUM +
                  //     double.parse(data[1][i]["CONSUMPTION_VALUE"]);
                  setTotalTP4Section4DataSum(double.parse(data[1][i]["CONSUMPTION_VALUE"]));

                  setTP4SFour(ConsumptionModel(
                      consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                      consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                      centerName: data[1][i]["NAME_1"]));

                  d++;
                }
              }

              if (d == 8) {
                setTP4Sec1(UNITDATAMODEL(
                    consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                    unitName: "Section 1",
                    consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                    totalValue: _TP4_SECTION1_DATA_SUM));
                setTP4Sec2(UNITDATAMODEL(
                    consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                    unitName: "Section 2",
                    consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                    totalValue: _TP4_SECTION2_DATA_SUM));
                setTP4Sec3(UNITDATAMODEL(
                    consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                    unitName: "Section 3",
                    consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                    totalValue: _TP4_SECTION3_DATA_SUM));
                setTP4Sec4(UNITDATAMODEL(
                    consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                    unitName: "Section 4",
                    consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                    totalValue: _TP4_SECTION4_DATA_SUM));
                //
                // _TP4_SECTION1_DATA_SUM = 0;
                // _TP4_SECTION2_DATA_SUM = 0;
                // _TP4_SECTION3_DATA_SUM = 0;
                // _TP4_SECTION4_DATA_SUM = 0;

                d = 0;
              }
              setTP4List(double.parse(_data.cONSUMPTIONVALUE!));
              setTotalTP4(double.parse(_data.cONSUMPTIONVALUE!));
              setTP4(_data);
            }
          } else if (data[1][i]["0"] == "PP") {
            Data _data = Data.fromJson(data[1][i]);
            if (PPDate == null) {
              PPDate = _data.cONSUMPTIONDATE;
              print("This is PP date" + PPDate);
            }
            if (PPDate == data[1][i]['CONSUMPTION_DATE']) {
              if (e < 7) {
                if (_data.nAME == "PP1") {
                  setPP1List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                  // _PP_PP1_DATA_SUM = _PP_PP1_DATA_SUM +
                  //     double.parse(data[1][i]["CONSUMPTION_VALUE"]);
                  setTotalPPP1UnitDataSum(double.parse(data[1][i]["CONSUMPTION_VALUE"]));

                  setPPOne(ConsumptionModel(
                      consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                      consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                      centerName: data[1][i]["NAME_1"]));

                  e++;
                } else if (_data.nAME == "PP2") {
                  setPP2List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                  // _PP_PP2_DATA_SUM = _PP_PP2_DATA_SUM +
                  //     double.parse(data[1][i]["CONSUMPTION_VALUE"]);

                  setTotalPP2UnitDataSum(double.parse(data[1][i]["CONSUMPTION_VALUE"]));

                  setPPTwo(ConsumptionModel(
                      consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                      consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                      centerName: data[1][i]["NAME_1"]));

                  e++;
                } else if (_data.nAME == "PP3") {
                  setPP3List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                  // _PP_PP3_DATA_SUM = _PP_PP3_DATA_SUM +
                  //     double.parse(data[1][i]["CONSUMPTION_VALUE"]);
                  setTotalPP3UnitDataSum(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                  setPPThree(ConsumptionModel(
                      consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                      consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                      centerName: data[1][i]["NAME_1"]));

                  e++;
                } else if (_data.nAME == "Utilities") {
                  setUTILITIESList(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                  // _PP_UTILITIES_DATA_SUM = _PP_UTILITIES_DATA_SUM +
                  //     double.parse(data[1][i]["CONSUMPTION_VALUE"]);
                  setTotalPPUTILITIESUnitDataSum(double.parse(data[1][i]["CONSUMPTION_VALUE"]));

                  setUtilitie(ConsumptionModel(
                      consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                      consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                      centerName: data[1][i]["NAME_1"]));

                  e++;
                }
              }

              if (e == 7) {
                setPP1(UNITDATAMODEL(
                    consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                    unitName: "PP 1",
                    consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                    totalValue: _PP_PP1_DATA_SUM));
                setPP2(UNITDATAMODEL(
                    consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                    unitName: "PP 2",
                    consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                    totalValue: _PP_PP2_DATA_SUM));
                setPP3(UNITDATAMODEL(
                    consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                    unitName: "PP 3",
                    consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                    totalValue: _PP_PP3_DATA_SUM));
                setUtilities(UNITDATAMODEL(
                    consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                    unitName: "Utilities",
                    consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                    totalValue: _PP_UTILITIES_DATA_SUM));
                //    print("Print Utilities Data " + _UTILITIESDATA[i].toString());
                // _PP_PP1_DATA_SUM = 0;
                // _PP_PP2_DATA_SUM = 0;
                // _PP_PP3_DATA_SUM = 0;
                // _PP_UTILITIES_DATA_SUM = 0;

                e = 0;
              }
              //     print("These are my Utilities" + _UTILITIESList[i].toString());
              setPPList(double.parse(_data.cONSUMPTIONVALUE!));
              setTotalPP(double.parse(_data.cONSUMPTIONVALUE!));
              setPP(_data);
            }
          }
        }
      } else {
        // Get.rawSnackbar(
        //     duration: Duration(
        //       seconds: 3,
        //     ),
        //     messageText: Text(
        //       "Access Failed",
        //       style: TextStyle(color: Colors.white),
        //     ),
        //     backgroundColor: Colors.black54,
        //     icon: Icon(
        //       Icons.error,
        //       size: 18,
        //       color: Colors.white,
        //     ));
      }

      setTotal(t1, t2, t3, t4, pp);
      print("TP2 + $t2");
      change(value, status: RxStatus.success());
    }, onError: (err) {
      change(err, status: RxStatus.error());
    });
  }
}
