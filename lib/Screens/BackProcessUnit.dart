import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epcc/Models/constants.dart';
import 'package:epcc/Screens/subUnits.dart';
import 'package:epcc/controllers/BackProcess.dart';
import 'package:epcc/controllers/profileController.dart';
import 'package:epcc/controllers/subUnitsController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'bottom_navigation.dart';

// ignore: must_be_immutable
class BackProcessUnit extends GetView<BackProcessController> {
  List<ConsumptionValue> unitOnevalue = [];

  BackProcessUnit({required this.unitOnevalue});
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final _profileController = Get.find<ProfileController>();

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
          return Column(children: [
            Expanded(
                flex: 2,
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
                          BottomNavigation.backToHomePage(SubUnits(), 0, false);
                          controller.ListData!.clear();
                          controller.chartOne.clear();
                          controller.setBPDropValue1("-");
                          controller.setBPDropValue2("-");

                          controller.setBPDropValue3("-");
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          height: 35,
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
                              "${controller.title}",
                              style: TextStyle(
                                  color: epccBlue,
                                  fontSize: 12,
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
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        controller.locationName != "PP1 ,PP2 ,PP3\r\n"
                            ? controller.locationName
                                .replaceAll("/", " / ")
                                .capitalize
                                .toString()
                            : controller.locationName.toUpperCase(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        indent: MediaQuery.of(context).size.width * 0.18,
                        endIndent: MediaQuery.of(context).size.width * 0.18,
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
                                  width: 120,
                                  height: 39,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(30)),
                                  child: DropdownButton<String>(
                                    menuMaxHeight:
                                        MediaQuery.of(context).size.width,
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
                                      color: Color(0xffFFBA44),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: DropdownButton<String>(
                                    menuMaxHeight:
                                        MediaQuery.of(context).size.width,
                                    value: controller.BPDropValue2.value,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    ),
                                    iconSize: 24,
                                    elevation: 16,
                                    dropdownColor: Color(0xffFFBA44),
                                    focusColor: Color(0xffFFBA44),
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
                                    menuMaxHeight:
                                        MediaQuery.of(context).size.width,
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
                                            color: Colors.black12,
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
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.43,
                                      decoration: BoxDecoration(color: white),
                                      child: Container(
                                        child: ListView.builder(
                                            itemCount:
                                                controller.ListData!.length,
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
                                                          "${controller.ListData![index].Date}",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ),
                                                    ),
                                                    VerticalDivider(
                                                      color: Colors.black12,
                                                      thickness: 1,
                                                    ),
                                                    Expanded(
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        width: 150,
                                                        child: Text(
                                                          "${controller.ListData![index].Consumption}KWH",
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
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                      child: Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Container(
                                            child: controller.chartOne.isEmpty
                                                ? Container()
                                                : SfCartesianChart(
                                                    plotAreaBorderColor:
                                                        Colors.white,
                                                    primaryYAxis: NumericAxis(
                                                      numberFormat: NumberFormat
                                                          .compact(),
                                                      title: AxisTitle(
                                                          text:
                                                              'Consumption (KHW)',
                                                          textStyle: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 12,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300)),
                                                    ),
                                                    primaryXAxis: CategoryAxis(
                                                      title: AxisTitle(
                                                          text: 'Days',
                                                          textStyle: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontSize: 14,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .normal,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300)),
                                                    ),
                                                    series: <CartesianSeries>[
                                                        FastLineSeries<ChartData,
                                                                String>(
                                                            dataSource:
                                                                controller
                                                                    .chartOne,
                                                            xValueMapper:
                                                                (ChartData data,
                                                                        _) =>
                                                                    data.x,
                                                            yValueMapper:
                                                                (ChartData data,
                                                                        _) =>
                                                                    data.y,
                                                            // Renders the marker

                                                            markerSettings: MarkerSettings(
                                                                isVisible: controller
                                                                            .chartOne
                                                                            .length ==
                                                                        1
                                                                    ? true
                                                                    : false)),
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
