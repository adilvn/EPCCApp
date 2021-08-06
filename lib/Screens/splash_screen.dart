import 'package:epcc/Authentication/authentication.dart';
import 'package:epcc/Models/constants.dart';
import 'package:epcc/controllers/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class Splashing extends StatefulWidget {
  @override
  _SplashingState createState() => _SplashingState();
}

class _SplashingState extends State<Splashing>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height * 0.8;
    int value = size.toInt();
    return Scaffold(
      body: SplashScreenView(
        colors: [white, Colors.blue],
        speed: 2000,
        pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
        navigateRoute: Authenticate(),
        duration: 2000,
        imageSize: value,
        imageSrc: "assets/images/launch_image.png",
        backgroundColor: Colors.white,
      ),
    );
  }
}
