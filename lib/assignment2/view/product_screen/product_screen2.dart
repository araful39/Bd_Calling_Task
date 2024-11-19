import 'package:bd_calling_task/assignment1/view/product_screen/widget/product_card.dart';
import 'package:bd_calling_task/assignment2/controller/ui_controller/product_controller2.dart';
import 'package:bd_calling_task/assignment2/model/hive_model/hive_all_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Assingment2 extends StatelessWidget {
  const Assingment2({super.key});

  @override
  Widget build(BuildContext context) {
    AssingmentController2 productController = Get.put(AssingmentController2());
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Product 2"),
        centerTitle: true,
      ),
      body: Obx(
        () => productController.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : productController.allProduct2.isEmpty
                ? const Center(
                    child: Text("Product Not Found.. !"),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    itemCount: productController.allProduct2.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.82),
                    itemBuilder: (context, index) {
                      HiveAllProductModel list =
                          productController.allProduct2[index];
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ProductCard(
                          imagePath: list.image.toString(),
                          name: list.title.toString(),
                          price: list.price.toString(),
                          ratings: "${list.rating?.rate}",
                        ),
                      );
                    },
                  ),
      ),
    );
  }
}
