

import 'package:flutter/material.dart';

import '../res/colors/app_color.dart';

class RoundButtons extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final double height,width,radius;
  final Color textColor,buttonColor;
  final bool loading;


  const RoundButtons({super.key,
    required this.title,
    required this.onTap,
    this.buttonColor = AppColor.secondaryColor,
    this.textColor = AppColor.whiteColor,
    this.width = 100,//Get.height * .2,
    this.height = 40,
    this.radius = 10,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(radius), // Ensure ripple effect follows the rounded corners
      splashColor: Colors.white.withOpacity(0.3), // Customize splash color if needed
      child: Ink(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: loading
              ? CircularProgressIndicator(color: textColor)
              : Text(title, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }
}
