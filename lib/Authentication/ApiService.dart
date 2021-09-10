import 'package:epcc/Models/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiService extends GetConnect {
  Future<List<dynamic>> fetchDetails() async {
    var response = await await get(
        "https://3ec6-210-2-156-98.ngrok.io/power/iflpowapi.php");
    // await get("https://virtuehost.net/clients/epcc/api/data.json");

    if (response.status.hasError) {
      if (response.status.isNotFound) {
        Get.rawSnackbar(
          message: " Server Not Found",
          duration: Duration(seconds: 5),
          icon: Icon(
            Icons.error,
            size: 22,
            color: white,
          ),
          backgroundColor: epccBlue500,
        );
      } else if (response.status.connectionError) {
        Get.rawSnackbar(
          message: "Connection Not Found",
          duration: Duration(seconds: 5),
          icon: Icon(
            Icons.error,
            size: 22,
            color: white,
          ),
          backgroundColor: epccBlue500,
        );
      } else if (response.status.isServerError) {
        Get.rawSnackbar(
          message: " Server Side Error",
          duration: Duration(seconds: 5),
          icon: Icon(
            Icons.error,
            size: 22,
            color: white,
          ),
          backgroundColor: epccBlue500,
        );
      }
      return Future.error(response.statusText!);
    } else {
      print("i do it");
      return [response.body["status"], response.body["data"]];
    }
  }
}
