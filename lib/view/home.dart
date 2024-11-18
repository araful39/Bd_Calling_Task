import 'package:bd_calling_task/custom_widget/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Bd Calling Task"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              CustomElevatedButton(buttonName: 'Assignment 1', onPressed: () {  },),
              CustomElevatedButton(buttonName: 'Assignment 2', onPressed: () {  },),
              CustomElevatedButton(buttonName: 'Assignment 3', onPressed: () {  },),

            ],
          ),
        ));
  }
}


