import 'package:epcc/Authentication/authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Center(
        child: GestureDetector(
            onTap: () {
              // Authenticate().sigout();
              Get.off(Authenticate());
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
      ),
    );
  }
}
