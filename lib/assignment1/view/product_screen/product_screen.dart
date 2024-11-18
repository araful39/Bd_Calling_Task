import 'package:bd_calling_task/assignment1/controller/ui_controller/product_controller.dart';
import 'package:bd_calling_task/assignment1/model/all_product_model.dart';
import 'package:bd_calling_task/assignment1/view/product_screen/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController productController = Get.put(ProductController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Product"),
        centerTitle: true,
      ),
      body: Obx(
        () => productController.isLoading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : productController.allProduct.isEmpty
                ? const Center(
                    child: Text("Product Not Found. !"),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 2),
                    itemCount: productController.allProduct.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 0.82),
                    itemBuilder: (context, index) {
                      AllProductModel list =
                          productController.allProduct[index];
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
