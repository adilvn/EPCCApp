import 'package:epcc/Authentication/DBService.dart';
import 'package:epcc/Bindings/HomePageBinding.dart';
import 'package:epcc/Models/constants.dart';
import 'package:epcc/Screens/splash_screen.dart';
import 'package:epcc/routes/AppPages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(GetMaterialApp(
    initialBinding: HomePageBindings(),
    theme: ThemeData(
      fontFamily: comfortaa,
      primaryColor: epccBlue,
    ),
    getPages: AppPages.routes,
    home: Splashing(),
    debugShowCheckedModeBanner: false,
  ));
}
