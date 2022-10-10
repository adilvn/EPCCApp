import 'package:epcc/Authentication/ApiService.dart';

import 'package:epcc/Bindings/HomePageBinding.dart';
import 'package:epcc/Models/constants.dart';
import 'package:epcc/routes/AppPages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future main() async {
  ApiService().getResponse();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(GetMaterialApp(
    initialBinding: HomePageBindings(),
    theme: ThemeData(
      fontFamily: roboto,
      primaryColor: epccBlue,
    ),
    getPages: AppPages.routes,
    initialRoute: AppPages.SPLASHING,
    debugShowCheckedModeBanner: false,
  ));
}
