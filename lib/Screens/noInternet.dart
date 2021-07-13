import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Icon(
            Icons.wifi_off,
            size: 100,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
