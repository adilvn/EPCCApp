import 'package:epcc/Authentication/ApiService.dart';
import 'package:epcc/Models/data_modal.dart';
import 'package:epcc/Models/unitdatamodel.dart';
import 'package:epcc/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with StateMixin<List<List<dynamic>>> {
  List<Color> colors = [
    Color(0xffFF6F00),
    Color(0xff7C4DFF),
    Color(0xff2196F3),
    Color(0xffFF4040),
    Color(0xffFFA640)
  ];

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

// initialize
  @override
  void onInit() {
    apiCall();
    super.onInit();
  }

  double TP1_UNIT1_DATA_SUM = 0;
  double TP1_UNIT2_DATA_SUM = 0;
  double TP2_UNIT1_DATA_SUM = 0;
  double TP2_UNIT2_DATA_SUM = 0;
  double TP3_UNIT1_DATA_SUM = 0;
  double TP3_UNIT2_DATA_SUM = 0;
  int c = 0;
  apiCall() {
    ApiService().fetchDetails().then((data) {
      allData = data;
      if (data[0] == "success") {
        for (var i = 0; i < data[1].length; i++) {
          if (data[1][i]["2"] == "TP1") {
            Data _data = Data.fromJson(data[1][i]);
            if (c < 4) {
              if (_data.nAME == "I") {
                TP1_UNIT1_DATA_SUM = TP1_UNIT1_DATA_SUM +
                    double.parse(data[1][i]["CONSUMPTION_VALUE"]);

                c++;
              } else if (_data.nAME == "II") {
                TP1_UNIT2_DATA_SUM = TP1_UNIT2_DATA_SUM +
                    double.parse(data[1][i]["CONSUMPTION_VALUE"]);

                c++;
              }
            }
            if (c == 4) {
              setTp1Unit1Data(UNITDATAMODEL(
                  consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                  unitName: "Unit 1",
                  consumptionValue:
                      double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                  totalValue: TP1_UNIT1_DATA_SUM));
              setTp1Unit2Data(UNITDATAMODEL(
                  consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                  unitName: "Unit 2",
                  consumptionValue:
                      double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                  totalValue: TP1_UNIT2_DATA_SUM));

              TP1_UNIT1_DATA_SUM = 0;
              TP1_UNIT2_DATA_SUM = 0;
              c = 0;
            }

            setTotalTP1(double.parse(_data.cONSUMPTIONVALUE!));
            setTP1(_data);
          } else if (data[1][i]["2"] == "TP2") {
            Data _data = Data.fromJson(data[1][i]);

            if (c < 4) {
              if (_data.nAME == "I") {
                TP2_UNIT1_DATA_SUM = TP2_UNIT1_DATA_SUM +
                    double.parse(data[1][i]["CONSUMPTION_VALUE"]);
                c++;
              } else if (_data.nAME == "II") {
                TP2_UNIT2_DATA_SUM = TP2_UNIT2_DATA_SUM +
                    double.parse(data[1][i]["CONSUMPTION_VALUE"]);
                c++;
              }
            }
            if (c == 4) {
              setTp2Unit1Data(UNITDATAMODEL(
                  consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                  unitName: "Unit 1",
                  consumptionValue:
                      double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                  totalValue: TP2_UNIT1_DATA_SUM));
              setTp2Unit2Data(UNITDATAMODEL(
                  consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                  unitName: "Ubnit 2",
                  consumptionValue:
                      double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                  totalValue: TP2_UNIT2_DATA_SUM));

              TP2_UNIT1_DATA_SUM = 0;
              TP2_UNIT2_DATA_SUM = 0;
              c = 0;
            }

            setTotalTP2(double.parse(_data.cONSUMPTIONVALUE!));
            setTP2(_data);
          } else if (data[1][i]["2"] == "TP3") {
            Data _data = Data.fromJson(data[1][i]);
            if (c < 4) {
              if (_data.nAME == "I") {
                TP3_UNIT1_DATA_SUM = TP3_UNIT1_DATA_SUM +
                    double.parse(data[1][i]["CONSUMPTION_VALUE"]);
                c++;
              } else if (_data.nAME == "II") {
                TP3_UNIT2_DATA_SUM = TP3_UNIT2_DATA_SUM +
                    double.parse(data[1][i]["CONSUMPTION_VALUE"]);
                c++;
              }
            }
            if (c == 4) {
              setTp3Unit1Data(UNITDATAMODEL(
                  consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                  unitName: "Unit 1",
                  consumptionValue:
                      double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                  totalValue: TP3_UNIT1_DATA_SUM));
              setTp3Unit2Data(UNITDATAMODEL(
                  consumptionDate: data[1][i]["CONSUMPTION_DATE"],
                  unitName: "Unit 2",
                  consumptionValue:
                      double.parse(data[1][i]["CONSUMPTION_VALUE"]),
                  totalValue: TP3_UNIT2_DATA_SUM));

              TP3_UNIT1_DATA_SUM = 0;
              TP3_UNIT2_DATA_SUM = 0;
              c = 0;
            }

            setTotalTP3(double.parse(_data.cONSUMPTIONVALUE!));
            setTP3(_data);
          } else if (data[1][i]["2"] == "TP4") {
            Data _data = Data.fromJson(data[1][i]);
            setTotalTP4(double.parse(_data.cONSUMPTIONVALUE!));
            setTP4(_data);
          } else if (data[1][i]["2"] == "PP") {
            Data _data = Data.fromJson(data[1][i]);
            setTotalPP(double.parse(_data.cONSUMPTIONVALUE!));
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
