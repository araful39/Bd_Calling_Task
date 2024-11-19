import 'package:hive_flutter/adapters.dart';

import '../assignment2/model/hive_model/hive_all_product_model.dart';

class HiveSettings {
  static hiveSettingAssingment2() async {
    // Register Adapter
    Hive.registerAdapter(HiveAllProductModelAdapter());
    Hive.registerAdapter(RatingAdapter());

    // Create Hive Box
    await Hive.openBox<HiveAllProductModel>('productsBox5');
  }

  static hiveSettingAssingment3() async {
    Hive.registerAdapter(WeatherModelAdapter());

    Hive.registerAdapter(WeatherAdapter());
    Hive.registerAdapter(MainAdapter());

    Hive.registerAdapter(SysAdapter());

    // Create a Hive box
    await Hive.openBox<WeatherModel>('weatherBox1');
  }
}
