import 'package:epcc/Models/constants.dart';
import 'package:epcc/controllers/BackProcess.dart';
import 'package:epcc/controllers/reportController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reports extends StatelessWidget {
  Reports({Key? key}) : super(key: key);
  ReportController controller = Get.put(ReportController());
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
        body: Obx(() {
          return Column(children: [
            Expanded(
                flex: 1,
                child: Container(
                  color: epccBlue500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          height: 30,
                          child: Icon(
                            Icons.arrow_back,
                            color: white,
                            size: 24,
                          ),
                        ),
                      ),
                      Text(
                        "Reports",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(
                        indent: MediaQuery.of(context).size.width * 0.2,
                        endIndent: MediaQuery.of(context).size.width * 0.2,
                        color: white,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
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
                        padding: EdgeInsets.symmetric(horizontal: 2),
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
                                    value: controller.TPDropValue.value,
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
                                      controller.setTPDropValue(val);
                                    },
                                    items: controller.TPDrop.map<
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
                                                color: Colors.white,
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
                                      color: Color(0xffFFBA44),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: DropdownButton<String>(
                                    value: controller.UnitDropValue.value,
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
                                      controller.setUnitDropValue(val);
                                    },
                                    items: controller.UnitDrop.map<
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
                                                color: Colors.white,
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 39,
                                  decoration: BoxDecoration(
                                      color: Color(0xff00B8AC),
                                      borderRadius: BorderRadius.circular(30)),
                                  child: DropdownButton<String>(
                                    value: controller.BPDropValue.value,
                                    icon: const Icon(
                                      Icons.arrow_drop_down,
                                      color: Colors.white,
                                    ),
                                    iconSize: 16,
                                    elevation: 16,
                                    dropdownColor: Color(0xff00B8AC),
                                    focusColor: Color(0xff00B8AC),
                                    underline: Container(),
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    onChanged: (val) {
                                      controller.setBPDropValue(val);
                                    },
                                    items: controller.BPDrop.map<
                                            DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Container(
                                          padding: EdgeInsets.only(left: 10),
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                                color: Colors.white,
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 39,
                                  decoration: BoxDecoration(
                                      color: Color(0xffFF4444),
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
                                    dropdownColor: Color(0xffFF4444),
                                    focusColor: Color(0xffFF4444),
                                    underline: Container(),
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    onChanged: (val) {
                                      controller.setBPDropValue1(val);
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
                                  height: 39,
                                  decoration: BoxDecoration(
                                      color: Color(0xff00B8AC),
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
                                    dropdownColor: Color(0xff00B8AC),
                                    focusColor: Color(0xff00B8AC),
                                    underline: Container(),
                                    style: const TextStyle(
                                        color: Colors.deepPurple),
                                    onChanged: (val) {
                                      controller.setBPDropValue3(val);
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
                                                  color: Colors.yellow.shade900,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 140,
                                            child: Text(
                                              "Last Year",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            alignment: Alignment.center,
                                            width: 140,
                                            child: Text(
                                              "Change",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 13),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Container(
                                    width: double.infinity,
                                    height:
                                        MediaQuery.of(context).size.width - 100,
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
                                                  Expanded(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 140,
                                                      child: Text(
                                                        "April $index",
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      ),
                                                    ),
                                                  ),
                                                  VerticalDivider(
                                                    thickness: 1,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 140,
                                                      child: Text(
                                                        "40.3 Kwh",
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      ),
                                                    ),
                                                  ),
                                                  VerticalDivider(
                                                    thickness: 1,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 140,
                                                      child: Text(
                                                        "50 kwh",
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      ),
                                                    ),
                                                  ),
                                                  VerticalDivider(
                                                    thickness: 1,
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      alignment:
                                                          Alignment.center,
                                                      width: 140,
                                                      child: Text(
                                                        "43KWh",
                                                        style: TextStyle(
                                                            fontSize: 11),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
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
