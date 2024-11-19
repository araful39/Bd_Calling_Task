import 'dart:convert';
import 'dart:developer';
import 'package:bd_calling_task/api/api.dart';
import 'package:bd_calling_task/assignment1/model/all_product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  static Future<List<AllProductModel>> fetchAllProduct() async {
    List<AllProductModel> allProduct = [];

    try {
      var response = await http.get(Uri.parse(Api.allProductApi));

      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        for (var data in json) {
          AllProductModel allProductModel = AllProductModel.fromJson(data);
          allProduct.add(allProductModel);
        }
      }
      return allProduct;
    } catch (e) {
      log("Error: $e");
    }
    return [];
  }
}
