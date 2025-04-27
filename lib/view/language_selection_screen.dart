import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trackin/custom_widgets/round_buttons.dart';
import 'package:trackin/res/colors/app_color.dart';
import 'package:trackin/services/localization_service.dart';

import '../res/route/routes_names.dart';

class LanguageSelectionScreen extends StatelessWidget {
  const LanguageSelectionScreen({super.key});

  void _changeLanguage(String langCode) {
    LocalizationService.changeLocale(langCode); // Change language
    Get.offNamed(RouteName.loginScreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.accentColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width *0.1, vertical: Get.height *0.05),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: Get.width * 0.5,
                  height: Get.height * 0.2,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: Get.height *0.01),

                Text(
                  "choose_language".tr,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: Get.height *0.04),
                //L1 button
                RoundButtons(
                    width: Get.width * 0.45,
                    height: Get.height * 0.045,
                    buttonColor: AppColor.mainColorLight,
                    radius: 5,
                    title: 'urdu'.tr,
                    loading: false,
                    onTap: (){
                      _changeLanguage('ur');
                    }),
                SizedBox(height: Get.height *0.02,),
                //L2 button
                RoundButtons(
                    width: Get.width * 0.45,
                    height: Get.height * 0.045,
                    buttonColor: AppColor.mainColorLight,
                    radius: 5,
                    title: 'english'.tr,
                    loading: false,
                    onTap: (){
                      _changeLanguage('en');
                    }),
                SizedBox(height: Get.height *0.02,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
