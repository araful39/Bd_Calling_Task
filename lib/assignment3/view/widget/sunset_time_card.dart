import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SunsetTimeCard extends StatelessWidget {
  const SunsetTimeCard({
    super.key, required this.imageUrl, required this.sunsetTime, required this.sunriseTime,
  });
final String imageUrl;
final String sunsetTime;
final String sunriseTime;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: Get.width*0.8,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.2),
          borderRadius: BorderRadius.circular(15)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(imageUrl),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Sunset",style: TextStyle(color: Colors.white),),
              Text(sunsetTime,style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Sunrise",style: TextStyle(color: Colors.white),),
              Text(sunriseTime,style: const TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),),
            ],
          ),
        ],
      ),
    );
  }
}