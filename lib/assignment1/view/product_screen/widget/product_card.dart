import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;
  final String ratings;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.name,
    required this.price,
    required this.ratings,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.23,
      width: 185,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.withOpacity(0.2))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: Get.height * 0.15,
                child: Image.network(
                  imagePath,
                  fit: BoxFit.fitWidth,
                )),
            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              "$name",
              style: const TextStyle(
                color: Colors.indigo,
              ),
            ),
            Text(
              "Price: $price tk",
              style: const TextStyle(
                color: Colors.indigo,
              ),
            ),
            Text("Ratings :$ratings"),
          ],
        ),
      ),
    );
  }
}
