import 'package:epcc/Models/constants.dart';
import 'package:epcc/Screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: comfortaa,
        primaryColor: epccBlue,
      ),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


