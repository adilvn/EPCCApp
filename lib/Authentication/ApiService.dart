import 'package:get/get.dart';

class ApiService extends GetConnect {
  Future<List<dynamic>> fetchDetails() async {
    var response =
        await get("https://e396-210-2-156-98.ngrok.io/power/iflpowapi.php");
    // await get("https://virtuehost.net/clients/epcc/api/data.json");
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return [response.body["status"], response.body["data"]];
    }
  }
}
