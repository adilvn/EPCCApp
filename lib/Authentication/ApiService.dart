import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:epcc/Models/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:api_cache_manager/api_cache_manager.dart';

class ApiService extends GetConnect {
  Future<List<dynamic>> fetchDetails() async {
    // await get("https://virtuehost.net/clients/epcc/api/data.json");

    try {
      var iscacheExist = await APICacheManager().isAPICacheKeyExist("API_EPCC");

      if (!iscacheExist) {
        var response =
            await get("https://3ec6-210-2-156-98.ngrok.io/power/iflpowapi.php");
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
          var body = jsonEncode(response.body);

          APICacheDBModel apiCacheDBModel =
              new APICacheDBModel(key: "API_EPCC", syncData: body);
          APICacheManager().addCacheData(apiCacheDBModel);

          return [response.body["status"], response.body["data"]];
        }
      } else {
        var hasData = await APICacheManager().getCacheData('API_EPCC');
        var response = jsonDecode(hasData.syncData);
        print("Response $response");
        return [response['status'], response['data']];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  void getResponse() async {
    try {
      var response =
          await get("https://3ec6-210-2-156-98.ngrok.io/power/iflpowapi.php");

      if (response.statusCode == 200) {
        var body = jsonEncode(response.body);
        print("Length cache" + body);
        await APICacheManager().deleteCache("API_EPCC");
        APICacheDBModel apiCacheDBModel =
            new APICacheDBModel(key: "API_EPCC", syncData: body);
        APICacheManager().addCacheData(apiCacheDBModel);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
