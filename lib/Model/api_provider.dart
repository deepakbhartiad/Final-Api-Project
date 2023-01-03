import 'package:api_test/Model/base_url.dart';
import "package:get/get.dart";

class ApiProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'YOUR-API-URL';
  }

  Future<dynamic> getRequest(
      {required apiUrl, data = const <String, String>{}}) async {
    httpClient.baseUrl = BASE_URL;
    var res =
        await get(apiUrl, query: data, headers: {'Accept': 'application/json'});
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else if (res.statusCode == 404) {
      return Future.error(res.body);
    } else if (res.statusCode == 500) {
      return Future.error(res.body);
    } else {
      return Future.error('Network Problem');
    }
  }

  Future<dynamic> postRequest(
      {required apiUrl, data = const <String, String>{}}) async {
    httpClient.baseUrl = BASE_URL;
    var res = await post(apiUrl, data, headers: {'Accept': 'application/json'});
    if (res.statusCode == 200) {
      return res.body;
    } else if (res.unauthorized) {
      return Future.error(res.body);
    } else if (res.statusCode == 404) {
      return Future.error(res.body);
    } else if (res.statusCode == 500) {
      return Future.error(res.body);
    } else {
      return Future.error('Network Problem');
    }
  }
}

