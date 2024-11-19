import 'dart:developer';
import 'package:bd_calling_task/assignment1/controller/service_controller/product_service.dart';
import 'package:bd_calling_task/assignment1/model/all_product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxBool isLoading = false.obs;

  RxList<AllProductModel> allProduct = <AllProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  getProduct() async {
    isLoading.value = true;
    allProduct.value = await ProductService.fetchAllProduct();
    isLoading.value = false;
  }
}
