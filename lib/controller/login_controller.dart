import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../res/route/routes_names.dart';
import '../res/utils/utils.dart';

class LoginController extends GetxController{
  
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  var emailError = ''.obs;
  var passwordError = ''.obs;

  void validateEmail() {
    if (emailController.value.text.isEmpty) {
      emailError.value = "email can't be empty".tr;
    } else if (!GetUtils.isEmail(emailController.value.text)) {
      emailError.value = "enter a valid email".tr;
    } else {
      emailError.value = '';
    }
  }

  void validatePassword() {
    if (passwordController.value.text.isEmpty) {
      passwordError.value = "password can't be empty".tr;
    }else if(passwordController.value.text.length<6){
      passwordError.value = "password should be at least 6 character".tr;
    }else {
      passwordError.value = '';
    }
  }

  void validateAllTextField() {
    validateEmail();
    validatePassword();
  }

  bool isFormValid() {
    return emailError.value.isEmpty &&
        passwordError.value.isEmpty;
  }

  void login(){
    Utils.toastMessage("welcome".tr);
    Get.offNamed(RouteName.profileScreen);
  }

  @override
  void onClose() {
    emailController.value.dispose();
    passwordController.value.dispose();
    super.onClose();
  }
}