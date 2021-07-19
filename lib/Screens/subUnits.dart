import 'package:epcc/Models/constants.dart';
import 'package:epcc/Models/consumptionModel.dart';
import 'package:epcc/Models/data_modal.dart';
import 'package:epcc/Models/unitdatamodel.dart';
import 'package:epcc/Screens/BackProcessUnit.dart';
import 'package:epcc/Screens/bottom_navigation.dart';
import 'package:epcc/Screens/unitsPage.dart';
import 'package:epcc/controllers/HomeController.dart';
import 'package:epcc/controllers/subUnitsController.dart';
import 'package:epcc/routes/AppPages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class SubUnits extends GetView<SubUnitsController> {
  List<ConsumptionModel> unitOneDetails = [];

  List<String> buttonText = [];
  List<Color> buttonColor = [];
  String title = "";
  String locationName = '';

  int button = 0;
  SubUnits(
      {required this.unitOneDetails,
      required this.buttonText,
      required this.buttonColor,
      required this.title,
      required this.button,
      required this.locationName});

  SubUnitsController controller = Get.put(SubUnitsController());

  @override
  Widget build(BuildContext context) {
    controller.addChartDetails(unitOneDetails, button, buttonText);
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
              flex: 3,
              child: Container(
                color: epccBlue500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GetBuilder<HomeController>(
                        init: HomeController(),
                        builder: (controller) {
                          return GestureDetector(
                            onTap: () {},
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
                          );
                        }),
                    Container(
                      alignment: Alignment.bottomLeft,
                      width: double.infinity,
                      height: 25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: 100,
                            height: 25,
                            child: Text(
                              "TP1>Unit 1>",
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
                      "Consumption Center",
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
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(30)),
                                child: DropdownButton<String>(
                                  value: controller.SubDropValue1.value,
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
                                  iconSize: 24,
                                  elevation: 16,
                                  dropdownColor: Colors.red,
                                  focusColor: Colors.red,
                                  underline: Container(),
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  onChanged: (val) {
                                    controller.setSubDropValue1(val);
                                  },
                                  items: controller.SubDrop1.map<
                                      DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Container(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.white),
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
                                  value: controller.SubDropValue2.value,
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
                                  iconSize: 24,
                                  elevation: 16,
                                  dropdownColor: Colors.yellow,
                                  focusColor: Colors.yellow,
                                  underline: Container(),
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  onChanged: (val) {
                                    controller.setSubDropValue2(val);
                                  },
                                  items: controller.SubDrop2.map<
                                      DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Container(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.white),
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
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(30)),
                                child: DropdownButton<String>(
                                  value: controller.SubDropValue3.value,
                                  icon: const Icon(
                                    Icons.arrow_drop_down,
                                    color: Colors.white,
                                  ),
                                  iconSize: 24,
                                  elevation: 16,
                                  dropdownColor: Colors.green,
                                  focusColor: Colors.green,
                                  underline: Container(),
                                  style:
                                      const TextStyle(color: Colors.deepPurple),
                                  onChanged: (val) {
                                    controller.setSubDropValue3(val);
                                  },
                                  items: controller.SubDrop3.map<
                                      DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Container(
                                        padding: EdgeInsets.only(left: 15),
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.white),
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
                                          text: 'Consumption (KHW)',
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
                                          dataLabelSettings: DataLabelSettings(
                                              textStyle: TextStyle(fontSize: 9),
                                              labelAlignment:
                                                  ChartDataLabelAlignment.outer,
                                              isVisible: true),
                                          dataSource: controller.chartOne,
                                          xValueMapper:
                                              (ChartDataSub data, _) => data.x,
                                          yValueMapper:
                                              (ChartDataSub data, _) => data.y),
                                      ColumnSeries<ChartDataSub, String>(
                                          pointColorMapper:
                                              (ChartDataSub color, _) =>
                                                  Colors.yellow,
                                          // Hiding the legend item for this series
                                          dataLabelSettings: DataLabelSettings(
                                              labelAlignment:
                                                  ChartDataLabelAlignment.outer,
                                              isVisible: true),
                                          dataSource: controller.chartTwo,
                                          xValueMapper:
                                              (ChartDataSub data, _) => data.x,
                                          yValueMapper:
                                              (ChartDataSub data, _) => data.y)
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
            child: ListView.builder(
              itemCount: button,
              itemBuilder: (context, index) {
                return getTiles(buttonColor[index], buttonText[index],
                    "assets/images/750.png", () {
                  BottomNavigation.changeProfileWidget(BackProcessUnit(
                    list: [],
                  ));
                });
              },
            ),
          ),
        ]);
      }),
    );
  }

  getTiles(Color color, String val, textImage, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
          width: double.infinity,
          height: 75,
          color: color,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Icon(
              //       Icons.bar_chart,
              //       size: 16,
              //     ),
              //     Text("Reports",
              //         style: TextStyle(color: Colors.white70, fontSize: 12))
              //   ],
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 2,
                      child: Container(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.ballot_rounded,
                          color: white,
                          size: 37,
                        ),
                      )),
                  Expanded(
                    flex: 9,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  val,
                                  style: TextStyle(color: white, fontSize: 16),
                                ),
                                // Text("(Last checked 2 hours ago)",
                                //     style: TextStyle(
                                //         color: Colors.white70, fontSize: 10)),
                              ],
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total:32434Kwh",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 9)),
                            Text("Min:32434Kwh",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 9)),
                            Text("Max:32434Kwh",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 9)),
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
