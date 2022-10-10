import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epcc/Models/constants.dart';
import 'package:epcc/Screens/BackProcessUnit.dart';
import 'package:epcc/Screens/bottom_navigation.dart';
import 'package:epcc/Screens/unitsPage.dart';
import 'package:epcc/controllers/BackProcess.dart';
import 'package:epcc/controllers/profileController.dart';
import 'package:epcc/controllers/subUnitsController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SubUnits extends GetView<SubUnitsController> {
  final _controller = Get.find<BackProcessController>();
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final _profileController = Get.find<ProfileController>();
  @override
  Widget build(BuildContext context) {
    controller.addChartDetails(
        controller.unitDetails, controller.button, controller.buttonText);
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
                                  var val =
                                      data.length == 3 ? "image" : "full_name";
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
                                          placeholder: (context, url) => Center(
                                              child: CupertinoActivityIndicator(
                                            radius: 8,
                                          )),
                                          errorWidget: (context, url, error) =>
                                              Center(
                                            child: Icon(
                                              Icons.person,
                                              size: 30,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ));
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
        return FadeInLeft(
          animate: true,
          duration: Duration(milliseconds: 400),
          child: Column(children: [
            Expanded(
                flex: 3,
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
                              UnitsPage(), 0, false);
                          controller.chartOne.clear();
                          controller.chartTwo.clear();

                          controller.setSubDropValue1("Year");
                          controller.setSubDropValue2("Month");
                          controller.setSubDropValue3("Day");
                          controller.unitOneValue.clear();
                          controller.unitTwoValue.clear();
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
                            padding: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 2),
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
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Text(
                        "Consumption Centers",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Divider(
                        indent: MediaQuery.of(context).size.width * 0.16,
                        endIndent: MediaQuery.of(context).size.width * 0.16,
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                      borderRadius: BorderRadius.circular(30)),
                                  child: DropdownButton<String>(
                                    menuMaxHeight:
                                        MediaQuery.of(context).size.width,
                                    value: controller.SubDropValue1.value,
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
                                      print('selected value: $val');
                                      controller.setSubDropValue1(val);
                                      controller.addChartDetails(
                                        controller.unitDetails,
                                        controller.button,
                                        controller.buttonText,
                                      );
                                    },
                                    items: controller.SubDrop1.map<
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
                                      borderRadius: BorderRadius.circular(25)),
                                  child: DropdownButton<String>(
                                    menuMaxHeight:
                                        MediaQuery.of(context).size.width,
                                    value: controller.SubDropValue2.value,
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
                                      controller.setSubDropValue2(val);
                                      controller.addChartDetails(
                                          controller.unitDetails,
                                          controller.button,
                                          controller.buttonText);
                                    },
                                    items: controller.SubDrop2.map<
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
                                      borderRadius: BorderRadius.circular(30)),
                                  child: DropdownButton<String>(
                                    menuMaxHeight:
                                        MediaQuery.of(context).size.width,
                                    value: controller.SubDropValue3.value,
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
                                      controller.setSubDropValue3(val);
                                      controller.addChartDetails(
                                          controller.unitDetails,
                                          controller.button,
                                          controller.buttonText);
                                    },
                                    items: controller.SubDrop3.map<
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
                              child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 6),
                                  child: SfCartesianChart(
                                      primaryYAxis: NumericAxis(
                                        numberFormat: NumberFormat.compact(),
                                        title: AxisTitle(
                                            text: 'Consumption (kWh)',
                                            textStyle: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Roboto',
                                                fontSize: 14,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w300)),
                                      ),
                                      primaryXAxis: CategoryAxis(
                                        title: AxisTitle(
                                            text: 'Days',
                                            textStyle: TextStyle(
                                                color: Colors.black,
                                                fontFamily: 'Roboto',
                                                fontSize: 14,
                                                fontStyle: FontStyle.normal,
                                                fontWeight: FontWeight.w300)),
                                      ),
                                      series: <ColumnSeries>[
                                        ColumnSeries<ChartDataSub, String>(
                                            pointColorMapper:
                                                (ChartDataSub color, _) =>
                                                    Colors.red,
                                            dataLabelSettings:
                                                DataLabelSettings(
                                                    textStyle:
                                                        TextStyle(fontSize: 9),
                                                    labelAlignment:
                                                        ChartDataLabelAlignment
                                                            .outer,
                                                    isVisible: true),
                                            dataSource: controller.chartOne,
                                            xValueMapper:
                                                (ChartDataSub data, _) =>
                                                    data.x,
                                            yValueMapper:
                                                (ChartDataSub data, _) =>
                                                    data.y),
                                        ColumnSeries<ChartDataSub, String>(
                                            pointColorMapper:
                                                (ChartDataSub color, _) =>
                                                    Color(0xffFFBA44),
                                            // Hiding the legend item for this series
                                            dataLabelSettings:
                                                DataLabelSettings(
                                                    textStyle:
                                                        TextStyle(fontSize: 9),
                                                    labelAlignment:
                                                        ChartDataLabelAlignment
                                                            .outer,
                                                    isVisible: true),
                                            dataSource: controller.chartTwo,
                                            xValueMapper:
                                                (ChartDataSub data, _) =>
                                                    data.x,
                                            yValueMapper:
                                                (ChartDataSub data, _) =>
                                                    data.y)
                                      ])),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
            Expanded(
              flex: 3,
              child: ListView(
                children: [
                  getTiles(controller.colors[0], controller.buttonText[0],
                      "assets/images/bp.png", () {
                    _controller.SetLocationName(controller.buttonText[0]);
                    _controller.ListData!.clear();
                    _controller.chartOne.clear();
                    _controller.setBPDropValue1("Year");
                    _controller.setBPDropValue2("Month");
                    _controller.SetTitle(controller.buttonText[0] !=
                            "PP1 ,PP2 ,PP3\r\n"
                        ? "${controller.title}> ${controller.buttonText[0].capitalize}"
                        : "${controller.title}> PP1 ,PP2 ,PP3");
                    _controller.setBPDropValue3("Day");
                    BottomNavigation.changeProfileWidget(
                        BackProcessUnit(unitOnevalue: controller.unitOneValue));
                  }, controller.u1,
                      dailyConsumptionValue:
                          controller.dropDownConsumptionValueUnit1 == 0.0
                              ? controller.unit1DailyConsumptionValue.toString()
                              : controller.dropDownConsumptionValueUnit1
                                  .toString()),
                  controller.button == 2
                      ? getTiles(controller.colors[1], controller.buttonText[1],
                          "assets/images/sw.png", () {
                          print("called");

                          _controller.SetTitle(
                              "${controller.title}> ${controller.buttonText[1]} ");
                          _controller.SetLocationName(controller.buttonText[1]);
                          _controller.ListData!.clear();
                          _controller.chartOne.clear();
                          _controller.setBPDropValue1("Year");
                          _controller.setBPDropValue2("Month");

                          _controller.setBPDropValue3("Day");
                          BottomNavigation.changeProfileWidget(BackProcessUnit(
                              unitOnevalue: controller.unitTwoValue));
                        }, controller.u2,
                          dailyConsumptionValue:
                              controller.dropDownConsumptionValueUnit2 == 0.0
                                  ? controller.unit2DailyConsumptionValue
                                      .toString()
                                  : controller.dropDownConsumptionValueUnit2
                                      .toString())
                      : Container()
                ],
              ),
            ),
          ]),
        );
      }),
    );
  }

  getTiles(Color color, String consumptionCenterName, textImage,
      VoidCallback onTap, List<double> list,
      {String? dailyConsumptionValue}) {
    print(consumptionCenterName);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
          width: double.infinity,
          // height: 70,
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
                    child: Container(
                      width: 50,
                      height: 50,
                      child: Image.asset(textImage),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SizedBox(
                                child:
                                    // Row(
                                    //   children: [
                                    Text(
                                  consumptionCenterName != "PP1 ,PP2 ,PP3\r\n"
                                      ? consumptionCenterName
                                              .replaceAll("/", " / ")
                                              .replaceAll("\r\n", "")
                                              .capitalize
                                              .toString() +
                                          "$dailyConsumptionValue" +
                                          " kWh"
                                      : "PP1 ,PP2 ,PP3",
                                  style: TextStyle(color: white, fontSize: 15),
                                ),
                                //   ],
                                // ),
                              ),
                            ),
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
                        list.isEmpty
                            ? SizedBox.shrink()
                            // Row(
                            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           // Text("Total:32434Kwh",
                            //           //     style: TextStyle(
                            //           //         color: Colors.white, fontSize: 16)),
                            //           Text("Min:32434", style: TextStyle(color: Colors.white, fontSize: 16)),
                            //           Text("Max:32434", style: TextStyle(color: Colors.white, fontSize: 16)),
                            //         ],
                            //       )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Text(
                                  //     "Total: ${list.reduce((value, element) => value + element)}Kwh",
                                  //     style: TextStyle(
                                  //         color: Colors.white, fontSize: 16)),
                                  Text(
                                      "Min: ${list.reduce(min)}", //(value, element) => value < element ? value : element
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  Text(
                                      "Max: ${list.reduce(max)}", //(value, element) => value > element ? value : element)
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
