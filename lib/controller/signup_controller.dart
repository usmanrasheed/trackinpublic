import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  var emailError = ''.obs;
  var passwordError = ''.obs;
  var confirmPasswordError = ''.obs;

  void validateEmail() {
    if (emailController.value.text.isEmpty) {
      emailError.value = "Email can't be empty";
    } else if (!GetUtils.isEmail(emailController.value.text)) {
      emailError.value = "Enter a valid email";
    } else {
      emailError.value = '';
    }
  }

  void validatePassword() {
    if (passwordController.value.text.isEmpty) {
      passwordError.value = "Password can't be empty";
    }else if(passwordController.value.text.length<6){
      passwordError.value = "Password should be at least 6 character";
    } else {
      passwordError.value = '';
    }
  }

  void validateConfirmPassword() {
    if (confirmPasswordController.value.text.isEmpty) {
      confirmPasswordError.value = "Confirm Password can't be empty";
    } else if (confirmPasswordController.value.text != passwordController.value.text) {
      confirmPasswordError.value = "Passwords do not match";
    } else {
      confirmPasswordError.value = '';
    }
  }

  void validateAllTextField() {
    validateEmail();
    validatePassword();
    validateConfirmPassword();
    //validateImei();
  }

  bool isFormValid() {
    return emailError.value.isEmpty &&
        passwordError.value.isEmpty &&
        confirmPasswordError.value.isEmpty;
  }

  @override
  void onClose() {
    emailController.value.dispose();
    passwordController.value.dispose();
    confirmPasswordController.value.dispose();
    super.onClose();
  }
}