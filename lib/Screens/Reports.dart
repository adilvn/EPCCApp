import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epcc/Models/constants.dart';
import 'package:epcc/controllers/profileController.dart';
import 'package:epcc/controllers/reportController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reports extends StatefulWidget {
  Reports({Key? key}) : super(key: key);

  @override
  _ReportsState createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  final _controller = Get.put(() => ReportController());

  final controller = Get.find<ReportController>();
  void getData() async {
    controller.setValueBool(true);
    Future.delayed(Duration(milliseconds: 200), () {
      controller.addDataList();
      controller.setValueBool(false);
    });
  }

  final _profileController = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    getData();
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
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: FutureBuilder<DocumentSnapshot>(
                      future: users.doc(_profileController.uid).get(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData &&
                            snapshot.connectionState == ConnectionState.done) {
                          Map<String, dynamic> data =
                              snapshot.data!.data() as Map<String, dynamic>;
                          var val = data.length == 3 ? "image" : "full_name";
                          return data[val] == ""
                              ? Container()
                              : Container(
                                  child: CachedNetworkImage(
                                      imageUrl: data[val],
                                      imageBuilder: (context, imageProvider) =>
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
                                          )),
                                );
                        } else {
                          return Container();
                        }
                      }),
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
              ],
            ),
          ),
          // actions: <Widget>[
          //   Transform.rotate(
          //     transformHitTests: true,
          //     angle: 3.15,
          //     child: IconButton(
          //         onPressed: () => {},
          //         icon: Icon(
          //           Icons.sort,
          //           size: 25,
          //         )),
          //   )
          // ]
        ),
        body: Obx(() {
          return controller.allReportsData.isEmpty || controller.isLoading
              ? Container(
                  child: Center(child: Text("Fetching Data...")),
                )
              : Column(children: [
                  Expanded(
                      flex: 1,
                      child: Container(
                        color: epccBlue500,
                        height: 32,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // GestureDetector(
                            //   onTap: () {},
                            //   child: Container(
                            //     padding: EdgeInsets.symmetric(horizontal: 20),
                            //     alignment: Alignment.centerLeft,
                            //     width: double.infinity,
                            //     height: 30,
                            //     child: Icon(
                            //       Icons.arrow_back,
                            //       color: white,
                            //       size: 24,
                            //     ),
                            //   ),
                            // ),
                            Text(
                              "Reports",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                            Divider(
                              indent: MediaQuery.of(context).size.width * 0.3,
                              endIndent:
                                  MediaQuery.of(context).size.width * 0.3,
                              color: white,
                              thickness: 1,
                            ),
                          ],
                        ),
                      )),
                  Expanded(
                      flex: 5,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 2),
                              width: double.infinity,
                              height: 65,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 39,
                                        decoration: BoxDecoration(
                                            // color: ddbcolor,
                                            color: ddbcolor,
                                            border: dropdownBorderColor,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        // TODO Drop 1 TP/PP Drop Down
                                        child: DropdownButton<String>(
                                          menuMaxHeight:
                                              MediaQuery.of(context).size.width,
                                          value: controller.TPDropValue,
                                          disabledHint: Text("one"),
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
                                            controller.setTPDropDownValue(val);
                                            print("Drop down 1 " +
                                                val.toString());
                                            controller.setDrop2List(val!);
                                            getData();

                                            // controller.addDataList();
                                          },
                                          items: controller.TPDropDownList.map<
                                                  DropdownMenuItem<String>>(
                                              (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2),
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      color: dbTextColor,
                                                      fontSize: 12),
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
                                        // TODO Drop 2 Unit Drop Down
                                        child: DropdownButton<String>(
                                          menuMaxHeight:
                                              MediaQuery.of(context).size.width,
                                          value: controller.UnitDropValue,
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
                                            print("Unit Drop Down: $val!");
                                            controller
                                                .setUnitDropDownValue(val);
                                            controller.setUnitsDropList(val!);
                                            getData();
                                            // controller.addDataList();
                                          },
                                          items: controller.UnitDropDownList
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 2),
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      color: dbTextColor,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5),
                                      child: Container(
                                        alignment: Alignment.center,
                                        height: 39,
                                        decoration: BoxDecoration(
                                            color: ddbcolor,
                                            border: dropdownBorderColor,
                                            borderRadius:
                                                BorderRadius.circular(30)),
                                        // TODO Drop 3 Consumption Drop down
                                        child: DropdownButton<String>(
                                          menuMaxHeight:
                                              MediaQuery.of(context).size.width,
                                          value:
                                              controller.ConsumptionDropValue,
                                          //  controller.BPDropValue ==
                                          //         "PP1 ,PP2 ,PP3\r\n"
                                          //     ? "PP1 ,PP2 ,PP3"
                                          //     : controller.BPDropValue ==
                                          //             "Back process Unit 2\r\n"
                                          //         ? "Back process Unit 2"
                                          //         : controller.BPDropValue,
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
                                            controller
                                                .setConsumptionDropValue(val);
                                            getData();
                                            // controller.addDataList();
                                          },
                                          items: controller.ConsumptionDropList
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 10),
                                                child: Text(
                                                  value == "PP1 ,PP2 ,PP3\r\n"
                                                      ? " PP1 ,PP2 ,PP3"
                                                      : value ==
                                                              "Back process Unit 2\r\n"
                                                          ? "Back process Unit 2"
                                                          : value,
                                                  style: TextStyle(
                                                      color: dbTextColor,
                                                      fontSize: 12),
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
                            Container(
                              width: double.infinity,
                              height: 65,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                        // TODO Drop 4 Year Drop Down
                                        child: DropdownButton<String>(
                                          menuMaxHeight:
                                              MediaQuery.of(context).size.width,
                                          value: controller.YearValue,
                                          disabledHint: Text("eh"),
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
                                            log('Year dropdown selected value: $val');

                                            controller
                                                .setYearDropDownValue(val);
                                            getData();
                                            // controller.addDataList();
                                          },
                                          items: controller.yearDropList
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 15),
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      color: dbTextColor),
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
                                        // TODO Drop 5 Month Drop Down
                                        child: DropdownButton<String>(
                                          menuMaxHeight:
                                              MediaQuery.of(context).size.width,
                                          value: controller.MonthValue,
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
                                            log('month dropdown selected value: $val');
                                            controller
                                                .setMonthDropDownValue(val);
                                            getData();
                                            // controller.addDataList();
                                          },
                                          items: controller.monthDropList
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Container(
                                                padding:
                                                    EdgeInsets.only(left: 15),
                                                child: Text(
                                                  value,
                                                  style: TextStyle(
                                                      color: dbTextColor),
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
                                child: Container(
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 0),
                                          width: double.infinity,
                                          height: 55,
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
                                                    "Month",
                                                    style: TextStyle(
                                                        color: Colors.red,
                                                        fontSize: 13),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  width: 140,
                                                  child: Text(
                                                    "Consumption",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .yellow.shade900,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 13),
                                                  ),
                                                ),
                                              ),
                                              // Expanded(
                                              //   child: Container(
                                              //     alignment: Alignment.center,
                                              //     width: 140,
                                              //     child: Text(
                                              //       "Last Year",
                                              //       style: TextStyle(
                                              //           color: Colors.blue,
                                              //           fontSize: 13),
                                              //     ),
                                              //   ),
                                              // ),
                                              // Expanded(
                                              //   child: Container(
                                              //     alignment: Alignment.center,
                                              //     width: 140,
                                              //     child: Text(
                                              //       "Change",
                                              //       style: TextStyle(
                                              //           color: Colors.blue,
                                              //           fontSize: 13),
                                              //     ),
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),

                                      // TODO list initailize
                                      Expanded(
                                        flex: 6,
                                        child: Container(
                                          alignment: Alignment.topCenter,
                                          width: double.infinity,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width -
                                              100,
                                          decoration:
                                              BoxDecoration(color: white),
                                          child: Container(
                                            child: ListView.builder(
                                                reverse: true,
                                                shrinkWrap: true,
                                                addAutomaticKeepAlives: true,
                                                addRepaintBoundaries: true,
                                                addSemanticIndexes: true,
                                                primary: true,
                                                itemCount:
                                                    controller.dataList.length,
                                                itemBuilder: (context, index) {
                                                  return controller
                                                              .dataList[index]
                                                              .monthSum !=
                                                          0
                                                      ? Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10,
                                                                  vertical: 0),
                                                          width:
                                                              double.infinity,
                                                          height: 35,
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  width: 140,
                                                                  child: Text(
                                                                    controller
                                                                        .dataList[
                                                                            index]
                                                                        .monthName
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            11),
                                                                  ),
                                                                ),
                                                              ),
                                                              VerticalDivider(
                                                                thickness: 1,
                                                              ),
                                                              Expanded(
                                                                child:
                                                                    Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  width: 140,
                                                                  child: Text(
                                                                    "${controller.dataList[index].monthSum} Kwh",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            11),
                                                                  ),
                                                                ),
                                                              ),
                                                              // VerticalDivider(
                                                              //   thickness: 1,
                                                              // ),
                                                              // Expanded(
                                                              //   child: Container(
                                                              //     alignment: Alignment
                                                              //         .center,
                                                              //     width: 140,
                                                              //     child: Text(
                                                              //       "${controller.dataList[index].lastYear} kwh",
                                                              //       style: TextStyle(
                                                              //           fontSize: 11),
                                                              //     ),
                                                              //   ),
                                                              // ),
                                                              // VerticalDivider(
                                                              //   thickness: 1,
                                                              // ),
                                                              // Expanded(
                                                              //   child: Container(
                                                              //     alignment: Alignment
                                                              //         .center,
                                                              //     width: 140,
                                                              //     child: Text(
                                                              //       "${controller.dataList[index].change} KWh",
                                                              //       style: TextStyle(
                                                              //           fontSize: 11),
                                                              //     ),
                                                              //   ),
                                                              // ),
                                                            ],
                                                          ),
                                                        )
                                                      : Container();
                                                }),
                                          ),
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
