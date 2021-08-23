import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:epcc/Models/constants.dart';
import 'package:epcc/Screens/bottom_navigation.dart';
import 'package:epcc/Screens/unitsPage.dart';
import 'package:epcc/controllers/HomeController.dart';
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
  final _profileController = Get.find<ProfileController>();
  Future<void> _refresh() async {
    await Future.delayed(Duration(milliseconds: 900));
    Get.reloadAll();
    BottomNavigation.changeProfileWidget(HomeScreen());
    _refreshController.refreshCompleted();
  }

  ReportController _reportController = Get.put(ReportController());
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
                      Get.reloadAll(force: true);
                      BottomNavigation.changeProfileWidget(HomeScreen());
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
              child: Column(children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      alignment: Alignment.center,
                      color: epccBlue500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 5,
                          ),
                          Text("Locations",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 26,
                                  fontFamily: montserrat,
                                  fontWeight: FontWeight.normal)),
                          Divider(
                            indent: MediaQuery.of(context).size.width * 0.3,
                            endIndent: MediaQuery.of(context).size.width * 0.3,
                            color: white,
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    flex: 4,
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
                                                  color: Colors.black,
                                                  fontSize: 18))))
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
                  flex: 8,
                  child: ListView(
                    children: [
                      getTiles(
                          Color(0xffFF6F00), "TP1", "assets/images/748.png",
                          () {
                        _unitController.setU1(controller.TP1U1List);
                        _unitController.setU2(controller.TP1U2List);

                        _unitController
                            .setunitOne(controller.TP1UnitOneDetails);
                        _unitController
                            .setunitTwo(controller.TP1UnitTwoDetails);
                        _unitController.setunitThree([]);

                        _unitController.setunitFour([]);
                        _unitController
                            .setUnitOneDetails(controller.TP1UNIT1DATA);
                        _unitController
                            .setUnitTwoDetails(controller.TP1UNIT2DATA);
                        _unitController.setUnitThreeDetails([]);
                        _unitController.setUnitFourDetails([]);
                        _unitController
                            .setTotalUnit1(controller.TP1_UNIT1_DATA_SUM);
                        _unitController
                            .setTotalUnit2(controller.TP1_UNIT2_DATA_SUM);

                        _unitController.SetButtonText(["Unit 1", "Unit 2"]);
                        _unitController.setUnitButtonColor(
                            [Color(0xff0099FF), Color(0xff00B8AC)]);
                        _unitController.SetCenterName([
                          "Back process Unit 1",
                          "Spinning /winding unit 1",
                          "Back process Unit 2\r\n",
                          "Spinning/winding unit 2"
                        ]);
                        _unitController.SetButtonIndex(2);
                        _unitController.SetTitle("TP1 ");
                        _unitController.SetLocationName('TP1 Units');
                        BottomNavigation.changeProfileWidget(UnitsPage());

                        // BottomNavigation.changeProfileWidget(UnitsPage(
                        // unitOne: controller.TP1UnitOneDetails,
                        // unitTwo: controller.TP1UnitTwoDetails,
                        // unitThree: [],
                        // unitFour: [],
                        // unitOneDetails: controller.TP1UNIT1DATA,
                        // unitTwoDetails: controller.TP1UNIT2DATA,
                        // unitFourDetails: [],
                        // unitThreeDetails: [],
                        // buttonText: ["Unit 1", "Unit 2"],
                        // buttonColor: [Colors.blue, Colors.green],
                        // centerNames: [
                        //   "Back process Unit 1",
                        //   "Spinning /winding unit 1",
                        //   "Back process Unit 2",
                        //   "Spinning/winding unit 2"
                        // ],
                        // button: 2,
                        // title: "TP1",
                        // locationName: "Units",
                        // ));
                      }, controller.t1, controller.TP1List),
                      getTiles(
                          Color(0xff7C4DFF), "TP2", "assets/images/749.png",
                          () {
                        _unitController.setU1(controller.TP2U1List);
                        _unitController.setU2(controller.TP2U2List);
                        _unitController
                            .setunitOne(controller.TP2UnitOneDetails);
                        _unitController
                            .setunitTwo(controller.TP2UnitTwoDetails);
                        _unitController.setunitThree([]);

                        _unitController.setunitFour([]);
                        _unitController
                            .setTotalUnit1(controller.TP2_UNIT1_DATA_SUM);
                        _unitController
                            .setTotalUnit2(controller.TP2_UNIT2_DATA_SUM);
                        _unitController
                            .setUnitOneDetails(controller.TP2UNIT1DATA);
                        _unitController
                            .setUnitTwoDetails(controller.TP2UNIT2DATA);
                        _unitController.setUnitThreeDetails([]);
                        _unitController.setUnitFourDetails([]);
                        _unitController.SetButtonText(["Unit 1", "Unit 2"]);
                        _unitController.setUnitButtonColor(
                            [Color(0xff0099FF), Color(0xff00B8AC)]);
                        _unitController.SetCenterName([
                          "Back process Unit 1",
                          "Spinning /winding unit 1",
                          "Back process Unit 2\r\n",
                          "Spinning/winding unit 2"
                        ]);
                        _unitController.SetButtonIndex(2);
                        _unitController.SetTitle("TP2 ");
                        _unitController.SetLocationName('TP2 Units');
                        BottomNavigation.changeProfileWidget(UnitsPage());
                        // BottomNavigation.changeProfileWidget(UnitsPage(
                        //   unitOne: controller.TP2UnitOneDetails,
                        //   unitTwo: controller.TP2UnitTwoDetails,
                        //   unitThree: [],
                        //   unitFour: [],
                        //   unitOneDetails: controller.TP2UNIT1DATA,
                        //   unitTwoDetails: controller.TP2UNIT2DATA,
                        //   unitFourDetails: [],
                        //   unitThreeDetails: [],
                        //   buttonText: ["Unit 1", "Unit 2"],
                        //   buttonColor: [Colors.blue, Colors.green],
                        //   centerNames: [
                        //     "Back process Unit 1",
                        //     "Spinning /winding unit 1",
                        //     "Back process Unit 2",
                        //     "Spinning/winding unit 2"
                        //   ],
                        //   button: 2,
                        //   title: "TP2",
                        //   locationName: "Units",
                        // ));
                      }, controller.t2, controller.TP2List),
                      getTiles(
                          Color(0xff2196F3), "TP3", "assets/images/750.png",
                          () {
                        _unitController.setU1(controller.TP3U1List);
                        _unitController.setU2(controller.TP3U2List);
                        _unitController
                            .setTotalUnit1(controller.TP3_UNIT1_DATA_SUM);
                        _unitController
                            .setTotalUnit2(controller.TP3_UNIT2_DATA_SUM);
                        _unitController
                            .setunitOne(controller.TP3UnitOneDetails);
                        _unitController
                            .setunitTwo(controller.TP3UnitTwoDetails);
                        _unitController.setunitThree([]);

                        _unitController.setunitFour([]);
                        _unitController
                            .setUnitOneDetails(controller.TP3UNIT1DATA);
                        _unitController
                            .setUnitTwoDetails(controller.TP3UNIT2DATA);
                        _unitController.setUnitThreeDetails([]);
                        _unitController.setUnitFourDetails([]);
                        _unitController.SetButtonText(["Unit 1", "Unit 2"]);
                        _unitController.setUnitButtonColor(
                            [Color(0xff0099FF), Color(0xff00B8AC)]);
                        _unitController.SetCenterName([
                          "Back process Unit 1",
                          "Spinning /winding unit 1",
                          "Back process Unit 2\r\n",
                          "Spinning/winding unit 2"
                        ]);
                        _unitController.SetButtonIndex(2);
                        _unitController.SetTitle("TP3 ");
                        _unitController.SetLocationName('TP3 Units');
                        BottomNavigation.changeProfileWidget(UnitsPage());
                      }, controller.t3, controller.TP3List),
                      getTiles(
                          Color(0xffFF4040), "TP4", "assets/images/751.png",
                          () {
                        _unitController.setU1(controller.TP4S1List);
                        _unitController.setU2(controller.TP4S2List);
                        _unitController.setU3(controller.TP4S3List);
                        _unitController.setU4(controller.TP4S4List);
                        _unitController
                            .setTotalUnit1(controller.TP4_SECTION1_DATA_SUM);
                        _unitController
                            .setTotalUnit2(controller.TP4_SECTION2_DATA_SUM);
                        _unitController
                            .setTotalUnit3(controller.TP4_SECTION3_DATA_SUM);
                        _unitController
                            .setTotalUnit4(controller.TP4_SECTION4_DATA_SUM);

                        _unitController.setunitOne(controller.TP4SOneDetails);
                        _unitController.setunitTwo(controller.TP4STwoDetails);
                        _unitController
                            .setunitThree(controller.TP4SThreeDetails);

                        _unitController.setunitFour(controller.TP4SFourDetails);
                        _unitController
                            .setUnitOneDetails(controller.TP4SECTION1DATA);
                        _unitController
                            .setUnitTwoDetails(controller.TP4SECTION2DATA);
                        _unitController
                            .setUnitThreeDetails(controller.TP4SECTION3DATA);
                        _unitController
                            .setUnitFourDetails(controller.TP4SECTION4DATA);
                        _unitController.SetButtonText([
                          "Section 1",
                          "Section 2",
                          "Section 3",
                          "Section 4",
                        ]);
                        _unitController.setUnitButtonColor([
                          Color(0xff0099FF),
                          Color(0xff00B8AC),
                          Color(0xffFFBA44),
                          Colors.red
                        ]);
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
                        BottomNavigation.changeProfileWidget(UnitsPage());
                      }, controller.t4, controller.TP4List),
                      getTiles(Color(0xffFFA640), "PP", "assets/images/752.png",
                          () {
                        _unitController.setU1(controller.PP1List);
                        _unitController.setU2(controller.PP2List);
                        _unitController.setU3(controller.PP3List);
                        _unitController.setU4(controller.UTILITIESList);
                        _unitController
                            .setTotalUnit1(controller.PP_PP1_DATA_SUM);
                        _unitController
                            .setTotalUnit2(controller.PP_PP2_DATA_SUM);
                        _unitController
                            .setTotalUnit3(controller.PP_PP3_DATA_SUM);
                        _unitController
                            .setTotalUnit4(controller.PP_UTILITIES_DATA_SUM);
                        _unitController.setunitOne(controller.PPOneDetails);

                        _unitController.setunitTwo(controller.PPTwoDetails);
                        _unitController.setunitThree(controller.PPThreeDetails);

                        _unitController
                            .setunitFour(controller.UtilitiesDetails);
                        _unitController.setUnitOneDetails(controller.PP1DATA);

                        _unitController.setUnitTwoDetails(controller.PP2DATA);
                        _unitController.setUnitThreeDetails(controller.PP3DATA);
                        _unitController
                            .setUnitFourDetails(controller.UTILITIESDATA);
                        _unitController.SetButtonText(
                            ["PP1", "PP2", "PP3", "Utilities"]);
                        _unitController.setUnitButtonColor([
                          Color(0xff0099FF),
                          Color(0xff00B8AC),
                          Color(0xffFFBA44),
                          Colors.red
                        ]);
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
                        BottomNavigation.changeProfileWidget(UnitsPage());
                      }, controller.pp, controller.PPList),
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
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.5,
                  child: Column(children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          color: epccBlue500,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Locations",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 27),
                              ),
                              Divider(
                                indent: MediaQuery.of(context).size.width * 0.3,
                                endIndent:
                                    MediaQuery.of(context).size.width * 0.3,
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
                                                  NumberFormat.compact().format(
                                                      controller.totalKwh),
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
                                          pointColorMapper:
                                              (ChartData data, _) => data.color,
                                          dataSource: [
                                            ChartData('TP1', 2332.3,
                                                Color(0xffFF6F00)),
                                            ChartData('TP2', 2332.3,
                                                Color(0xff7C4DFF)),
                                            ChartData('TP3', 2332.3,
                                                Color(0xff2196F3)),
                                            ChartData('TP4', 2332.3,
                                                Color(0xffFF4040)),
                                            ChartData(
                                                'PP', 2332.3, Color(0xffFFA640))
                                          ],
                                          enableSmartLabels: true,
                                          dataLabelMapper:
                                              (ChartData data, _) => data.x,
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
                          getTiles(
                              Color(0xffFF6F00), "TP1", "assets/images/748.png",
                              () {
                            // Get.to(() => UnitsPage(list: controller.TP1));
                          }, 0.0, [0.0, 0.0]),
                          getTiles(
                              Color(0xff7C4DFF), "TP2", "assets/images/749.png",
                              () {
                            // Get.to(() => UnitsPage(list: controller.TP2));
                          }, 0.0, [0.0, 0.0]),
                          getTiles(
                              Color(0xff2196F3), "TP3", "assets/images/750.png",
                              () {
                            // Get.to(() => UnitsPage(list: controller.TP3));
                          }, 0.0, [0.0, 0.0]),
                          getTiles(
                              Color(0xffFF4040), "TP4", "assets/images/751.png",
                              () {
                            // Get.to(() => UnitsPage(list: controller.TP4));
                          }, 0.0, [0.0, 0.0]),
                          getTiles(
                              Color(0xffFFA640), "PP", "assets/images/752.png",
                              () {
                            // Get.to(() => UnitsPage(list: controller.PP));
                          }, 0.0, [0.0, 0.0]),
                        ],
                      ),
                    ),
                  ]),
                ),
                Center(
                  child: CupertinoActivityIndicator(
                    radius: 18,
                  ),
                )
              ],
            ),
          ),
        ));
  }

  getTiles(Color color, String val, imageText, VoidCallback onTap,
      double totalvalue, List<double> list) {
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
                            Text("Total: $totalvalue",
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
                            Text(
                                "Min: ${list.reduce((value, element) => value > element ? value : element)}",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16)),
                            Text(
                                "Max:  ${list.reduce((value, element) => value > element ? value : element)}",
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
                style: TextStyle(fontSize: 16)),
            SizedBox(
              width: 10,
            ),
            Text(
              numberFormat.format(value2) + " kWh",
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
