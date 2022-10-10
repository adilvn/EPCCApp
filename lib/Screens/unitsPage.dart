import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epcc/Models/constants.dart';
import 'package:epcc/Screens/bottom_navigation.dart';
import 'package:epcc/Screens/home_screen.dart';
import 'package:epcc/Screens/subUnits.dart';
import 'package:epcc/controllers/dailyUnitController.dart';
import 'package:epcc/controllers/profileController.dart';
import 'package:epcc/controllers/subUnitsController.dart';
import 'package:epcc/controllers/unitsController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class UnitsPage extends GetView<UnitsController> {
  final _subController = Get.find<SubUnitsController>();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final _profileController = Get.find<ProfileController>();
  final _dailyUnitController = Get.find<DailyUnitsController>();
  @override
  Widget build(BuildContext context) {
    controller.addChartsDetails(
        controller.unitOneDetails,
        controller.unitTwoDetails,
        controller.unitThreeDetails,
        controller.unitFourDetails,
        controller.buttonIndex);
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
                  child: Container(
                    width: 45,
                  ))
            ]),
        body: Obx(() {
          return FadeInRight(
            animate: true,
            duration: Duration(milliseconds: 400),
            child: Column(children: [
              Expanded(
                  flex: 4,
                  child: Container(
                    color: epccBlue500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            BottomNavigation.backToHomePage(
                                HomeScreen(), 1, true);
                            controller.chartOne.clear();
                            controller.chartTwo.clear();
                            controller.setUnitDropValue1("Year");
                            controller.setUnitDropValue2("Month");
                            controller.setUnitDropValue3("Day");
                            controller.setTotalUnit1(0.0);
                            controller.setTotalUnit2(0.0);
                            controller.setTotalUnit3(0.0);
                            controller.setTotalUnit4(0.0);
                            _subController.unitOneValue.clear();
                            _subController.unitTwoValue.clear();
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            alignment: Alignment.centerLeft,
                            width: double.infinity,
                            height: 30,
                            child: Icon(
                              Icons.arrow_back,
                              color: white,
                              size: 32,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              height: 25,
                              child: Text(
                                controller.title,
                                style: TextStyle(
                                    color: epccBlue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal),
                              ),
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30))),
                            ),
                            SizedBox(
                              width: 0,
                            )
                          ],
                        ),
                        Text(
                          "IFL - " + controller.title,
                          //controller.locationName,
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        Divider(
                          indent: MediaQuery.of(context).size.width * 0.3,
                          endIndent: MediaQuery.of(context).size.width * 0.3,
                          color: white,
                        ),
                        SizedBox(
                          height: 0,
                        )
                      ],
                    ),
                  )),
              Expanded(
                  flex: 6,
                  child: Container(
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 65,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 39,
                                    decoration: BoxDecoration(
                                        color: ddbcolor,
                                        border: dropdownBorderColor,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: DropdownButton<String>(
                                      menuMaxHeight: MediaQuery.of(context).size.width,
                                      value: controller.UnitDropValue1.value,
                                      disabledHint: Text(""),
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: dbTextColor,
                                      ),
                                      iconSize: 24,
                                      elevation: 16,
                                      dropdownColor: ddbcolor,
                                      focusColor: ddbcolor,
                                      underline: Container(),
                                      style: const TextStyle(
                                          color: Colors.deepPurple),
                                      onChanged: (val) {
                                        print("$val");
                                        controller.setUnitDropValue1(val);
                                        controller.totalunit1;
                                        controller.addChartsDetails(
                                            controller.unitOneDetails,
                                            controller.unitTwoDetails,
                                            controller.unitThreeDetails,
                                            controller.unitFourDetails,
                                            controller.buttonIndex);
                                      },
                                      items: controller.UnitDrop1.map<
                                              DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Container(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text(
                                              value,
                                              style:
                                                  TextStyle(color: dbTextColor),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 39,
                                    decoration: BoxDecoration(
                                        color: ddbcolor,
                                        border: dropdownBorderColor,
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: DropdownButton<String>(
                                      menuMaxHeight: MediaQuery.of(context).size.width,
                                      value: controller.UnitDropValue2.value,
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: dbTextColor,
                                      ),
                                      iconSize: 24,
                                      elevation: 16,
                                      dropdownColor: ddbcolor,
                                      focusColor: ddbcolor,
                                      underline: Container(),
                                      style: const TextStyle(
                                          color: Colors.deepPurple),
                                      onChanged: (val) {
                                        controller.setUnitDropValue2(val);
                                        controller.addChartsDetails(
                                            controller.unitOneDetails,
                                            controller.unitTwoDetails,
                                            controller.unitThreeDetails,
                                            controller.unitFourDetails,
                                            controller.buttonIndex);
                                      },
                                      items: controller.UnitDrop2.map<
                                              DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Container(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text(
                                              value,
                                              style:
                                                  TextStyle(color: dbTextColor),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 39,
                                    decoration: BoxDecoration(
                                        color: ddbcolor,
                                        border: dropdownBorderColor,
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: DropdownButton<String>(
                                      menuMaxHeight: MediaQuery.of(context).size.width,
                                      value: controller.UnitDropValue3.value,
                                      icon: const Icon(
                                        Icons.arrow_drop_down,
                                        color: dbTextColor,
                                      ),
                                      iconSize: 24,
                                      elevation: 16,
                                      dropdownColor: ddbcolor,
                                      focusColor: ddbcolor,
                                      underline: Container(),
                                      style: const TextStyle(
                                          color: Colors.deepPurple),
                                      onChanged: (val) {
                                        controller.setUnitDropValue3(val);
                                        controller.addChartsDetails(
                                            controller.unitOneDetails,
                                            controller.unitTwoDetails,
                                            controller.unitThreeDetails,
                                            controller.unitFourDetails,
                                            controller.buttonIndex);

                                        // BottomNavigation.changeProfileWidget(
                                        //     UnitsPage(
                                        //         unitOneDetails: unitOneDetails,
                                        //         unitTwoDetails: unitTwoDetails));
                                      },
                                      items: controller.UnitDrop3.map<
                                              DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Container(
                                            padding: EdgeInsets.only(left: 15),
                                            child: Text(
                                              value,
                                              style:
                                                  TextStyle(color: dbTextColor),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          flex: 7,
                          child: Column(
                            children: [
                              Expanded(
                                child: controller.buttonIndex < 4
                                    ? Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 6),
                                        child: SfCartesianChart(
                                            primaryYAxis: CategoryAxis(
                                              title: AxisTitle(
                                                  text: 'Consumptions (kWh)',
                                                  textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Roboto',
                                                      fontSize: 10.5,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ),
                                            primaryXAxis: CategoryAxis(
                                              title: AxisTitle(
                                                  text: 'Day',
                                                  textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Roboto',
                                                      fontSize: 14,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ),
                                            series: <ColumnSeries>[
                                              ColumnSeries<ChartData1, String>(
                                                  pointColorMapper:
                                                      (ChartData1 color, _) =>
                                                          Color(0xff0099FF),
                                                  dataLabelSettings:
                                                      DataLabelSettings(
                                                          textStyle: TextStyle(
                                                              fontSize: 6,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                          labelAlignment:
                                                              ChartDataLabelAlignment
                                                                  .outer,
                                                          isVisible: true),
                                                  dataSource:
                                                      controller.chartOne,
                                                  xValueMapper:
                                                      (ChartData1 data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (ChartData1 data, _) =>
                                                          data.y),
                                              ColumnSeries<ChartData1, String>(
                                                  pointColorMapper:
                                                      (ChartData1 color, _) =>
                                                          Color(0xff00B8AC),
                                                  // Hiding the legend item for this series
                                                  dataLabelSettings:
                                                      DataLabelSettings(
                                                          textStyle: TextStyle(
                                                              fontSize: 7,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                          labelAlignment:
                                                              ChartDataLabelAlignment
                                                                  .outer,
                                                          isVisible: true),
                                                  dataSource:
                                                      controller.chartTwo,
                                                  xValueMapper:
                                                      (ChartData1 data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (ChartData1 data, _) =>
                                                          data.y),
                                            ]))
                                    : Container(
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 6),
                                        child: SfCartesianChart(
                                            primaryYAxis: NumericAxis(
                                              numberFormat:
                                                  NumberFormat.compact(),
                                              title: AxisTitle(
                                                  text: 'Consumption (kWh)',
                                                  textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Roboto',
                                                      fontSize: 14,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ),
                                            // primaryYAxis: CategoryAxis(
                                            //   title: AxisTitle(
                                            //       text: 'Consumption (KHW)',
                                            //       textStyle: TextStyle(
                                            //           color: Colors.black,
                                            //           fontFamily: 'Roboto',
                                            //           fontSize: 14,
                                            //           fontStyle: FontStyle.normal,
                                            //           fontWeight:
                                            //               FontWeight.w300)),
                                            // ),
                                            primaryXAxis: CategoryAxis(
                                              title: AxisTitle(
                                                  text: 'Day',
                                                  textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Roboto',
                                                      fontSize: 14,
                                                      fontStyle:
                                                          FontStyle.normal,
                                                      fontWeight:
                                                          FontWeight.w300)),
                                            ),
                                            series: <ColumnSeries>[
                                              ColumnSeries<ChartData1, String>(
                                                  pointColorMapper:
                                                      (ChartData1 color, _) =>
                                                          Color(0xff0099FF),
                                                  dataLabelSettings:
                                                      DataLabelSettings(
                                                          textStyle: TextStyle(
                                                              fontSize: 7,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                          labelAlignment:
                                                              ChartDataLabelAlignment
                                                                  .outer,
                                                          isVisible: true),
                                                  dataSource:
                                                      controller.chartOne,
                                                  xValueMapper:
                                                      (ChartData1 data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (ChartData1 data, _) =>
                                                          data.y),
                                              ColumnSeries<ChartData1, String>(
                                                  pointColorMapper:
                                                      (ChartData1 color, _) =>
                                                          Color(0xff00B8AC),
                                                  // Hiding the legend item for this series
                                                  dataLabelSettings:
                                                      DataLabelSettings(
                                                          textStyle: TextStyle(
                                                              fontSize: 7,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                          labelAlignment:
                                                              ChartDataLabelAlignment
                                                                  .outer,
                                                          isVisible: true),
                                                  dataSource:
                                                      controller.chartTwo,
                                                  xValueMapper:
                                                      (ChartData1 data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (ChartData1 data, _) =>
                                                          data.y),
                                              ColumnSeries<ChartData1, String>(
                                                  pointColorMapper:
                                                      (ChartData1 color, _) =>
                                                          Color(0xffFFBA44),

                                                  // Hiding the legend item for this series
                                                  dataLabelSettings:
                                                      DataLabelSettings(
                                                          textStyle: TextStyle(
                                                              fontSize: 7,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                          labelAlignment:
                                                              ChartDataLabelAlignment
                                                                  .outer,
                                                          isVisible: true),
                                                  dataSource:
                                                      controller.chartThree,
                                                  xValueMapper:
                                                      (ChartData1 data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (ChartData1 data, _) =>
                                                          data.y),
                                              ColumnSeries<ChartData1, String>(
                                                  pointColorMapper:
                                                      (ChartData1 color, _) =>
                                                          Colors.red,
                                                  // Hiding the legend item for this series
                                                  dataLabelSettings:
                                                      DataLabelSettings(
                                                          textStyle: TextStyle(
                                                              fontSize: 7,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal),
                                                          labelAlignment:
                                                              ChartDataLabelAlignment
                                                                  .outer,
                                                          isVisible: true),
                                                  dataSource:
                                                      controller.chartFour,
                                                  xValueMapper:
                                                      (ChartData1 data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (ChartData1 data, _) =>
                                                          data.y),
                                            ])),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
              Expanded(
                  flex: 7,
                  child: ListView(
                    children: [
                      getTiles(controller.colors[0], controller.buttonText[0],
                          "assets/images/unit1.png", () {
                        //unit 1
                        _subController.setUnitDetials(
                            controller.unitOne); //unit one details

                        _subController.setButtonIndex(2); // button index
                        _subController.setUnitButtonColor(//button color
                            [Colors.red, Color(0xffFFBA44)]);
                        _subController.SetButtonText([
                          //button text
                          controller.centerName[0],
                          controller.centerName[1]
                        ]);
                        _subController.SetTitle(
                            "${controller.title}> ${controller.buttonText[0]} ");
                        _subController.SetLocationName("Consumption Centers");
                        _subController.chartOne.clear();
                        _subController.chartTwo.clear();

                        _subController.setSubDropValue1("Year");
                        _subController.setSubDropValue2("Month");
                        _subController.setSubDropValue3("Day");
                        _subController.unitOneValue.clear();
                        _subController.unitTwoValue.clear();
                        BottomNavigation.changeProfileWidget(SubUnits());
                      },
                          controller.dailyTotalUnit1 == 0.0
                              ? _dailyUnitController.totalunit1
                              : controller.dailyTotalUnit1,
                          controller.U1), //controller.totalunit1
                      getTiles(controller.colors[1], controller.buttonText[1],
                          "assets/images/unit2.png", () {
                        _subController.setUnitDetials(controller.unitTwo);
                        _subController.setButtonIndex(2);
                        _subController.setUnitButtonColor(//button color
                            [Colors.red, Color(0xffFFBA44)]);
                        _subController.SetButtonText([
                          controller.centerName[2],
                          controller.centerName[3]
                        ]);
                        _subController.SetTitle(
                            "${controller.title}> ${controller.buttonText[1]} ");
                        _subController.SetLocationName("Consumption Center");
                        _subController.chartOne.clear();
                        _subController.chartTwo.clear();

                        _subController.setSubDropValue1("Year");
                        _subController.setSubDropValue2("Month");
                        _subController.setSubDropValue3("Day");
                        _subController.unitOneValue.clear();
                        _subController.unitTwoValue.clear();
                        BottomNavigation.changeProfileWidget(SubUnits());
                      },
                          controller.dailyTotalUnit2 == 0.0
                              ? _dailyUnitController.totalunit2
                              : controller.dailyTotalUnit2,
                          controller.U2),
                      controller.buttonIndex == 4
                          ? Column(
                              children: [
                                getTiles(
                                    controller.colors[2], //button color
                                    controller.buttonText[2], //button text
                                    "assets/images/unit1.png", () {
                                  //on Tap
                                  _subController
                                      .setUnitDetials(controller.unitThree);
                                  _subController.setButtonIndex(2);
                                  _subController
                                      .setUnitButtonColor(//button color
                                          [Colors.red, Color(0xffFFBA44)]);
                                  _subController.SetButtonText([
                                    controller.centerName[4],
                                    controller.centerName[5]
                                  ]);
                                  _subController.SetTitle(
                                      "${controller.title}> ${controller.buttonText[2]} ");
                                  _subController.SetLocationName(
                                      "Consumption Centers");
                                  _subController.chartOne.clear();
                                  _subController.chartTwo.clear();

                                  _subController.setSubDropValue1("Year");
                                  _subController.setSubDropValue2("Month");
                                  _subController.setSubDropValue3("Day");
                                  _subController.unitOneValue.clear();
                                  _subController.unitTwoValue.clear();

                                  BottomNavigation.changeProfileWidget(
                                      SubUnits());
                                },
                                    controller.dailyTotalUnit3 == 0.0
                                        ? _dailyUnitController.totalunit3
                                        : controller
                                            .dailyTotalUnit3, //total value of the unit

                                    controller
                                        .U3 //listData to reduce to min/max

                                    ),
                                getTiles(
                                    controller.colors[3],
                                    controller.buttonText[3],
                                    "assets/images/unit2.png", () {
                                  _subController
                                      .setUnitDetials(controller.unitFour);
                                  print(controller.centerName.length);
                                  controller.centerName.length == 7
                                      ? _subController.setButtonIndex(1)
                                      : _subController.setButtonIndex(2);
                                  _subController
                                      .setUnitButtonColor(//button color
                                          [Colors.red, Color(0xffFFBA44)]);
                                  controller.centerName.length == 7
                                      ? _subController.SetButtonText(
                                          [controller.centerName[6]])
                                      : _subController.SetButtonText([
                                          controller.centerName[6],
                                          controller.centerName[7]
                                        ]);
                                  _subController.SetTitle(
                                      "${controller.title}> ${controller.buttonText[3]} ");
                                  _subController.SetLocationName(
                                      "Consumption Centers");
                                  _subController.chartOne.clear();
                                  _subController.chartTwo.clear();

                                  _subController.setSubDropValue1("Year");
                                  _subController.setSubDropValue2("Month");
                                  _subController.setSubDropValue3("Day");
                                  _subController.unitOneValue.clear();
                                  _subController.unitTwoValue.clear();
                                  BottomNavigation.changeProfileWidget(
                                      SubUnits());
                                },
                                    controller.dailyTotalUnit4 == 0.0
                                        ? _dailyUnitController.totalunit4
                                        : controller.dailyTotalUnit4,
                                    controller.U4)
                              ],
                            )
                          : Container(),
                    ],
                  )),
            ]),
          );
        }));
  }

  getTiles(Color color, String val, imageText, VoidCallback onTap,
      double totalvalue, List<double> listData) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
          width: double.infinity,
          height: 73,
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
                        image: AssetImage(imageText),
                        color: white,
                        width: 50,
                        height: 50,
                      )),
                  Expanded(
                    flex: 9,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  val,
                                  style: TextStyle(color: white, fontSize: 20),
                                ),
                              ],
                            ),
                            Text(
                                "Total: $totalvalue" +
                                    " kWh", //{listData.reduce((value, element) => value + element)}
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
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
                            thickness: 2,
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Min: ${listData.reduce(min)}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            Text("Max: ${listData.reduce(max)}",
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
}
