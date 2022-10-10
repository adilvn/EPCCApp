import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epcc/Authentication/ApiService.dart';
import 'package:epcc/Models/constants.dart';
import 'package:epcc/Screens/bottom_navigation.dart';
import 'package:epcc/Screens/unitsPage.dart';
import 'package:epcc/controllers/HomeController.dart';
import 'package:epcc/controllers/dailyUnitController.dart';
import 'package:epcc/controllers/dailyUsageController.dart';
import 'package:epcc/controllers/profileController.dart';
import 'package:epcc/controllers/reportController.dart';
import 'package:epcc/controllers/unitsController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends GetView<HomeController> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final _unitController = Get.find<UnitsController>();
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  HomeScreen();

  final _profileController = Get.find<ProfileController>();
  final _dailyController = Get.find<DailyController>();
  final _dailyUnitController = Get.find<DailyUnitsController>();
  Future<void> _refresh() async {
    await Future.delayed(Duration(milliseconds: 900));
    Get.reloadAll();
    BottomNavigation.changeProfileWidget(HomeScreen());
    _refreshController.refreshCompleted();
  }

  @override
  update() {
    Future.delayed(Duration(seconds: 5), () {
      if (controller.response.value || _dailyController.response.value) {
        ApiService().getResponse();
        print("helllllllo");
        print("Response function is Running");
        _dailyController.setResponse(false);
        controller.setResponse(false);
      }
    });
  }

  ReportController _reportController = Get.put(ReportController());
  @override
  Widget build(BuildContext context) {
    update();
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: epccBlue500,
            elevation: 4,
            title: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 15,
                        height: 22,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                    "assets/images/ifl_logo_small.png"))),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "EPCC",
                        style: TextStyle(fontSize: 20),
                      )
                    ],
                  ),
                  // Container(
                  //   width: 40,
                  //   height: 40,
                  //   decoration: BoxDecoration(
                  //       shape: BoxShape.circle,
                  //       image: DecorationImage(
                  //           fit: BoxFit.fill,
                  //           image: AssetImage("assets/images/profile.jpg"))),
                  // ),
                  Obx(() {
                    return Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            color: epccBlue500, shape: BoxShape.circle),
                        child: _profileController.uid != ""
                            ? FutureBuilder<DocumentSnapshot>(
                                future: users.doc(_profileController.uid).get(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData &&
                                      snapshot.connectionState ==
                                          ConnectionState.done) {
                                    Map<String, dynamic> data = snapshot.data!
                                        .data() as Map<String, dynamic>;
                                    var val = data.length == 3
                                        ? "image"
                                        : "full_name";
                                    return data[val] == ""
                                        ? Container(
                                            color: epccBlue500,
                                          )
                                        : Container(
                                            child: CachedNetworkImage(
                                              imageUrl: data[val],
                                              imageBuilder:
                                                  (context, imageProvider) =>
                                                      Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  image: DecorationImage(
                                                    fit: BoxFit.fitWidth,
                                                    image: imageProvider,
                                                  ),
                                                ),
                                              ),
                                              placeholder: (context, url) =>
                                                  Center(
                                                      child:
                                                          CupertinoActivityIndicator(
                                                radius: 8,
                                              )),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Center(
                                                child: Icon(
                                                  Icons.person,
                                                  size: 30,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          );
                                  } else {
                                    return Container(
                                      color: epccBlue500,
                                    );
                                  }
                                })
                            : Container());
                  }),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              Transform.rotate(
                transformHitTests: true,
                angle: 3.15,
                child: IconButton(
                    onPressed: () {
                      ApiService().getResponse();
                    },
                    icon: Icon(
                      Icons.refresh,
                      size: 30,
                    )),
              )
            ]),
        body: controller.obx(
          (data) {
            return SmartRefresher(
              onRefresh: _refresh,
              controller: _refreshController,
              enablePullDown: true,
              child: FadeInLeft(
                animate: true,
                duration: Duration(milliseconds: 1000),
                child: Column(children: [
                  // Expanded(
                  //     flex: 2,
                  //     child: Container(
                  //       alignment: Alignment.center,
                  //       color: epccBlue500,
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           SizedBox(
                  //             height: 5,
                  //           ),
                  //           Text("Locations",
                  //               style: TextStyle(
                  //                   color: Colors.white,
                  //                   fontSize: 26,
                  //                   fontFamily: montserrat,
                  //                   fontWeight: FontWeight.normal)),
                  //           Divider(
                  //             indent: MediaQuery.of(context).size.width * 0.3,
                  //             endIndent:
                  //                 MediaQuery.of(context).size.width * 0.3,
                  //             color: white,
                  //           ),
                  //         ],
                  //       ),
                  //     )),
                  Expanded(
                      flex: 4,
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 8,
                              child: Container(
                                child: SfCircularChart(
                                  tooltipBehavior:
                                      TooltipBehavior(enable: true),
                                  annotations: <CircularChartAnnotation>[
                                    CircularChartAnnotation(
                                        widget: Container(
                                            child: Text(
                                                (_dailyController.totalKwh /
                                                            1000)
                                                        .toStringAsFixed(2) +
                                                    " MWh\n ${_dailyController.latestDate}", //controller.totalKwh
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10))))
                                  ],
                                  legend: Legend(
                                    isVisible: false,
                                  ),
                                  series: <CircularSeries>[
                                    DoughnutSeries<ChartData, String>(
                                        enableTooltip: true,
                                        innerRadius: "68%",
                                        pointColorMapper: (ChartData data, _) =>
                                            data.color,
                                        dataSource: [
                                          ChartData(
                                              'TP1',
                                              _dailyController
                                                  .t1, //controller.t1
                                              Color(0xffFF6F00)),
                                          ChartData('TP2', _dailyController.t2,
                                              Color(0xff7C4DFF)),
                                          ChartData('TP3', _dailyController.t3,
                                              Color(0xff2196F3)),
                                          ChartData('TP4', _dailyController.t4,
                                              Color(0xffFF4040)),
                                          ChartData('PP', _dailyController.pp,
                                              Color(0xffFFA640))
                                        ],
                                        // enableSmartLabels: true,

                                        dataLabelMapper: (ChartData data, _) =>
                                            data.x,
                                        xValueMapper: (ChartData data, _) =>
                                            data.x,
                                        yValueMapper: (ChartData data, _) =>
                                            data.y,
                                        dataLabelSettings: DataLabelSettings(
                                          textStyle: TextStyle(fontSize: 9),
                                          isVisible: true,
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  getContainer(
                                      Color(0xffFF6F00),
                                      (_dailyController.t1 /
                                              _dailyController
                                                  .totalKwh) * //(controller.t1 / controller.totalKwh) *100
                                          100,
                                      _dailyController.t1.toDouble() /
                                          1000), //controller.t1.toDouble()
                                  getContainer(
                                      Color(0xff7C4DFF),
                                      (_dailyController.t2 /
                                              _dailyController.totalKwh) *
                                          100,
                                      _dailyController.t2.toDouble() / 1000),
                                  getContainer(
                                      Color(0xff2196F3),
                                      (_dailyController.t3 /
                                              _dailyController.totalKwh) *
                                          100,
                                      _dailyController.t3.toDouble() / 1000),
                                  getContainer(
                                      Color(0xffFF4040),
                                      (_dailyController.t4 /
                                              _dailyController.totalKwh) *
                                          100,
                                      _dailyController.t4.toDouble() / 1000),
                                  getContainer(
                                      Color(0xffFFA640),
                                      (_dailyController.pp /
                                              _dailyController.totalKwh) *
                                          100,
                                      _dailyController.pp.toDouble() / 1000),
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 0,
                                child: SizedBox(
                                  width: 00,
                                ))
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 8,
                    child: ListView(
                      children: [
                        getTiles(
                            Color(0xffFF6F00), "TP1", "assets/images/748.png",
                            () {
                          setDailyUnitTP1();
                          setMonthlyUnitTP1();
                          //Tp1
                          BottomNavigation.changeProfileWidget(UnitsPage());
                        }, _dailyController.t1, list: controller.TP1List),
                        getTiles(
                            Color(0xff7C4DFF), "TP2", "assets/images/749.png",
                            () {
                          setDailyUnitTP2();
                          setMonthlyUnitTP2();
                          //Tp2
                          BottomNavigation.changeProfileWidget(UnitsPage());
                        }, _dailyController.t2, list: controller.TP2List),
                        getTiles(
                            Color(0xff2196F3), "TP3", "assets/images/750.png",
                            () {
                          setDailyUnitTP3();
                          setMonthlyUnitTP3();
                          //Tp3
                          BottomNavigation.changeProfileWidget(UnitsPage());
                        }, _dailyController.t3, list: controller.TP3List),
                        getTiles(
                            Color(0xffFF4040), "TP4", "assets/images/751.png",
                            () {
                          setDailyUnitTP4();
                          setMonthlyUnitTP4();
                          //tp4
                          BottomNavigation.changeProfileWidget(UnitsPage());
                        }, _dailyController.t4, list: controller.TP4List),
                        getTiles(
                            Color(0xffFFA640), "PP", "assets/images/752.png",
                            () {
                          setDailyUnitPP();
                          setMonthlyUnitPP();
                          //PP
                          BottomNavigation.changeProfileWidget(UnitsPage());
                          /*on void call bacj*/
                        }, _dailyController.pp, list: controller.PPList),
                      ],
                    ),
                  ),
                ]),
              ),
            );
          },
          onError: (err) {
            Get.rawSnackbar(duration: Duration(seconds: 3), message: "$err");
            return Container();
          },
          onLoading: Center(
            child: CupertinoActivityIndicator(
              animating: true,
              radius: 25,
            ),
          ),
        ));
  }

  setDailyUnitTP1() {
    _dailyUnitController.setU1(_dailyController.TP1U1List);
    _dailyUnitController.setU2(_dailyController.TP1U2List);

    _dailyUnitController.setunitOne(_dailyController.TP1UnitOneDetails);
    _dailyUnitController.setunitTwo(_dailyController.TP1UnitTwoDetails);
    _dailyUnitController.setunitThree([]);

    _dailyUnitController.setunitFour([]);
    _dailyUnitController.setUnitOneDetails(_dailyController.TP1UNIT1DATA);
    _dailyUnitController.setUnitTwoDetails(_dailyController.TP1UNIT2DATA);
    _dailyUnitController.setUnitThreeDetails([]);
    _dailyUnitController.setUnitFourDetails([]);
    _dailyUnitController.setTotalUnit1(_dailyController.TP1_UNIT1_DATA_SUM);
    _dailyUnitController.setTotalUnit2(_dailyController.TP1_UNIT2_DATA_SUM);
    // print("Total Sum of Daily TP1 UNIT 1: "+_dailyController.TP1_UNIT1_DATA_SUM.toString());
    // print("Total Sum of Daily TP1 UNIT 2: "+_dailyController.TP1_UNIT2_DATA_SUM.toString());
    // print("Total Sum of Daily TP2 UNIT 1: "+_dailyController.TP2_UNIT1_DATA_SUM.toString());
    // print("Total Sum of Daily TP2 UNIT 2: "+_dailyController.TP2_UNIT2_DATA_SUM.toString());
    // print("Total Sum of Daily TP3 UNIT 1: "+_dailyController.TP3_UNIT1_DATA_SUM.toString());
    // print("Total Sum of Daily TP3 UNIT 2: "+_dailyController.TP3_UNIT2_DATA_SUM.toString());
    // print("Total Sum of Daily TP4 Section 1: "+_dailyController.TP4_SECTION1_DATA_SUM.toString());
    // print("Total Sum of Daily TP4 Section 2: "+_dailyController.TP4_SECTION2_DATA_SUM.toString());
    // print("Total Sum of Daily TP4 Section 3: "+_dailyController.TP4_SECTION3_DATA_SUM.toString());
    // print("Total Sum of Daily TP4 Section 4: "+_dailyController.TP4_SECTION4_DATA_SUM.toString());
    // print("Total Sum of Daily PP1 : "+_dailyController.PP_PP1_DATA_SUM.toString());
    // print("Total Sum of Daily PP2 : "+_dailyController.PP_PP2_DATA_SUM.toString());
    // print("Total Sum of Daily PP3 : "+_dailyController.PP_PP3_DATA_SUM.toString());
    // print("Total Sum of Daily PP Utilities: "+_dailyController.PP_UTILITIES_DATA_SUM.toString());
    _dailyUnitController.SetButtonText(["Unit 1", "Unit 2"]);
    _dailyUnitController
        .setUnitButtonColor([Color(0xff0099FF), Color(0xff00B8AC)]);
    _dailyUnitController.SetCenterName([
      "Back process Unit 1",
      "Spinning /winding unit 1",
      "Back process Unit 2\r\n",
      "Spinning/winding unit 2"
    ]);
    _dailyUnitController.SetButtonIndex(2);
    _dailyUnitController.SetTitle("TP1 ");
    _dailyUnitController.SetLocationName('TP1 Units');
  }

  setDailyUnitTP2() {
    _dailyUnitController.setU1(_dailyController.TP2U1List);
    _dailyUnitController.setU2(_dailyController.TP2U2List);
    _dailyUnitController.setunitOne(_dailyController.TP2UnitOneDetails);

    _dailyUnitController.setunitTwo(_dailyController.TP2UnitTwoDetails);
    _dailyUnitController.setunitThree([]);
    _dailyUnitController.setunitFour([]);

    _dailyUnitController.setTotalUnit1(_dailyController.TP2_UNIT1_DATA_SUM);
    _dailyUnitController.setTotalUnit2(_dailyController.TP2_UNIT2_DATA_SUM);
    _dailyUnitController.setUnitOneDetails(_dailyController.TP2UNIT1DATA);

    _dailyUnitController.setUnitTwoDetails(_dailyController.TP2UNIT2DATA);
    _dailyUnitController.setUnitThreeDetails([]);
    _dailyUnitController.setUnitFourDetails([]);

    _dailyUnitController.SetButtonText(["Unit 1", "Unit 2"]);
    _dailyUnitController
        .setUnitButtonColor([Color(0xff0099FF), Color(0xff00B8AC)]);
    _dailyUnitController.SetCenterName([
      "Back process Unit 1",
      "Spinning /winding unit 1",
      "Back process Unit 2\r\n",
      "Spinning/winding unit 2"
    ]);

    _dailyUnitController.SetButtonIndex(2);
    _dailyUnitController.SetTitle("TP2 ");
    _dailyUnitController.SetLocationName('TP2 Units');
  }

  setDailyUnitTP3() {
    _dailyUnitController.setU1(_dailyController.TP3U1List);
    _dailyUnitController.setU2(_dailyController.TP3U2List);
    _dailyUnitController.setTotalUnit1(_dailyController.TP3_UNIT1_DATA_SUM);

    _dailyUnitController.setTotalUnit2(_dailyController.TP3_UNIT2_DATA_SUM);
    _dailyUnitController.setunitOne(_dailyController.TP3UnitOneDetails);
    _dailyUnitController.setunitTwo(_dailyController.TP3UnitTwoDetails);

    _dailyUnitController.setunitThree([]);
    _dailyUnitController.setunitFour([]);
    _dailyUnitController.setUnitOneDetails(_dailyController.TP3UNIT1DATA);
    print("Total Sum of Daily TP1 UNIT 1: " +
        _dailyController.TP1_UNIT1_DATA_SUM.toString());
    print("Total Sum of Daily TP1 UNIT 2: " +
        _dailyController.TP1_UNIT2_DATA_SUM.toString());
    print("Total Sum of Daily TP2 UNIT 1: " +
        _dailyController.TP2_UNIT1_DATA_SUM.toString());
    print("Total Sum of Daily TP2 UNIT 2: " +
        _dailyController.TP2_UNIT2_DATA_SUM.toString());
    print("Total Sum of Daily TP3 UNIT 1: " +
        _dailyController.TP3_UNIT1_DATA_SUM.toString());
    print("Total Sum of Daily TP3 UNIT 2: " +
        _dailyController.TP3_UNIT2_DATA_SUM.toString());
    print("Total Sum of Daily TP4 Section 1: " +
        _dailyController.TP4_SECTION1_DATA_SUM.toString());
    print("Total Sum of Daily TP4 Section 2: " +
        _dailyController.TP4_SECTION2_DATA_SUM.toString());
    print("Total Sum of Daily TP4 Section 3: " +
        _dailyController.TP4_SECTION3_DATA_SUM.toString());
    print("Total Sum of Daily TP4 Section 4: " +
        _dailyController.TP4_SECTION4_DATA_SUM.toString());
    print("Total Sum of Daily PP1 : " +
        _dailyController.PP_PP1_DATA_SUM.toString());
    print("Total Sum of Daily PP2 : " +
        _dailyController.PP_PP2_DATA_SUM.toString());
    print("Total Sum of Daily PP3 : " +
        _dailyController.PP_PP3_DATA_SUM.toString());
    print("Total Sum of Daily PP Utilities: " +
        _dailyController.PP_UTILITIES_DATA_SUM.toString());
    _dailyUnitController.setUnitTwoDetails(_dailyController.TP3UNIT2DATA);
    _dailyUnitController.setUnitThreeDetails([]);
    _dailyUnitController.setUnitFourDetails([]);

    _dailyUnitController.SetButtonText(["Unit 1", "Unit 2"]);
    _dailyUnitController
        .setUnitButtonColor([Color(0xff0099FF), Color(0xff00B8AC)]);
    _dailyUnitController.SetCenterName([
      "Back process Unit 1",
      "Spinning /winding unit 1",
      "Back process Unit 2\r\n",
      "Spinning/winding unit 2"
    ]);
    _dailyUnitController.SetButtonIndex(2);
    _dailyUnitController.SetTitle("TP3 ");
    _dailyUnitController.SetLocationName('TP3 Units');
  }

  setDailyUnitTP4() {
    _dailyUnitController.setU1(_dailyController.TP4S1List);
    _dailyUnitController.setU2(_dailyController.TP4S2List);
    _dailyUnitController.setU3(_dailyController.TP4S3List);

    _dailyUnitController.setU4(_dailyController.TP4S4List);
    _dailyUnitController.setTotalUnit1(_dailyController.TP4_SECTION1_DATA_SUM);
    _dailyUnitController.setTotalUnit2(_dailyController.TP4_SECTION2_DATA_SUM);

    _dailyUnitController.setTotalUnit3(_dailyController.TP4_SECTION3_DATA_SUM);
    _dailyUnitController.setTotalUnit4(_dailyController.TP4_SECTION4_DATA_SUM);
    _dailyUnitController.setunitOne(_dailyController.TP4SOneDetails);

    _dailyUnitController.setunitTwo(_dailyController.TP4STwoDetails);
    _dailyUnitController.setunitThree(_dailyController.TP4SThreeDetails);
    _dailyUnitController.setunitFour(_dailyController.TP4SFourDetails);

    _dailyUnitController.setUnitOneDetails(_dailyController.TP4SECTION1DATA);
    _dailyUnitController.setUnitTwoDetails(_dailyController.TP4SECTION2DATA);
    _dailyUnitController.setUnitThreeDetails(_dailyController.TP4SECTION3DATA);

    _dailyUnitController.setUnitFourDetails(_dailyController.TP4SECTION4DATA);
    _dailyUnitController.SetButtonText([
      "Section 1",
      "Section 2",
      "Section 3",
      "Section 4",
    ]);
    _dailyUnitController.setUnitButtonColor(
        [Color(0xff0099FF), Color(0xff00B8AC), Color(0xffFFBA44), Colors.red]);

    _dailyUnitController.SetCenterName([
      "Back process 25k",
      "Spinning /winding 25k",
      "Back process 25k",
      "Spinning /winding 25k",
      "Back process 25k",
      "Spinning /winding 25k",
      "Back process 25k",
      "Spinning /winding 25k",
    ]);
    _dailyUnitController.SetButtonIndex(4);
    _dailyUnitController.SetTitle("TP4 ");

    _dailyUnitController.SetLocationName('TP4 Sections');
  }

  setDailyUnitPP() {
    _dailyUnitController
        .setU1(_dailyController.PP1List); //assigns whole list PP1 List
    _dailyUnitController
        .setU2(_dailyController.PP2List); //assigns whole list PP2 List
    _dailyUnitController
        .setU3(_dailyController.PP3List); //assigns whole list PP3 List

    _dailyUnitController.setU4(
        _dailyController.UTILITIESList); //assigns whole list PP Utilities List
    _dailyUnitController.setTotalUnit1(
        _dailyController.PP_PP1_DATA_SUM); //assigns PP1 TOTAL SUM OF MONTH
    _dailyUnitController.setTotalUnit2(
        _dailyController.PP_PP2_DATA_SUM); //assigns PP2 TOTAL SUM OF MONTH

    _dailyUnitController.setTotalUnit3(
        _dailyController.PP_PP3_DATA_SUM); //assigns PP3 TOTAL SUM OF MONTH
    _dailyUnitController.setTotalUnit4(_dailyController
        .PP_UTILITIES_DATA_SUM); //assigns PP Utilities TOTAL SUM OF MONTH
    _dailyUnitController.setunitOne(_dailyController.PPOneDetails);

    _dailyUnitController.setunitTwo(_dailyController.PPTwoDetails);
    _dailyUnitController.setunitThree(_dailyController.PPThreeDetails);

    _dailyUnitController.setunitFour(_dailyController.UtilitiesDetails);
    _dailyUnitController.setUnitOneDetails(_dailyController.PP1DATA);

    _dailyUnitController.setUnitTwoDetails(_dailyController.PP2DATA);
    _dailyUnitController.setUnitThreeDetails(_dailyController.PP3DATA);
    _dailyUnitController.setUnitFourDetails(_dailyController.UTILITIESDATA);
    _dailyUnitController.SetButtonText(["PP1", "PP2", "PP3", "Utilities"]);
    _dailyUnitController.setUnitButtonColor(
        [Color(0xff0099FF), Color(0xff00B8AC), Color(0xffFFBA44), Colors.red]);
    _dailyUnitController.SetCenterName([
      "polymer/spinning",
      "Draw lines",
      "polymer/spinning",
      "Draw lines",
      "polymer/spinning",
      "Draw lines",
      "PP1 ,PP2 ,PP3\r\n"
    ]);
    _dailyUnitController.SetButtonIndex(4);
    _dailyUnitController.SetLocationName('PP');
    _dailyUnitController.SetTitle("PP ");
  }

  setMonthlyUnitTP1() {
    _unitController.setU1(controller.TP1U1List);
    _unitController.setU2(controller.TP1U2List);

    _unitController.setunitOne(controller.TP1UnitOneDetails);
    _unitController.setunitTwo(controller.TP1UnitTwoDetails);
    _unitController.setunitThree([]);

    _unitController.setunitFour([]);
    _unitController.setUnitOneDetails(controller.TP1UNIT1DATA);
    _unitController.setUnitTwoDetails(controller.TP1UNIT2DATA);
    _unitController.setUnitThreeDetails([]);
    _unitController.setUnitFourDetails([]);
    _unitController.setTotalUnit1(controller.TP1_UNIT1_DATA_SUM);
    _unitController.setTotalUnit2(controller.TP1_UNIT2_DATA_SUM);
    print("Total Sum of UNIT 1: " + controller.TP1_UNIT1_DATA_SUM.toString());
    _unitController.SetButtonText(["Unit 1", "Unit 2"]);
    _unitController.setUnitButtonColor([Color(0xff0099FF), Color(0xff00B8AC)]);
    _unitController.SetCenterName([
      "Back process Unit 1",
      "Spinning /winding unit 1",
      "Back process Unit 2\r\n",
      "Spinning/winding unit 2"
    ]);
    _unitController.SetButtonIndex(2);
    _unitController.SetTitle("TP1 ");
    _unitController.SetLocationName('TP1 Units');
  }

  setMonthlyUnitTP2() {
    _unitController.setU1(controller.TP2U1List);
    _unitController.setU2(controller.TP2U2List);
    _unitController.setunitOne(controller.TP2UnitOneDetails);
    _unitController.setunitTwo(controller.TP2UnitTwoDetails);
    _unitController.setunitThree([]);

    _unitController.setunitFour([]);
    _unitController.setTotalUnit1(controller.TP2_UNIT1_DATA_SUM);
    _unitController.setTotalUnit2(controller.TP2_UNIT2_DATA_SUM);
    _unitController.setUnitOneDetails(controller.TP2UNIT1DATA);
    _unitController.setUnitTwoDetails(controller.TP2UNIT2DATA);
    _unitController.setUnitThreeDetails([]);
    _unitController.setUnitFourDetails([]);
    _unitController.SetButtonText(["Unit 1", "Unit 2"]);
    _unitController.setUnitButtonColor([Color(0xff0099FF), Color(0xff00B8AC)]);
    _unitController.SetCenterName([
      "Back process Unit 1",
      "Spinning /winding unit 1",
      "Back process Unit 2\r\n",
      "Spinning/winding unit 2"
    ]);
    _unitController.SetButtonIndex(2);
    _unitController.SetTitle("TP2 ");
    _unitController.SetLocationName('TP2 Units');
  }

  setMonthlyUnitTP3() {
    _unitController.setU1(controller.TP3U1List);
    _unitController.setU2(controller.TP3U2List);
    _unitController.setTotalUnit1(controller.TP3_UNIT1_DATA_SUM);
    _unitController.setTotalUnit2(controller.TP3_UNIT2_DATA_SUM);
    _unitController.setunitOne(controller.TP3UnitOneDetails);
    _unitController.setunitTwo(controller.TP3UnitTwoDetails);
    _unitController.setunitThree([]);

    _unitController.setunitFour([]);
    _unitController.setUnitOneDetails(controller.TP3UNIT1DATA);
    _unitController.setUnitTwoDetails(controller.TP3UNIT2DATA);
    _unitController.setUnitThreeDetails([]);
    _unitController.setUnitFourDetails([]);
    _unitController.SetButtonText(["Unit 1", "Unit 2"]);
    _unitController.setUnitButtonColor([Color(0xff0099FF), Color(0xff00B8AC)]);
    _unitController.SetCenterName([
      "Back process Unit 1",
      "Spinning /winding unit 1",
      "Back process Unit 2\r\n",
      "Spinning/winding unit 2"
    ]);
    _unitController.SetButtonIndex(2);
    _unitController.SetTitle("TP3 ");
    _unitController.SetLocationName('TP3 Units');
  }

  setMonthlyUnitTP4() {
    _unitController.setU1(controller.TP4S1List);
    _unitController.setU2(controller.TP4S2List);
    _unitController.setU3(controller.TP4S3List);
    _unitController.setU4(controller.TP4S4List);
    _unitController.setTotalUnit1(controller.TP4_SECTION1_DATA_SUM);
    _unitController.setTotalUnit2(controller.TP4_SECTION2_DATA_SUM);
    _unitController.setTotalUnit3(controller.TP4_SECTION3_DATA_SUM);
    _unitController.setTotalUnit4(controller.TP4_SECTION4_DATA_SUM);

    _unitController.setunitOne(controller.TP4SOneDetails);
    _unitController.setunitTwo(controller.TP4STwoDetails);
    _unitController.setunitThree(controller.TP4SThreeDetails);

    _unitController.setunitFour(controller.TP4SFourDetails);
    _unitController.setUnitOneDetails(controller.TP4SECTION1DATA);
    _unitController.setUnitTwoDetails(controller.TP4SECTION2DATA);
    _unitController.setUnitThreeDetails(controller.TP4SECTION3DATA);
    _unitController.setUnitFourDetails(controller.TP4SECTION4DATA);
    _unitController.SetButtonText([
      "Section 1",
      "Section 2",
      "Section 3",
      "Section 4",
    ]);
    _unitController.setUnitButtonColor(
        [Color(0xff0099FF), Color(0xff00B8AC), Color(0xffFFBA44), Colors.red]);
    _unitController.SetCenterName([
      "Back process 25k",
      "Spinning /winding 25k",
      "Back process 25k",
      "Spinning /winding 25k",
      "Back process 25k",
      "Spinning /winding 25k",
      "Back process 25k",
      "Spinning /winding 25k",
    ]);
    _unitController.SetButtonIndex(4);
    _unitController.SetTitle("TP4 ");
    _unitController.SetLocationName('TP4 Sections');
  }

  setMonthlyUnitPP() {
    _unitController.setU1(
        controller.PP1ListConsumptionValues); //assigns whole list PP1 List
    _unitController.setU2(
        controller.PP2ListConsumptionValues); //assigns whole list PP2 List
    _unitController.setU3(
        controller.PP3ListConsumptionValues); //assigns whole list PP3 List
    _unitController.setU4(controller
        .PPUtilitiesListConsumptionValues); //assigns whole list PP Utilities List
    _unitController.setTotalUnit1(
        controller.PP_PP1_DATA_SUM); //assigns PP1 TOTAL SUM OF MONTH
    _unitController.setTotalUnit2(
        controller.PP_PP2_DATA_SUM); //assigns PP2 TOTAL SUM OF MONTH
    _unitController.setTotalUnit3(
        controller.PP_PP3_DATA_SUM); //assigns PP3 TOTAL SUM OF MONTH
    _unitController.setTotalUnit4(controller
        .PP_UTILITIES_DATA_SUM); //assigns PP Utilities TOTAL SUM OF MONTH
    _unitController.setunitOne(controller.PPOneDetails);

    _unitController.setunitTwo(controller.PPTwoDetails);
    _unitController.setunitThree(controller.PPThreeDetails);

    _unitController.setunitFour(controller.UtilitiesDetails);
    _unitController.setUnitOneDetails(controller.PP1DATA);

    _unitController.setUnitTwoDetails(controller.PP2DATA);
    _unitController.setUnitThreeDetails(controller.PP3DATA);
    _unitController.setUnitFourDetails(controller.UTILITIESDATA);
    _unitController.SetButtonText(["PP1", "PP2", "PP3", "Utilities"]);
    _unitController.setUnitButtonColor(
        [Color(0xff0099FF), Color(0xff00B8AC), Color(0xffFFBA44), Colors.red]);
    _unitController.SetCenterName([
      "polymer/spinning",
      "Draw lines",
      "polymer/spinning",
      "Draw lines",
      "polymer/spinning",
      "Draw lines",
      "PP1 ,PP2 ,PP3\r\n"
    ]);
    _unitController.SetButtonIndex(4);
    _unitController.SetLocationName('PP');
    _unitController.SetTitle("PP ");
  }

  getTiles(
      Color color, String val, imageText, VoidCallback onTap, double totalvalue,
      {required List<double> list}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          width: double.infinity,
          height: 80,
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2,
                      child: Image(
                        alignment: Alignment.center,
                        fit: BoxFit.fitHeight,
                        image: AssetImage(imageText),
                        color: white,
                        width: 35,
                        height: 35,
                      )),
                  Expanded(
                    flex: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(val,
                                    style: TextStyle(
                                        color: white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                              ],
                            ),
                            Text("Total: $totalvalue" + " kWh",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500)),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 13,
                              color: white,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                          height: 5,
                          child: Divider(
                            color: white,
                            thickness: 1,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Min: ${list.reduce(min)}",

                                ///(value, element) => value > element ? value : element
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            Text(
                                "Max:  ${list.reduce(max)}", //(value, element) => value > element ? value : element
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  getContainer(Color color, double value, double value2) {
    NumberFormat numberFormat = NumberFormat.compact();
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        child: Row(
          children: [
            Container(
              width: 15,
              height: 15,
              color: color,
            ),
            SizedBox(
              width: 5,
            ),
            Text(value.toStringAsPrecision(2) + "%",
                style: TextStyle(fontSize: 12)),
            SizedBox(
              width: 10,
            ),
            Text(
              value2.toStringAsFixed(2) + " MWh",
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
