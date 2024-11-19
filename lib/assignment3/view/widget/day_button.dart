import 'package:flutter/material.dart';

class DayButton extends StatelessWidget {
  const DayButton({
    super.key, required this.onTap, required this.name,
  });
  final VoidCallback onTap;
  final String name;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white.withOpacity(0.1)),
        child:  Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}