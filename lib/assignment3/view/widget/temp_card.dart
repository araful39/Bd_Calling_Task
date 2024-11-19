import 'package:flutter/material.dart';

class TemperatureCard extends StatelessWidget {
  const TemperatureCard({
    super.key, required this.time, required this.imageUrl, required this.temp,
  });
  final String time;
  final String imageUrl;
  final String temp;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),
      width: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.white.withOpacity(0.2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            time,
            style: const TextStyle(color: Colors.white),
          ),
          Image.asset(
            imageUrl,
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                temp,
                style: const TextStyle(color: Colors.white),
              ),
              const Icon(
                Icons.circle_outlined,
                color: Colors.white,
                size: 8,
              )
            ],
          ),
        ],
      ),
    );
  }
}