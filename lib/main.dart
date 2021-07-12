import 'package:device_preview/device_preview.dart';
import 'package:epcc/Bindings/HomePageBinding.dart';
import 'package:epcc/Models/constants.dart';
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
  // runApp(MyApp());
  runApp(
    DevicePreview(
      enabled: kReleaseMode,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: DevicePreview.locale(context), // Add the locale here
      builder: DevicePreview.appBuilder,
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
