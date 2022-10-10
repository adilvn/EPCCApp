import 'dart:async';
import 'dart:developer';

import 'package:connectivity/connectivity.dart';
import 'package:epcc/Screens/bottom_navigation.dart';
import 'package:epcc/Screens/login_screen.dart';
import 'package:epcc/Screens/noInternet.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authenticate extends StatefulWidget {
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future sigout() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool _connectionStatus = false;
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  late bool loginValue;
  late SharedPreferences _pref;
  @override
  void initState() {
    getLoginValue();
    super.initState();
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  getLoginValue() async {
    _pref = await SharedPreferences.getInstance();
    loginValue = _pref.getBool('login') ?? false;
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult result = ConnectivityResult.none;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return Future.value(null);
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        log('internet connectivity result = $result');
        setState(() => _connectionStatus = true);
        break;
      case ConnectivityResult.none:
        log('internet connectivity result = $result');
        setState(() {
          _connectionStatus = false;
        });
        break;
      default:
        log('internet connectivity result = $result');
        setState(() => _connectionStatus = false);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _connectionStatus
        ? loginValue
            ? BottomNavigation()
            : LoginScreen()
        : NoInternet();
  }
}
