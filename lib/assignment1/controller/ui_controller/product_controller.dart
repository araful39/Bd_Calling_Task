import 'dart:developer';
import 'package:bd_calling_task/assignment1/controller/service_controller/product_service.dart';
import 'package:bd_calling_task/assignment1/model/all_product_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  RxBool isLoading = false.obs;

  RxList<AllProductModel> allProduct = <AllProductModel>[].obs;

  @override
  void onInit() {
    log("------------------1111111111111111111111111111111---------------------");

    super.onInit();
    getProduct();
  }

  void getProduct() async {
    isLoading.value = true;
    allProduct.value = await ProductService.fetchAllProduct();
    log("------------------allproduct${allProduct.length}");
    isLoading.value = false;
  }
}
