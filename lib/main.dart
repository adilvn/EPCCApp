import 'package:epcc/Bindings/HomePageBinding.dart';
import 'package:epcc/Models/constants.dart';
import 'package:epcc/Models/data_modal.dart';
import 'package:epcc/routes/AppPages.dart';
import 'package:epcc/routes/AppRoutes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: HomePageBindings(),
      theme: ThemeData(
        fontFamily: comfortaa,
        primaryColor: epccBlue,
      ),
      getPages: AppPages.routes,
      initialRoute: AppRoutes.SPLASHING,
      debugShowCheckedModeBanner: false,
    );
  }
}
