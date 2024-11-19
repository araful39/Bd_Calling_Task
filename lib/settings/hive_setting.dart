import 'package:hive_flutter/adapters.dart';

import '../assignment2/model/hive_model/hive_all_product_model.dart';

class HiveSettings{
 static hiveSetting()async{
    await Hive.initFlutter();

    // Register Adapter
    Hive.registerAdapter(HiveAllProductModelAdapter());
    Hive.registerAdapter(RatingAdapter());

    // Open Hive Box
    await Hive.openBox<HiveAllProductModel>('productsBox4');
  }
}