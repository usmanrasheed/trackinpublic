import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/login_controller.dart';
import '../../custom_widgets/round_buttons.dart';
import '../../res/colors/app_color.dart';
import '../../res/route/routes_names.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final LoginController controller = Get.put(LoginController());
  //final auth = FirebaseAuth.instance;
  //this is for test git

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.accentColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width *0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Image.asset(
              'assets/images/logo.png',
              width: Get.width * 0.5,
              height: Get.height * 0.2,
              fit: BoxFit.contain,
            ),
            SizedBox(height: Get.height *0.02),
            //email
            Obx(()=> TextFormField(
                controller: controller.emailController.value,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: AppColor.mainColor), // Change text color
                decoration: InputDecoration(
                  contentPadding:const EdgeInsets.only(left: 10,right: 10),
                  hintText: 'email@xyz.com',
                  labelText: 'email'.tr,
                  errorText: controller.emailError.value.isNotEmpty
                      ? controller.emailError.value
                      : null,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
              ),
            ),
            SizedBox(height: Get.height *0.02),
            //password
            Obx(()=> TextFormField(
                controller: controller.passwordController.value,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding:const EdgeInsets.only(left: 10,right: 10),
                  hintText: 'password'.tr,
                  labelText: 'password'.tr,
                  errorText: controller.passwordError.value.isNotEmpty
                      ? controller.passwordError.value
                      : null,
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.password_outlined,),
                ),
                /*onChanged: (value) {
                      controller.validatePassword();
                    },*/
              ),
            ),
            SizedBox(height: Get.height *0.02),
            //login button
            RoundButtons(
                width: Get.width * 0.3,
                height: Get.height * 0.05,
                title: 'login'.tr,
                loading: false,
                onTap: (){
                  controller.validateAllTextField();
                  if(controller.isFormValid()){
                    controller.login();
                  }
                }),
            SizedBox(height: Get.height *0.02,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("don't have an account?".tr,style: TextStyle(color: AppColor.blackColor),),
                TextButton(onPressed: (){
                  Get.toNamed(RouteName.signUpScreen);
                }, child: Text('sign Up'.tr,style: TextStyle(color: AppColor.mainColor),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
