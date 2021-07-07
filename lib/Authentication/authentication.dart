import 'package:epcc/Screens/home_screen.dart';
import 'package:epcc/Screens/login_screen.dart';
import 'package:epcc/Screens/tabScreen.dart';
import 'package:epcc/Screens/unitsPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return UnitsPage();
    } else {
      return LoginScreen();
    }
  }
}
