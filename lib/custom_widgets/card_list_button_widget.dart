
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../res/colors/app_color.dart';

class CardListButtonWidget extends StatelessWidget {
  final String textName;
  final VoidCallback onTap;
  final double radius;//height,width,
  final Color textColor,buttonColor;
  final Widget icon;


  const CardListButtonWidget({super.key,
    required this.textName,
    required this.onTap,
    this.buttonColor = AppColor.accentColor,
    this.textColor = AppColor.blackColor,
    // this.width = 100,//Get.height * .2,
    // this.height = 40,
    this.radius = 10,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.grey.withOpacity(0.5), // Ripple effect color
      borderRadius: BorderRadius.circular(radius), // Ripple effect border radius
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Get.height *0.01, horizontal: Get.width *0.01 ),
        decoration: BoxDecoration(
          color: Colors.white, // Background color
          borderRadius: BorderRadius.circular(radius), // Border radius
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: radius,
              offset: const Offset(0, 3), // Shadow effect
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centering the row
          children: [
            Padding(
              padding: EdgeInsets.only(left: Get.width*0.04,),
              child: icon,
            ),
            /*Icon(
              icon,//Icons.person_outline, // Icon on the left side
              color: Colors.blue,
              size: 50,// Icon color
            ),*/
            //SizedBox(width: 10), // Spacing between icon and text
            Expanded(
              child: Text(
                textName, // Text in the center
                textAlign: TextAlign.center, // Center the text
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600, // Text styling
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
