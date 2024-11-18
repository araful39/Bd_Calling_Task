import 'package:bd_calling_task/custom_widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'assignment1/view/product_screen/product_screen.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo,
          centerTitle: true,
          title: const Text("Bd Calling Task",style: TextStyle(color: Colors.white),),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              CustomElevatedButton(buttonName: 'Assignment 1', onPressed: () {
                Get.to(()=>const ProductScreen());

              },),
              CustomElevatedButton(buttonName: 'Assignment 2', onPressed: () {  },),
              CustomElevatedButton(buttonName: 'Assignment 3', onPressed: () {  },),

            ],
          ),
        ));
  }
}


