import 'dart:convert';
import 'dart:io';

import 'package:user_hub/data/app_exception.dart';
import 'package:user_hub/data/network/base_api_service.dart';
import 'package:http/http.dart' as http;

class NetworkApiService extends BaseApiService {
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJSon = jsonDecode(response.body);
        return responseJSon;
      default:
        dynamic responseJSon = jsonDecode(response.body);
        return responseJSon;
    }
  }

  @override
  Future getApi(String url) async {
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(const Duration(seconds: 20));
      return returnResponse(response);
    } on SocketException {
      throw InternetException('No internet');
    } catch (e) {
      print(e.toString());
    }
  }
}
