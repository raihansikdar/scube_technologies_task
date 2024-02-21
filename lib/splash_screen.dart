import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:scube_technologies_task/features/project_element/views/home_screen.dart';
import 'package:scube_technologies_task/utils/assets_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) => Get.offAll(()=> const HomeScreen()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(child: Image.asset(AssetsPath.logoJPG,width: double.infinity,fit: BoxFit.cover,)),
          Positioned(
            left: 0,
              right: 0,
              bottom: 20,
              child: LoadingAnimationWidget.dotsTriangle(color: Colors.green, size: 30))
        ],
      ),
    );
  }
}