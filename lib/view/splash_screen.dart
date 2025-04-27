import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trackin/res/colors/app_color.dart';
import 'package:trackin/res/route/routes_names.dart';
import 'dart:async';

import 'package:trackin/services/localization_service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> fadeAnimation;
  final box = GetStorage();//language

  @override
  void initState() {
    super.initState();

    animationController = AnimationController( vsync: this,
      duration: const Duration(seconds: 3),
    );
    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(animationController);
    animationController.forward();
    navigate();
  }

  Future<void> navigate() async {
    await Future.delayed(const Duration(seconds: 3)); // wait for animation and splash
    String? lang = box.read('language');
    if (lang != null) {
      LocalizationService.changeLocale(lang);
      Get.offNamed(RouteName.loginScreen,);
    } else {
      Get.offNamed(RouteName.languageSelectionScreen);
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.accentColor,
      body: FadeTransition(
        opacity: fadeAnimation,
        child: Column(
          children: [
            // This Expanded will push the image to the center
            Expanded(
              child: Center(
                child: Image.asset(
                  'assets/images/logo.png',
                  width: Get.width * 0.72,
                  height: Get.height * 0.3,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            // The text widget is positioned at the bottom center
            Padding(
              padding:EdgeInsets.only(bottom: Get.height * 0.1), // Optional padding at the bottom
              child: Column(
                children: [
                  Text(
                    'By Usman Rasheed',
                    style: TextStyle(
                        color: AppColor.blackColor,
                        fontSize: Get.width * 0.035,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
