import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_technologies_task/bindings/state_holders_binders.dart';
import 'package:scube_technologies_task/features/project_element/views/home_screen.dart';
import 'package:scube_technologies_task/utils/custom_size_extention.dart';

class ScubeTechnologiesTask extends StatelessWidget {
  const ScubeTechnologiesTask({super.key});

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    ScreenSizes.screenWidth = size.width;
    ScreenSizes.screenHeight = size.height;

    return GetMaterialApp(
      initialBinding: StateHoldersBinders(),
      debugShowCheckedModeBanner: false,
      title: 'Scube Technologies Task',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),

        inputDecorationTheme:  InputDecorationTheme(
          contentPadding: EdgeInsets.symmetric(horizontal: 16.rSp),
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          disabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          labelStyle:TextStyle(
            color: Colors.grey.shade500,
          ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}