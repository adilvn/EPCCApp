import 'package:awesome_dropdown/awesome_dropdown.dart';
import 'package:epcc/Models/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Reports extends StatelessWidget {
  const Reports({Key? key}) : super(key: key);

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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
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
                      width: double.infinity,
                      height: 65,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 110,
                            height: 50,
                            child: AwesomeDropDown(
                              elevation: 5,
                              dropDownIconBGColor: Colors.red,
                              dropDownOverlayBGColor: Colors.red,
                              padding: 5,
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
                              dropDownList: ["TP1", "TP2", "TP3", "TP4", "PP"],
                            ),
                          ),
                          Container(
                            width: 110,
                            height: 50,
                            child: AwesomeDropDown(
                              elevation: 5,
                              dropDownIconBGColor: Colors.orange,
                              dropDownOverlayBGColor: Colors.orange,
                              padding: 5,
                              numOfListItemToShow: 6,
                              selectedItemTextStyle:
                                  TextStyle(color: white, fontSize: 12),
                              dropDownListTextStyle:
                                  TextStyle(color: white, fontSize: 16),
                              dropDownIcon: Icon(
                                Icons.arrow_drop_down,
                                color: white,
                                size: 24,
                              ),
                              dropDownBGColor: Colors.orange,
                              dropDownList: [
                                "Unit 1",
                                "Unit 2",
                              ],
                            ),
                          ),
                          Container(
                            width: 160,
                            height: 50,
                            child: AwesomeDropDown(
                              elevation: 5,
                              dropDownIconBGColor: Colors.green,
                              dropDownOverlayBGColor: Colors.green,
                              numOfListItemToShow: 6,
                              selectedItemTextStyle: TextStyle(
                                  color: white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal),
                              dropDownListTextStyle:
                                  TextStyle(color: white, fontSize: 14),
                              dropDownIcon: Icon(
                                Icons.arrow_drop_down,
                                color: white,
                                size: 18,
                              ),
                              dropDownBGColor: Colors.green,
                              dropDownList: [
                                "Back Process",
                                "Consumption Center"
                              ],
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
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    alignment: Alignment.center,
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
                                                    alignment: Alignment.center,
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
                                                    alignment: Alignment.center,
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
                                                    alignment: Alignment.center,
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
        ]));
  }
}
