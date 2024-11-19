import 'dart:developer';

import 'package:bd_calling_task/assignment2/model/hive_model/hive_all_product_model.dart';
import 'package:bd_calling_task/settings/internet_checker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../service_controller/product_service2.dart';

class AssingmentController2 extends GetxController {
  RxBool isLoading = false.obs;
  RxList<HiveAllProductModel> allProduct2 = <HiveAllProductModel>[].obs;

  // Hive Box

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }
//akhn na,,pore nam ta change kore dicbi lagbe na privet kora na dhuro,,function er vitore private lagena
  getProduct() async {
    var box = Hive.box<HiveAllProductModel>('productsBox5');

    if (!await ConnectionChecker.checkConnection()) {
      EasyLoading.showError("No internet connection. Loading offline data...");

      // Load data from Hive when offline
      allProduct2.value = box.values.toList();
      return;
    }

    try {
      EasyLoading.show(status: "Loading products...");
      isLoading.value = true;

      // Fetch products from API
      List<HiveAllProductModel> fetchedProducts =
          await ProductService2.fetchAllProduct2();

      allProduct2.value = fetchedProducts;

      // Save data to Hive
      await box.clear(); // Clear old data
      await box.addAll(fetchedProducts);

      EasyLoading.showSuccess("Products loaded successfully!");
    } catch (e) {
      EasyLoading.showError("Failed to load products: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
