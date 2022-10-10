import 'dart:convert';

import 'package:api_cache_manager/api_cache_manager.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:epcc/Models/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ApiService extends GetConnect {
  Future<List<dynamic>> fetchDetails() async {
    // await get("https://virtuehost.net/clients/epcc/api/data.json");

    try {
      var iscacheExist = await APICacheManager().isAPICacheKeyExist("API_EPCC");

      if (!iscacheExist) {
        var response =
            await get("https://epcc.ap.ngrok.io/power/iflpowapi.php");
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
          APICacheManager().deleteCache('API_EPCC').then((value) async {
            if (value == true) {
              APICacheDBModel apiCacheDBModel =
                  APICacheDBModel(key: "API_EPCC", syncData: response.body);

              bool isDataadded =
                  await APICacheManager().addCacheData(apiCacheDBModel);
              print("ELSE BODY ApiCacheDBModel: " + apiCacheDBModel.syncData);
              final doesitevenexist =
                  await APICacheManager().isAPICacheKeyExist("API_EPCC");
              print("ELSE BODY  Does it even exist? " +
                  doesitevenexist.toString());
              final getDataCheck =
                  await APICacheManager().getCacheData('API_EPCC');
              print(
                  "ELSE BODY  Print this is getData check from response function + " +
                      "without Get data it runs");
            }
          });

          return [response.body["status"], response.body["data"]];
        }
      } else {
        var hasData = await APICacheManager().getCacheData('API_EPCC');
        var unresponse = jsonDecode(hasData.syncData);
        var response = jsonDecode(unresponse);
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
      var response = await get("https://epcc.ap.ngrok.io/power/iflpowapi.php");

      if (response.statusCode == 200) {
        print("Get Data before after jsonEncode: " +
            response.body.runtimeType.toString());

        final body = jsonEncode(response.body);

        print("Get Data type after jsonEncode: " + body.runtimeType.toString());
        final decodedBody = jsonDecode(body);
        print("Get Data type after jsonDecode: " +
            decodedBody.runtimeType.toString());

        print("Length cache" + body);
        await APICacheManager().deleteCache('API_EPCC').then((value) async {
          if (value == true) {
            APICacheDBModel apiCacheDBModel =
                APICacheDBModel(key: "API_EPCC", syncData: response.body);

            print("ApiCacheDBModel: " + apiCacheDBModel.syncData);
            final doesitevenexist =
                await APICacheManager().isAPICacheKeyExist("API_EPCC");
            print("Does it even exist? " + doesitevenexist.toString());
            final getDataCheck =
                await APICacheManager().getCacheData('API_EPCC');
            print("Print this is getData check from response function + " +
                "without Get data it runs");
          }
        });
        //("API_EPCC");

      }
    } catch (e) {
      print(
          "This error occurred in getResponse() function of API-Service.dart File.            ");
      print(e.toString());
    }
  }
}
