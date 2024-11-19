import 'package:bd_calling_task/assignment3/controller/service_controller/api_service.dart';
import 'package:bd_calling_task/assignment3/controller/service_controller/location_service.dart';
import 'package:bd_calling_task/settings/internet_checker.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../assignment2/model/hive_model/hive_all_product_model.dart';

class Assignment3Controller extends GetxController {
  var isLoading = false.obs;
  Rx<WeatherModel> weatherModel = WeatherModel().obs;
  getData() async {
    var box = Hive.box<WeatherModel>('weatherBox1');

    if (!await ConnectionChecker.checkConnection()) {
      EasyLoading.showError("No internet connection. Loading offline data...");

      // Load data from Hive when offline
      weatherModel.value = box.values.toList().first;
      return;
    }
    try {
      EasyLoading.show(status: "Loading weather data...");
      isLoading.value = true;
      Position? position = await LocationService().getCurrentLocation();
      WeatherModel? data =
          await ApiService.fetchData(position!.latitude, position.longitude);
      weatherModel.value = data!;
      await box.clear(); // Clear old data
      await box.add(weatherModel.value); // Store the new data
    } catch (e) {
      EasyLoading.showError("Failed to load weather data: $e");
    } finally {
      isLoading.value = false;
      EasyLoading.dismiss();
    }
  }

  @override
  void onInit() {
    super.onInit();

    getData();
  }
}
