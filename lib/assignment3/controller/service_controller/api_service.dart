import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../../../assignment2/model/hive_model/hive_all_product_model.dart';


class ApiService {
  static Future<WeatherModel?> fetchData(double lat, double lon) async {
    try {
      var response = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=509079b22fae7e954dff8403ef5eba0e"));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        return WeatherModel.fromJson(json); // Calling the fromJson method
      } else {
        log("Error: ${response.statusCode}");
      }
    } catch (e) {
      log("Error $e");
    }
    return null;
  }
}
