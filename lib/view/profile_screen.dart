import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/colors/app_color.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                width: Get.width * 0.75,
                height: Get.height * 0.3,
                fit: BoxFit.contain,
              ),
            ),
          ),
          // The text widget is positioned at the bottom center
          Padding(
            padding:EdgeInsets.only(bottom: Get.height * 0.02), // Optional padding at the bottom
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
    );
  }
}
