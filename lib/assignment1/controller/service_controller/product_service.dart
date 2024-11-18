import 'dart:convert';
import 'dart:developer';
import 'package:bd_calling_task/api/api.dart';
import 'package:bd_calling_task/assignment1/model/all_product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static Future<List<AllProductModel>> fetchAllProduct() async {
    List<AllProductModel> allProduct = [];


    try {
      log("--------------44444444444444444444444444-------------------------");

      var response = await http.get(Uri.parse(Api.allProductApi));

      if (response.statusCode == 200) {
        log("--------------------555555555555555555-------------------");

        var json = jsonDecode(response.body);
        for (var data in json) {
          AllProductModel allProductModel = AllProductModel.fromJson(data);
          allProduct.add(allProductModel);
        }
      }
      return allProduct;
    } catch (e) {
      log("-----------------6666666666666666666666666----------------------");

      log("Error: $e");
    }
    return [];
  }
}
