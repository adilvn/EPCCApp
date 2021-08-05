import 'package:epcc/Models/constants.dart';
import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wifi_off,
                size: 100,
                color: epccBlue500,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "You're Offline",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Text(
                  "Connect Your Internet To Continue",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.normal),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
