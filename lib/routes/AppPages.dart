import 'package:epcc/Authentication/authentication.dart';
import 'package:epcc/Bindings/HomePageBinding.dart';
import 'package:epcc/Screens/BackProcessUnit.dart';
import 'package:epcc/Screens/login_screen.dart';
import 'package:epcc/Screens/profile.dart';
import 'package:epcc/Screens/splash_screen.dart';
import 'package:epcc/Screens/subUnits.dart';
import 'package:epcc/Screens/tabScreen.dart';
import 'package:epcc/Screens/unitsPage.dart';
import 'package:epcc/routes/AppRoutes.dart';
import 'package:get/get.dart';

class AppPages {
  static const SIGNIN = AppRoutes.SIGNIN;
  static const HOME = AppRoutes.HOME;
  static const SPLASHING = AppRoutes.SPLASHING;
  static const WRAP = AppRoutes.WRAP;
  static const UNITSPAGE = AppRoutes.UNITSPAGE;
  static const SUBUNITS = AppRoutes.SUBUNITS;
  static const PROFILE = AppRoutes.PROFILE;
  static const BACKPROCESS = AppRoutes.BACKPROCESS;

  static final routes = [
    GetPage(
        name: SIGNIN,
        page: () => LoginScreen(),
        transitionDuration: Duration(milliseconds: 500),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: HOME,
        page: () => TabsScreen(),
        transitionDuration: Duration(milliseconds: 500),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: SPLASHING,
        page: () => Splashing(),
        transitionDuration: Duration(milliseconds: 500),
        transition: Transition.rightToLeftWithFade),
    GetPage(
        name: WRAP,
        page: () => Authenticate(),
        transitionDuration: Duration(milliseconds: 500),
        transition: Transition.rightToLeftWithFade),
  ];
}
