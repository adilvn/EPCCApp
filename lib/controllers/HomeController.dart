import 'package:epcc/Authentication/ApiService.dart';
import 'package:epcc/Models/consumptionModel.dart';
import 'package:epcc/Models/data_modal.dart';
import 'package:epcc/Models/unitdatamodel.dart';
import 'package:epcc/controllers/reportController.dart';
import 'package:epcc/controllers/unitsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<List<List<dynamic>>> {
  List<Color> colors = [Color(0xffFF6F00), Color(0xff7C4DFF), Color(0xff2196F3), Color(0xffFF4040), Color(0xffFFA640)];
  var response = true.obs;
  setResponse(bool val) {
    response.value = val;
  }

  double _totalKWh = 0;
  double _dailyKwh = 0;
  double get dailyKwh => _dailyKwh;

  double get totalKwh => _totalKWh;
  setTotal(double t1, double t2, double t3, double t4, double pp) {
    _totalKWh = t1 + t2 + t3 + t4 + pp;
  }

  setDaily(double currentTp1, double currentTp2, double currentTp3, double currentTp4, double currentPP) {
    _dailyKwh = currentTp1 + currentTp2 + currentTp3 + currentTp4 + currentPP;
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

  double _currentTP1 = 0;
  double _currentTP2 = 0;
  double _currentTP3 = 0;
  double _currentTP4 = 0;
  double _currentPP = 0;

  double get currentTP1 => _currentTP1;
  double get currentTP2 => _currentTP2;
  double get currentTP3 => _currentTP3;
  double get currentTP4 => _currentTP4;
  double get currentPP => _currentPP;
//overall daily KWH settlement
  setCurrentTP1(double i) {
    _currentTP1 = _currentTP1 + i;
  }

  setCurrentTP2(double i) {
    _currentTP2 = _currentTP2 + i;
  }

  setCurrentTP3(double i) {
    _currentTP3 = _currentTP3 + i;
  }

  setCurrentTP4(double i) {
    _currentTP4 = _currentTP4 + i;
  }

  setCurrentPP(double i) {
    _currentPP = _currentPP + i;
  }

  //overall Monthy Set

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
    Get.lazyPut(() => UnitsController());
    Get.lazyPut(() => ReportController());
    apiCall();
    super.onInit();
  }
// TODO I was about to implement the feature on the basis of date (current) date
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

  var _PP1ListConsumptionValues = <double>[].obs;
  List<double> get PP1ListConsumptionValues => _PP1ListConsumptionValues;
  setPP1List(double val) {
    _PP1ListConsumptionValues.add(val);
  }

  var _PP2ListConsumptionValues = <double>[].obs;
  List<double> get PP2ListConsumptionValues => _PP2ListConsumptionValues;
  setPP2List(double val) {
    _PP2ListConsumptionValues.add(val);
  }

  var _PP3ListConsumptionValues = <double>[].obs;
  List<double> get PP3ListConsumptionValues => _PP3ListConsumptionValues;
  setPP3List(double val) {
    _PP3ListConsumptionValues.add(val);
  }

  var _PPUtilitiesListConsumptionValues = <double>[].obs;
  List<double> get PPUtilitiesListConsumptionValues => _PPUtilitiesListConsumptionValues;
  setUTILITIESList(double val) {
    _PPUtilitiesListConsumptionValues.add(val);
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

//TODO UnitS Sum
  double TP1_UNIT1_DATA_SUM = 0;
  double TP1_UNIT2_DATA_SUM = 0;
  double TP2_UNIT1_DATA_SUM = 0;
  double TP2_UNIT2_DATA_SUM = 0;
  double TP3_UNIT1_DATA_SUM = 0;
  double TP3_UNIT2_DATA_SUM = 0;
  double TP4_SECTION1_DATA_SUM = 0;
  double TP4_SECTION2_DATA_SUM = 0;
  double TP4_SECTION3_DATA_SUM = 0;
  double TP4_SECTION4_DATA_SUM = 0;
  double PP_PP1_DATA_SUM = 0;
  double PP_PP2_DATA_SUM = 0;
  double PP_PP3_DATA_SUM = 0;
  double PP_UTILITIES_DATA_SUM = 0;
  int a = 0;
  int b = 0;
  int c = 0;
  int d = 0;
  int e = 0;

  final reportData = Get.find<ReportController>();
  apiCall() {
    ApiService().fetchDetails().then((data) {
      // print("HOME CONTROLLER: ${data[0]}");
      if (data[0] == "success") {
        for (int i = 0; i < data[1].length; i++) {
          Data _data = Data.fromJson(data[1][i]);
          // print("HOME CONTROLLER: ${data[1][i]}");
          Get.find<ReportController>().allReportsData.add(_data);

          // TODO //Implements on the basis of today's date

          //ends here

          ///Starts The Monthly Basis Setup
          if (data[1][i]["0"] == "TP1") {
            //changed TP1 -> 1 in if condition

            Data _data = Data.fromJson(data[1][i]);

            if (_data.nAME == "I" || _data.nAME == "II") {
              if (a < 4) {
                if (_data.nAME == "I") {
                  setTP1U1List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                  TP1_UNIT1_DATA_SUM = TP1_UNIT1_DATA_SUM + double.parse(data[1][i]["CONSUMPTION_VALUE"]);
                  setTP1UnitOne(ConsumptionModel(
                      consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                      consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                      centerName: data[1][i]["NAME_1"]));
                  a++;
                } else if (_data.nAME == "II") {
                  setTP1U2List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                  TP1_UNIT2_DATA_SUM = TP1_UNIT2_DATA_SUM + double.parse(data[1][i]["CONSUMPTION_VALUE"]);
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
                    totalValue: TP1_UNIT1_DATA_SUM));
                setTp1Unit2Data(UNITDATAMODEL(
                    consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                    unitName: "Unit 2",
                    consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                    totalValue: TP1_UNIT2_DATA_SUM));

                TP1_UNIT1_DATA_SUM = 0;
                TP1_UNIT2_DATA_SUM = 0;
                a = 0;
              }
              setTP1List(double.parse(_data.cONSUMPTIONVALUE!));
              setTotalTP1(double.parse(_data.cONSUMPTIONVALUE!));
              setTP1(_data);
            } else {
              print("helo");
            }
          } else if (data[1][i]["0"] == "TP2") {
            //TP2 changed tp 2
            Data _data = Data.fromJson(data[1][i]);

            if (b < 4) {
              if (_data.nAME == "I") {
                setTP2U1List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                TP2_UNIT1_DATA_SUM = TP2_UNIT1_DATA_SUM + double.parse(data[1][i]["CONSUMPTION_VALUE"]);
                setTP2UnitOne(ConsumptionModel(
                    consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                    consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                    centerName: data[1][i]["NAME_1"]));
                b++;
              } else if (_data.nAME == "II") {
                setTP2U2List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                TP2_UNIT2_DATA_SUM = TP2_UNIT2_DATA_SUM + double.parse(data[1][i]["CONSUMPTION_VALUE"]);
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
                  totalValue: TP2_UNIT1_DATA_SUM));
              setTp2Unit2Data(UNITDATAMODEL(
                  consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                  unitName: "Unit 2",
                  consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                  totalValue: TP2_UNIT2_DATA_SUM));

              TP2_UNIT1_DATA_SUM = 0;
              TP2_UNIT2_DATA_SUM = 0;
              b = 0;
            }
            setTP2List(double.parse(_data.cONSUMPTIONVALUE!));
            setTotalTP2(double.parse(_data.cONSUMPTIONVALUE!));
            setTP2(_data);
          } else if (data[1][i]["0"] == "TP3") {
            //TP3 changed to 3
            Data _data = Data.fromJson(data[1][i]);
            if (c < 4) {
              if (_data.nAME == "I") {
                setTP3U1List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                TP3_UNIT1_DATA_SUM = TP3_UNIT1_DATA_SUM + double.parse(data[1][i]["CONSUMPTION_VALUE"]);
                setTP3UnitOne(ConsumptionModel(
                    consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                    consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                    centerName: data[1][i]["NAME_1"]));
                c++;
              } else if (_data.nAME == "II") {
                setTP3U2List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                TP3_UNIT2_DATA_SUM = TP3_UNIT2_DATA_SUM + double.parse(data[1][i]["CONSUMPTION_VALUE"]);
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
                  totalValue: TP3_UNIT1_DATA_SUM));
              setTp3Unit2Data(UNITDATAMODEL(
                  consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                  unitName: "Unit 2",
                  consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                  totalValue: TP3_UNIT2_DATA_SUM));

              TP3_UNIT1_DATA_SUM = 0;
              TP3_UNIT2_DATA_SUM = 0;
              c = 0;
            }
            setTP3List(double.parse(_data.cONSUMPTIONVALUE!));
            setTotalTP3(double.parse(_data.cONSUMPTIONVALUE!));
            setTP3(_data);
          } else if (data[1][i]["0"] == "TP4") {
            //TP4 changed to 4
            Data _data = Data.fromJson(data[1][i]);

            if (d < 8) {
              if (_data.nAME == "Section 1") {
                setTP4S1List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                TP4_SECTION1_DATA_SUM = TP4_SECTION1_DATA_SUM + double.parse(data[1][i]["CONSUMPTION_VALUE"]);
                setTP4SOne(ConsumptionModel(
                    consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                    consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                    centerName: data[1][i]["NAME_1"]));

                d++;
              } else if (_data.nAME == "Section 2") {
                setTP4S2List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                TP4_SECTION2_DATA_SUM = TP4_SECTION2_DATA_SUM + double.parse(data[1][i]["CONSUMPTION_VALUE"]);
                setTP4STwo(ConsumptionModel(
                    consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                    consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                    centerName: data[1][i]["NAME_1"]));

                d++;
              } else if (_data.nAME == "Section 3") {
                setTP4S3List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                TP4_SECTION3_DATA_SUM = TP4_SECTION3_DATA_SUM + double.parse(data[1][i]["CONSUMPTION_VALUE"]);
                setTP4SThree(ConsumptionModel(
                    consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                    consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                    centerName: data[1][i]["NAME_1"]));

                d++;
              } else if (_data.nAME == "Section 4") {
                setTP4S4List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                TP4_SECTION4_DATA_SUM = TP4_SECTION4_DATA_SUM + double.parse(data[1][i]["CONSUMPTION_VALUE"]);
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
                  totalValue: TP4_SECTION1_DATA_SUM));
              setTP4Sec2(UNITDATAMODEL(
                  consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                  unitName: "Section 2",
                  consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                  totalValue: TP4_SECTION2_DATA_SUM));
              setTP4Sec3(UNITDATAMODEL(
                  consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                  unitName: "Section 3",
                  consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                  totalValue: TP4_SECTION3_DATA_SUM));
              setTP4Sec4(UNITDATAMODEL(
                  consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                  unitName: "Section 4",
                  consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                  totalValue: TP4_SECTION4_DATA_SUM));

              TP4_SECTION1_DATA_SUM = 0;
              TP4_SECTION2_DATA_SUM = 0;
              TP4_SECTION3_DATA_SUM = 0;
              TP4_SECTION4_DATA_SUM = 0;

              d = 0;
            }
            setTP4List(double.parse(_data.cONSUMPTIONVALUE!));
            setTotalTP4(double.parse(_data.cONSUMPTIONVALUE!));
            //  print("print out name:d<8  ${t1}");
            setTP4(_data);
          } else if (data[1][i]["0"] == "PP") {
            //data[1][i]["0"] == "PP" -> data[1][i]["2"] == "PP"
            Data _data = Data.fromJson(data[1][i]);

            if (e < 7) {
              if (_data.nAME == "PP1") {
                setPP1List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));

                PP_PP1_DATA_SUM = PP_PP1_DATA_SUM + double.parse(data[1][i]["CONSUMPTION_VALUE"]);
                setPPOne(ConsumptionModel(
                    consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                    consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                    centerName: data[1][i]["NAME_1"]));

                e++;
              } else if (_data.nAME == "PP2") {
                setPP2List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                PP_PP2_DATA_SUM = PP_PP2_DATA_SUM + double.parse(data[1][i]["CONSUMPTION_VALUE"]);
                setPPTwo(ConsumptionModel(
                    consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                    consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                    centerName: data[1][i]["NAME_1"]));

                e++;
              } else if (_data.nAME == "PP3") {
                setPP3List(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                PP_PP3_DATA_SUM = PP_PP3_DATA_SUM + double.parse(data[1][i]["CONSUMPTION_VALUE"]);
                setPPThree(ConsumptionModel(
                    consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                    consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                    centerName: data[1][i]["NAME_1"]));

                e++;
              } else if (_data.nAME == "Utilities") {
                setUTILITIESList(double.parse(data[1][i]["CONSUMPTION_VALUE"]));
                PP_UTILITIES_DATA_SUM = PP_UTILITIES_DATA_SUM + double.parse(data[1][i]["CONSUMPTION_VALUE"]);
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
                  totalValue: PP_PP1_DATA_SUM));
              setPP2(UNITDATAMODEL(
                  consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                  unitName: "PP 2",
                  consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                  totalValue: PP_PP2_DATA_SUM));
              setPP3(UNITDATAMODEL(
                  consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                  unitName: "PP 3",
                  consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                  totalValue: PP_PP3_DATA_SUM));
              setUtilities(UNITDATAMODEL(
                  consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                  unitName: "Utilities",
                  consumptionValue: double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                  totalValue: PP_UTILITIES_DATA_SUM));

              PP_PP1_DATA_SUM = 0;
              PP_PP2_DATA_SUM = 0;
              PP_PP3_DATA_SUM = 0;
              PP_UTILITIES_DATA_SUM = 0;

              e = 0;
            }

            // print("Setting PPLIST + ${_data.cONSUMPTIONVALUE!}");
            setPPList(double.parse(_data.cONSUMPTIONVALUE!));
            setTotalPP(double.parse(_data.cONSUMPTIONVALUE!));

            //  print("PP LIST VALUES: ${_PPList}");

            setPP(_data);
          }
        }
      } else {
        Get.rawSnackbar(
            duration: Duration(
              seconds: 3,
            ),
            messageText: Text(
              "Access Failed",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.black54,
            icon: Icon(
              Icons.error,
              size: 18,
              color: Colors.white,
            ));
      }

      setTotal(t1, t2, t3, t4, pp);
      // print("TP1 list max: " + _TP1List.reduce(max).toString());
      // print("TP1 list min: " + _TP1List.reduce(min).toString());
      // print("TP2 list max: " + _TP2List.reduce(max).toString());
      // print("TP2 list min: " + _TP2List.reduce(min).toString());
      // print("PP list max: " + _PPList.reduce(max).toString());
      // print("PP list min: " + _PPList.reduce(min).toString());
      change(value, status: RxStatus.success());
    }, onError: (err) {
      change(err, status: RxStatus.error());
    });
  }
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
