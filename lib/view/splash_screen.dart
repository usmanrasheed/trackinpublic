import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../res/colors/app_color.dart';
import '../services/splash_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashScreenServices = SplashServices();

  @override
  void initState() {
    super.initState();
    splashScreenServices.isLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.accentColor,
      body: Column(
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
                  'by_usman_rasheed'.tr,
                  style: TextStyle(
                      color: AppColor.blackColor,
                      fontSize: Get.height * 0.035,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

  }
}
