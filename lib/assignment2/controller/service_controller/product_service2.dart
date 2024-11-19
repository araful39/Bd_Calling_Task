import 'dart:convert';
import 'dart:developer';
import 'package:bd_calling_task/api/api.dart';
import 'package:bd_calling_task/assignment2/model/hive_model/hive_all_product_model.dart';
import 'package:http/http.dart' as http;





class ProductService2 {
  static Future<List<HiveAllProductModel>> fetchAllProduct2() async {
    List<HiveAllProductModel> allProduct = [];

    try {
      var response = await http.get(Uri.parse(Api.allProductApi));

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);

        for (var data in json) {
          allProduct.add(HiveAllProductModel.fromJson(data));
        }
      }
      return allProduct;
    } catch (e) {
      log("Error fetching products: $e");
      return [];
    }
  }
}
