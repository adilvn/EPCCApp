import 'dart:math';

import 'package:epcc/Models/constants.dart';
import 'package:epcc/Screens/login_screen.dart';
import 'package:epcc/routes/AppPages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    late List<ChartData> _chartData;

    final List<ChartData> chartData = [
      ChartData('TP1', 25, Color(0xffFF6F00)),
      ChartData('TP2', 38, Color(0xff7C4DFF)),
      ChartData('TP3', 34, Color(0xff2196F3)),
      ChartData('TP4', 52, Color(0xffFF4040)),
      ChartData('PP', 52, Color(0xffFFA640))
    ];

    void initState() {
      _chartData = getChartData();
      super.initState();
    }

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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(color: Colors.white, fontSize: 27),
                    ),
                    Divider(
                      indent: MediaQuery.of(context).size.width * 0.3,
                      endIndent: MediaQuery.of(context).size.width * 0.3,
                      color: white,
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              )),
          Expanded(
              flex: 2,
              child: Container(
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: SfCircularChart(
                          tooltipBehavior: TooltipBehavior(
                              duration: 2,
                              builder: (a, b, c, d, e) {
                                return Text("ehlo");
                              }),
                          annotations: <CircularChartAnnotation>[
                            CircularChartAnnotation(
                                widget: Container(
                                    child: const Text('677773',
                                        style: TextStyle(
                                            color: Color.fromRGBO(0, 0, 0, 0.5),
                                            fontSize: 16))))
                          ],
                          legend: Legend(
                            isVisible: false,
                          ),
                          series: <CircularSeries>[
                            DoughnutSeries<ChartData, String>(
                                enableTooltip: true,
                                innerRadius: "60%",
                                pointColorMapper: (ChartData data, _) =>
                                    data.color,
                                dataSource: chartData,
                                enableSmartLabels: true,
                                dataLabelMapper: (ChartData data, _) => data.x,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                dataLabelSettings: DataLabelSettings(
                                  isVisible: true,
                                ))
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          getContainer(Color(0xffFF6F00), "99%", "12133"),
                          getContainer(Color(0xff7C4DFF), "99%", "42432"),
                          getContainer(Color(0xff2196F3), "99%", "322343"),
                          getContainer(Color(0xffFF4040), "99%", "234234"),
                          getContainer(Color(0xffFFA640), "99%", "23424"),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 0,
                        child: SizedBox(
                          width: 10,
                        ))
                  ],
                ),
              )),
          Expanded(
            flex: 3,
            child: ListView(
              children: [
                getTiles(Color(0xffFF6F00), "TP1", "assets/images/748.png", () {
                  Get.toNamed(AppPages.UNITSPAGE);
                }),
                getTiles(Color(0xff7C4DFF), "TP2", "assets/images/749.png", () {
                  Get.toNamed(AppPages.UNITSPAGE);
                }),
                getTiles(Color(0xff2196F3), "TP3", "assets/images/750.png", () {
                  Get.toNamed(AppPages.UNITSPAGE);
                }),
                getTiles(Color(0xffFF4040), "TP4", "assets/images/751.png", () {
                  Get.toNamed(AppPages.UNITSPAGE);
                }),
                getTiles(Color(0xffFFA640), "PP", "assets/images/752.png", () {
                  Get.toNamed(AppPages.UNITSPAGE);
                }),
              ],
            ),
          ),
        ]));
  }

  getTiles(Color color, String val, imageText, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          width: double.infinity,
          height: 75,
          color: color,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.bar_chart,
                    color: white,
                    size: 16,
                  ),
                  Text("Reports",
                      style: TextStyle(color: Colors.white70, fontSize: 12))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      flex: 2,
                      child: Image(
                        alignment: Alignment.topCenter,
                        image: AssetImage(imageText),
                        color: white,
                        width: 50,
                        height: 50,
                      )),
                  Expanded(
                    flex: 10,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  val,
                                  style: TextStyle(color: white, fontSize: 18),
                                ),
                                Text("(Last checked 2 hours ago)",
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 10)),
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
                                    color: Colors.white70, fontSize: 10)),
                            Text("Min:32434Kwh",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 10)),
                            Text("Max:32434Kwh",
                                style: TextStyle(
                                    color: Colors.white70, fontSize: 10)),
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

  getContainer(Color color, String value, value2) {
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
            Text(value),
            SizedBox(
              width: 10,
            ),
            Text(value2 + " KWH")
          ],
        ),
      ),
    );
  }
}

List<ChartData> getChartData() {
  final List<ChartData> chartData = [
    ChartData('TP1', 25, Color.fromRGBO(9, 0, 136, 1)),
    ChartData('TP2', 38, Color.fromRGBO(147, 0, 119, 1)),
    ChartData('TP3', 34, Color.fromRGBO(228, 0, 124, 1)),
    ChartData('TP4', 52, Color.fromRGBO(255, 189, 57, 1))
  ];
  return chartData;
}

class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color? color;
}
