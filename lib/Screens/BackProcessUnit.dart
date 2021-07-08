import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:epcc/Models/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BackProcessUnit extends StatelessWidget {
  BackProcessUnit({Key? key}) : super(key: key);
  final List<ChartData> chartData = [
    ChartData("Jan-1", 20000),
    ChartData("Jan-2", 30000),
    ChartData("Jan-3", 20000),
    ChartData("Jan-4", 40000),
    ChartData("Jan-5", 2000),
  ];
  final List<ChartData> chartData2 = [
    ChartData("Jan-1", 30000),
    ChartData("Jan-2", 40000),
    ChartData("Jan-3", 20000),
    ChartData("Jan-4", 60000),
    ChartData("Jan-5", 10000),
  ];
  @override
  Widget build(BuildContext context) {
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
                    onPressed: () => Scaffold.of(context).openDrawer(),
                    icon: Icon(
                      Icons.sort,
                      size: 25,
                    )),
              )
            ]),
        body: Column(children: [
          Expanded(
              flex: 1,
              child: Container(
                color: epccBlue500,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
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
                          Container(
                            width: 120,
                            height: 50,
                            child: AwesomeDropDown(
                              elevation: 5,
                              dropDownIconBGColor: Colors.red,
                              dropDownOverlayBGColor: Colors.red,
                              padding: 10,
                              numOfListItemToShow: 6,
                              selectedItemTextStyle: TextStyle(color: white),
                              dropDownListTextStyle:
                                  TextStyle(color: white, fontSize: 18),
                              dropDownIcon: Icon(
                                Icons.arrow_drop_down,
                                color: white,
                                size: 24,
                              ),
                              dropDownBGColor: Colors.red,
                              dropDownList: [
                                "2020",
                                "2019",
                                "2018",
                                "2017",
                                "2016",
                                "2015",
                                "2014",
                                "2013"
                              ],
                            ),
                          ),
                          Container(
                            width: 120,
                            height: 50,
                            child: AwesomeDropDown(
                              elevation: 5,
                              dropDownIconBGColor: Colors.orange,
                              dropDownOverlayBGColor: Colors.orange,
                              padding: 10,
                              numOfListItemToShow: 6,
                              selectedItemTextStyle: TextStyle(color: white),
                              dropDownListTextStyle:
                                  TextStyle(color: white, fontSize: 18),
                              dropDownIcon: Icon(
                                Icons.arrow_drop_down,
                                color: white,
                                size: 24,
                              ),
                              dropDownBGColor: Colors.orange,
                              dropDownList: [
                                "Jan",
                                "Feb",
                                "Mar",
                                "April",
                                "May",
                                "june",
                                "July"
                              ],
                            ),
                          ),
                          Container(
                            width: 120,
                            height: 50,
                            child: AwesomeDropDown(
                              elevation: 5,
                              dropDownIconBGColor: Colors.green,
                              dropDownOverlayBGColor: Colors.green,
                              numOfListItemToShow: 6,
                              selectedItemTextStyle: TextStyle(color: white),
                              dropDownListTextStyle:
                                  TextStyle(color: white, fontSize: 18),
                              dropDownIcon: Icon(
                                Icons.arrow_drop_down,
                                color: white,
                                size: 24,
                              ),
                              dropDownBGColor: Colors.green,
                              dropDownList: [
                                "1",
                                "2",
                                "3",
                                "4",
                                "5",
                                "6",
                                "7",
                                "8",
                                "9",
                                "10"
                              ],
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
                          color: Colors.red,
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Container(
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
                                        Container(
                                          alignment: Alignment.center,
                                          width: 140,
                                          child: Text(
                                            "Date",
                                            style: TextStyle(color: Colors.red),
                                          ),
                                        ),
                                        VerticalDivider(
                                          color: Colors.black38,
                                          thickness: 1,
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 150,
                                          child: Text(
                                            "Consumption (KWH)",
                                            style:
                                                TextStyle(color: Colors.orange),
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
                                          itemCount: 50,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 0),
                                              width: double.infinity,
                                              height: 35,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 140,
                                                    child: Text(
                                                      "Jan-$index-2020",
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  VerticalDivider(
                                                    color: Colors.black38,
                                                    thickness: 1,
                                                  ),
                                                  Container(
                                                    alignment: Alignment.center,
                                                    width: 150,
                                                    child: Text(
                                                      "${index * 1233}KWH",
                                                      style: TextStyle(
                                                          color: Colors.black),
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
                                    height: MediaQuery.of(context).size.height *
                                        0.3,
                                    child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 20),
                                        child: SfCartesianChart(
                                            primaryYAxis: NumericAxis(
                                              numberFormat:
                                                  NumberFormat.compact(),
                                              title: AxisTitle(
                                                  text: 'Consumption (KHW)',
                                                  textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontFamily: 'Roboto',
                                                      fontSize: 14,
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
                                                  dataSource: chartData,
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
                                                  dataSource: chartData2,
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
        ]));
  }
}

class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
