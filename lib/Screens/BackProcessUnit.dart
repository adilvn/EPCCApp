import 'package:epcc/Models/constants.dart';
import 'package:epcc/Models/consumptionModel.dart';
import 'package:epcc/Models/data_modal.dart';
import 'package:epcc/Models/unitdatamodel.dart';
import 'package:epcc/Screens/subUnits.dart';
import 'package:epcc/controllers/BackProcess.dart';
import 'package:epcc/controllers/subUnitsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'bottom_navigation.dart';

// ignore: must_be_immutable
class BackProcessUnit extends GetView<BackProcessController> {
  List<ConsumptionValue> unitOnevalue = [];

  BackProcessUnit({required this.unitOnevalue});

  @override
  Widget build(BuildContext context) {
    controller.addDetails(unitOnevalue);
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
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/images/profile.jpg"))),
                  ),
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.sort,
                      size: 25,
                    )),
              )
            ]),
        body: Obx(() {
          return Column(children: [
            Expanded(
                flex: 2,
                child: Container(
                  color: epccBlue500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          BottomNavigation.backToHomePage(SubUnits(), 0, false);
                          controller.ListData.clear();
                          controller.chartOne.clear();
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          height: 35,
                          child: Icon(
                            Icons.arrow_back,
                            color: white,
                            size: 24,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        width: double.infinity,
                        height: 25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.centerRight,
                              width: 250,
                              height: 25,
                              child: Text(
                                "TP1>Unit 1>Consumption Center>",
                                style: TextStyle(color: epccBlue, fontSize: 12),
                              ),
                              decoration: BoxDecoration(
                                  color: white,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(30),
                                      bottomRight: Radius.circular(30))),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Back Process Unit 1",
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                      Divider(
                        indent: MediaQuery.of(context).size.width * 0.16,
                        endIndent: MediaQuery.of(context).size.width * 0.16,
                        color: white,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 3,
                      )
                    ],
                  ),
                )),
            Expanded(
                flex: 4,
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
                                  width: 120,
                                  height: 39,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: DropdownButton<String>(
                                    value: controller.BPDropValue1.value,
                                    disabledHint: Text("eh"),
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    ),
                                    iconSize: 24,
                                    elevation: 16,
                                    dropdownColor: Colors.red,
                                    focusColor: Colors.red,
                                    underline: Container(),
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    onChanged: (val) {
                                      controller.setBPDropValue1(val);
                                      controller.addDetails(unitOnevalue);
                                    },
                                    items: controller.BPDrop1.map<
                                            DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 15),
                                          child: Text(
                                            value,
                                            style:
                                                TextStyle(color: Colors.white),
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
                                      color: Colors.yellow,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: DropdownButton<String>(
                                    value: controller.BPDropValue2.value,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    ),
                                    iconSize: 24,
                                    elevation: 16,
                                    dropdownColor: Colors.yellow,
                                    focusColor: Colors.yellow,
                                    underline: Container(),
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    onChanged: (val) {
                                      controller.setBPDropValue2(val);
                                      controller.addDetails(unitOnevalue);
                                    },
                                    items: controller.BPDrop2.map<
                                            DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 15),
                                          child: Text(
                                            value,
                                            style:
                                                TextStyle(color: Colors.white),
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
                                  width: 120,
                                  height: 39,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: DropdownButton<String>(
                                    value: controller.BPDropValue3.value,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    ),
                                    iconSize: 24,
                                    elevation: 16,
                                    dropdownColor: Colors.green,
                                    focusColor: Colors.green,
                                    underline: Container(),
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    onChanged: (val) {
                                      controller.setBPDropValue3(val);
                                      controller.addDetails(unitOnevalue);
                                    },
                                    items: controller.BPDrop3.map<
                                            DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 15),
                                          child: Text(
                                            value,
                                            style:
                                                TextStyle(color: Colors.white),
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
                          flex: 8,
                          child: Container(
                            color: Colors.red,
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 0),
                                      width: double.infinity,
                                      height: 45,
                                      decoration: BoxDecoration(
                                          color: Colors.grey.shade300),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 140,
                                              child: Text(
                                                "Date",
                                                style: TextStyle(
                                                    color: Colors.red),
                                              ),
                                            ),
                                          ),
                                          VerticalDivider(
                                            color: Colors.black38,
                                            thickness: 1,
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              width: 150,
                                              child: Text(
                                                "Consumption (KWH)",
                                                style: TextStyle(
                                                    color: Colors.orange,
                                                    fontSize: 14),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(color: white),
                                      child: Container(
                                        child: ListView.builder(
                                            itemCount:
                                                controller.ListData.length,
                                            itemBuilder: (context, index) {
                                              return Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 10,
                                                    vertical: 0),
                                                width: double.infinity,
                                                height: 35,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Expanded(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 140,
                                                        child: Text(
                                                          "${controller.ListData[index].Date}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                    ),
                                                    VerticalDivider(
                                                      color: Colors.black38,
                                                      thickness: 1,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 150,
                                                        child: Text(
                                                          "${controller.ListData[index].Consumption}KWH",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              );
                                            }),
                                      ),
                                    )
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Material(
                                    type: MaterialType.card,
                                    child: Container(
                                      decoration: BoxDecoration(),
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.2,
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                            child: SfCartesianChart(
                                                primaryYAxis: NumericAxis(
                                                  numberFormat:
                                                      NumberFormat.compact(),
                                                  title: AxisTitle(
                                                      text: 'Consumption (KHW)',
                                                      textStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: 'Roboto',
                                                          fontSize: 12,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w300)),
                                                ),
                                                primaryXAxis: CategoryAxis(
                                                  title: AxisTitle(
                                                      text: 'Days',
                                                      textStyle: TextStyle(
                                                          color: Colors.black,
                                                          fontFamily: 'Roboto',
                                                          fontSize: 14,
                                                          fontStyle:
                                                              FontStyle.normal,
                                                          fontWeight:
                                                              FontWeight.w300)),
                                                ),
                                                series: <CartesianSeries>[
                                              FastLineSeries<ChartData, String>(
                                                  dataSource:
                                                      controller.chartOne,
                                                  xValueMapper:
                                                      (ChartData data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (ChartData data, _) =>
                                                          data.y,
                                                  // Renders the marker

                                                  markerSettings:
                                                      MarkerSettings(
                                                          isVisible: true)),
                                              LineSeries<ChartData, String>(
                                                  dataSource:
                                                      controller.chartTwo,
                                                  xValueMapper:
                                                      (ChartData data, _) =>
                                                          data.x,
                                                  yValueMapper:
                                                      (ChartData data, _) =>
                                                          data.y,
                                                  // Renders the marker
                                                  markerSettings:
                                                      MarkerSettings(
                                                          isVisible: true)),
                                            ])),
                                      ),
                                    ),
                                    elevation: 20,
                                    shadowColor: Colors.blue,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(40),
                                        topRight: Radius.circular(40)),
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          )),
                    ],
                  ),
                )),
          ]);
        }));
  }
}
