import 'package:animate_do/animate_do.dart';
import 'package:epcc/Models/constants.dart';
import 'package:epcc/Screens/bottom_navigation.dart';
import 'package:epcc/Screens/unitsPage.dart';
import 'package:epcc/controllers/HomeController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends GetView<HomeController> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  Future<void> _refresh() async {
    await Future.delayed(Duration(milliseconds: 900));
    Get.reloadAll();
    BottomNavigation.changeProfileWidget(HomeScreen());
    _refreshController.refreshCompleted();
  }

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
                    onPressed: () {
                      Get.reloadAll(force: true);
                      BottomNavigation.changeProfileWidget(HomeScreen());
                    },
                    icon: Icon(
                      Icons.sort,
                      size: 25,
                    )),
              )
            ]),
        body: controller.obx(
          (data) {
            return SmartRefresher(
              onRefresh: _refresh,
              controller: _refreshController,
              enablePullDown: true,
              child: Column(children: [
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
                            flex: 5,
                            child: Container(
                              child: SfCircularChart(
                                annotations: <CircularChartAnnotation>[
                                  CircularChartAnnotation(
                                      widget: Container(
                                          child: Text(
                                              NumberFormat.compact()
                                                  .format(controller.totalKwh),
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 0.5),
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
                                      dataSource: [
                                        ChartData('TP1', controller.t1,
                                            Color(0xffFF6F00)),
                                        ChartData('TP2', controller.t2,
                                            Color(0xff7C4DFF)),
                                        ChartData('TP3', controller.t3,
                                            Color(0xff2196F3)),
                                        ChartData('TP4', controller.t4,
                                            Color(0xffFF4040)),
                                        ChartData('PP', controller.pp,
                                            Color(0xffFFA640))
                                      ],
                                      enableSmartLabels: true,
                                      dataLabelMapper: (ChartData data, _) =>
                                          data.x,
                                      xValueMapper: (ChartData data, _) =>
                                          data.x,
                                      yValueMapper: (ChartData data, _) =>
                                          data.y,
                                      dataLabelSettings: DataLabelSettings(
                                        isVisible: true,
                                      ))
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                getContainer(
                                    Color(0xffFF6F00),
                                    (controller.t1 / controller.totalKwh) * 100,
                                    controller.t1.toDouble()),
                                getContainer(
                                    Color(0xff7C4DFF),
                                    (controller.t2 / controller.totalKwh) * 100,
                                    controller.t2.toDouble()),
                                getContainer(
                                    Color(0xff2196F3),
                                    (controller.t3 / controller.totalKwh) * 100,
                                    controller.t3.toDouble()),
                                getContainer(
                                    Color(0xffFF4040),
                                    (controller.t4 / controller.totalKwh) * 100,
                                    controller.t4.toDouble()),
                                getContainer(
                                    Color(0xffFFA640),
                                    (controller.pp / controller.totalKwh) * 100,
                                    controller.pp.toDouble()),
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
                      getTiles(
                          Color(0xffFF6F00), "TP1", "assets/images/748.png",
                          () {
                        BottomNavigation.changeProfileWidget(
                            UnitsPage(list: controller.TP1));

                        // Get.to(() => UnitsPage(list: controller.TP1));
                      }),
                      getTiles(
                          Color(0xff7C4DFF), "TP2", "assets/images/749.png",
                          () {
                        // Get.to(() => UnitsPage(list: controller.TP2));
                        BottomNavigation.changeProfileWidget(
                            UnitsPage(list: controller.TP2));
                      }),
                      getTiles(
                          Color(0xff2196F3), "TP3", "assets/images/750.png",
                          () {
                        // Get.to(() => UnitsPage(list: controller.TP3));
                        BottomNavigation.changeProfileWidget(
                            UnitsPage(list: controller.TP3));
                      }),
                      getTiles(
                          Color(0xffFF4040), "TP4", "assets/images/751.png",
                          () {
                        BottomNavigation.changeProfileWidget(
                            UnitsPage(list: controller.TP4));
                        // Get.to(() => UnitsPage(list: controller.TP4));
                      }),
                      getTiles(Color(0xffFFA640), "PP", "assets/images/752.png",
                          () {
                        BottomNavigation.changeProfileWidget(
                            UnitsPage(list: controller.PP));
                        // Get.to(() => UnitsPage(list: controller.PP));
                      }),
                    ],
                  ),
                ),
              ]),
            );
          },
          onError: (err) {
            Get.rawSnackbar(duration: Duration(seconds: 3), message: "$err");
            return Container();
          },
          onLoading: FadeIn(
            animate: true,
            duration: Duration(seconds: 5),
            child: Column(children: [
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
                          flex: 5,
                          child: Container(
                            child: SfCircularChart(
                              annotations: <CircularChartAnnotation>[
                                CircularChartAnnotation(
                                    widget: Container(
                                        child: Text(
                                            NumberFormat.compact()
                                                .format(controller.totalKwh),
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    0, 0, 0, 0.5),
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
                                    dataSource: [
                                      ChartData(
                                          'TP1', 2332.3, Color(0xffFF6F00)),
                                      ChartData(
                                          'TP2', 2332.3, Color(0xff7C4DFF)),
                                      ChartData(
                                          'TP3', 2332.3, Color(0xff2196F3)),
                                      ChartData(
                                          'TP4', 2332.3, Color(0xffFF4040)),
                                      ChartData('PP', 2332.3, Color(0xffFFA640))
                                    ],
                                    enableSmartLabels: true,
                                    dataLabelMapper: (ChartData data, _) =>
                                        data.x,
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
                          flex: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              getContainer(Color(0xffFF6F00), 0,
                                  controller.t1.toDouble()),
                              getContainer(Color(0xff7C4DFF), 0,
                                  controller.t2.toDouble()),
                              getContainer(Color(0xff2196F3), 0,
                                  controller.t3.toDouble()),
                              getContainer(Color(0xffFF4040), 0,
                                  controller.t4.toDouble()),
                              getContainer(Color(0xffFFA640), 0,
                                  controller.pp.toDouble()),
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
                    getTiles(Color(0xffFF6F00), "TP1", "assets/images/748.png",
                        () {
                      // Get.to(() => UnitsPage(list: controller.TP1));
                    }),
                    getTiles(Color(0xff7C4DFF), "TP2", "assets/images/749.png",
                        () {
                      // Get.to(() => UnitsPage(list: controller.TP2));
                    }),
                    getTiles(Color(0xff2196F3), "TP3", "assets/images/750.png",
                        () {
                      // Get.to(() => UnitsPage(list: controller.TP3));
                    }),
                    getTiles(Color(0xffFF4040), "TP4", "assets/images/751.png",
                        () {
                      // Get.to(() => UnitsPage(list: controller.TP4));
                    }),
                    getTiles(Color(0xffFFA640), "PP", "assets/images/752.png",
                        () {
                      // Get.to(() => UnitsPage(list: controller.PP));
                    }),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }

  getTiles(Color color, String val, imageText, VoidCallback onTap) {
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.bar_chart,
                    color: white,
                    size: 16,
                  ),
                  Text("Reports  ",
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
                                Text(" (Last checked 2 hours ago)",
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
              numberFormat.format(value2) + " KWH",
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      ),
    );
  }
}
