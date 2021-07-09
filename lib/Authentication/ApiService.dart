import 'package:get/get.dart';

class ApiService extends GetConnect {
  Future<List<dynamic>> fetchDetails() async {
    var response =
        await get("https://virtuehost.net/clients/epcc/api/data.json");
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return [response.body["status"], response.body["data"]];
    }
  }
}
