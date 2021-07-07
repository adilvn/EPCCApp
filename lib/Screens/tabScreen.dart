import 'package:epcc/Models/constants.dart';
import 'package:epcc/controllers/TabScreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabsScreen extends StatelessWidget {
  // Color tabColor = Color(0xffBDBDBD);
  Color tabColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabScreenController>(
        init: TabScreenController(),
        builder: (provider) {
          return WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
              resizeToAvoidBottomInset: false,
              body: provider.tabList[provider.currentIndex],
              bottomNavigationBar: LayoutBuilder(
                builder: (context, state) {
                  return ConstrainedBox(
                    constraints:
                        BoxConstraints(minHeight: state.maxHeight * 0.04),
                    child: BottomNavigationBar(
                      onTap: (i) {
                        provider.setTabIndex(i);
                      },
                      selectedFontSize: 18,
                      items: [
                        BottomNavigationBarItem(
                            icon: Icon(
                              Icons.bar_chart,
                              color: epccBlue500,
                              size: 26,
                            ),
                            title: Text("")),
                        BottomNavigationBarItem(
                            icon: Icon(
                              Icons.home,
                              color: epccBlue500,
                              size: 26,
                            ),
                            title: Text(
                              "Home",
                              style:
                                  TextStyle(color: epccBlue500, fontSize: 18),
                            )),
                        BottomNavigationBarItem(
                            icon: Icon(
                              Icons.person,
                              color: epccBlue500,
                              size: 26,
                            ),
                            title: Text("")),
                      ],
                    ),
                  );
                },
              ),
            ),
          );
        });
  }
}
