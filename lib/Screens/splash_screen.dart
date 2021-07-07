import 'package:epcc/Authentication/authentication.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

class Splashing extends StatelessWidget {
  const Splashing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.of(context).size.height * 0.8;
    int value = size.toInt();
    return Scaffold(
      body: SplashScreenView(
        navigateRoute: Authenticate(),
        duration: 1000,
        imageSize: value,
        imageSrc: "assets/images/launch_image.png",
        backgroundColor: Colors.white,
      ),
    );
  }
}
