import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../colors/app_color.dart';

class Utils {

  static toastMessage(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        backgroundColor: AppColor.mainColor,
        textColor: AppColor.whiteColor,
        gravity: ToastGravity.BOTTOM
    );
  }

  static snackBar(String title, String message){
    Get.snackbar(
        title,
        message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColor.accentColor,
        colorText: AppColor.blackColor);

  }
}