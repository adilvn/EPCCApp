import 'package:epcc/Authentication/authentication.dart';
import 'package:epcc/Models/constants.dart';
import 'package:epcc/Screens/bottom_navigation.dart';
import 'package:epcc/controllers/HomeController.dart';
import 'package:epcc/controllers/profileController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: epccBlue500,
        title: Text("Profile"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.grey.shade300, shape: BoxShape.circle),
              child: Icon(
                Icons.person,
                size: 50,
                color: white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  Authenticate().sigout();
                  BottomNavigation.selectedIndex = 1;
                  Get.off(() => Authenticate());
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 150,
                  height: 30,
                  color: Colors.blue,
                  child: Text(
                    "Signout",
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
