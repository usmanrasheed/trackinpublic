import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/signup_controller.dart';
import '../../custom_widgets/round_buttons.dart';
import '../../res/colors/app_color.dart';
import '../../res/utils/utils.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final SignUpController controller = Get.put(SignUpController());

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
                SizedBox(height: Get.height *0.02),
                //email
                Obx(
                      ()=> TextFormField(
                    controller: controller.emailController.value,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      contentPadding:const EdgeInsets.only(left: 10,right: 10),
                      hintText: 'email@xyz.com',
                      labelText: 'Email',
                      errorText: controller.emailError.value.isNotEmpty
                          ? controller.emailError.value
                          : null,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.email_outlined,),
                    ),
                  ),
                ),
                SizedBox(height: Get.height *0.02),
                //password
                Obx(
                      ()=> TextFormField(
                    controller: controller.passwordController.value,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding:const EdgeInsets.only(left: 10,right: 10),
                      hintText: 'Password',
                      labelText: 'Password',
                      errorText: controller.passwordError.value.isNotEmpty
                          ? controller.passwordError.value
                          : null,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.password_outlined,),
                    ),
                  ),
                ),
                SizedBox(height: Get.height *0.02),
                //confirm password
                Obx(
                      ()=> TextFormField(
                    controller: controller.confirmPasswordController.value,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding:const EdgeInsets.only(left: 10,right: 10),
                      labelText: 'Confirm Password',
                      hintText: 'Confirm Password',
                      errorText: controller.confirmPasswordError.value.isNotEmpty
                          ? controller.confirmPasswordError.value
                          : null,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.password_outlined,),
                    ),
                  ),
                ),
                SizedBox(height: Get.height *0.02),
                //button
                RoundButtons(
                    width: Get.width * 0.3,
                    height: Get.height * 0.05,
                    title: 'Sign Up',
                    loading: false,
                    onTap: (){
                      controller.validateAllTextField();
                      if(controller.isFormValid()){
                        Utils.toastMessage('sign up button click');
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
