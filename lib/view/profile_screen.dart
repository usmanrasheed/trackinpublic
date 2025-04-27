import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_controller.dart';
import '../custom_widgets/round_buttons.dart';
import '../res/colors/app_color.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final ProfileController controller = Get.put(ProfileController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getEmail();
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
                //email
                Obx(
                      ()=> TextFormField(
                    controller: controller.emailController.value,
                    keyboardType: TextInputType.emailAddress,
                    readOnly: true,
                    style: const TextStyle(color: AppColor.secondaryColor),
                    decoration: InputDecoration(
                      contentPadding:const EdgeInsets.only(left: 10,right: 10),
                      //hintText: 'email@xyz.com',
                      //labelText: 'Email',
                      filled: true, // Add this line
                      fillColor: AppColor.greyColor.withOpacity(0.3),
                      errorText: controller.emailError.value.isNotEmpty
                          ? controller.emailError.value
                          : null,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                  ),
                ),
                SizedBox(height: Get.height *0.02),
                //name
                Obx(
                      ()=> TextFormField(
                    controller: controller.nameController.value,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      contentPadding:const EdgeInsets.only(left: 10,right: 10),
                      hintText: 'Enter Your Name',
                      labelText: 'Name',
                      errorText: controller.nameError.value.isNotEmpty
                          ? controller.nameError.value
                          : null,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.person_outline,),
                    ),
                  ),
                ),
                SizedBox(height: Get.height *0.02),
                //phone
                Obx(
                      ()=> TextFormField(
                    controller: controller.phoneController.value,
                    keyboardType: TextInputType.number,
                    maxLength: 11,
                    decoration: InputDecoration(
                      contentPadding:const EdgeInsets.only(left: 10,right: 10),
                      hintText: '11 digit phone no',
                      labelText: 'Phone Number',
                      errorText: controller.phoneError.value.isNotEmpty
                          ? controller.phoneError.value
                          : null,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.contact_phone_outlined,),
                      counterText: '',
                    ),
                  ),
                ),
                SizedBox(height: Get.height *0.02),
                //device id
                Obx(
                      ()=> TextFormField(
                    controller: controller.deviceIdController.value,
                    keyboardType: TextInputType.number,
                    maxLength: 15,
                    decoration: InputDecoration(
                      contentPadding:const EdgeInsets.only(left: 10,right: 10),
                      hintText: 'tracking Device Id Enter Carefully',
                      labelText: 'Tracking Device Id',
                      errorText: controller.deviceIdError.value.isNotEmpty
                          ? controller.deviceIdError.value
                          : null,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.key_outlined,),
                      counterText: '',
                    ),
                    onChanged: (value) async{
                      controller.authenticateDeviceId(); // Call filter validation function from the controller
                    },
                  ),
                ),
                SizedBox(height: Get.height *0.02),
                //device sno
                Obx(
                      ()=> TextFormField(
                    controller: controller.deviceSNoController.value,
                    keyboardType: TextInputType.text,
                    maxLength: 20,
                    decoration: InputDecoration(
                      contentPadding:const EdgeInsets.only(left: 10,right: 10),
                      hintText: 'tracking Device S.NO',
                      labelText: 'Tracking Device S.No',
                      errorText: controller.deviceSNoError.value.isNotEmpty
                          ? controller.deviceSNoError.value
                          : null,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.confirmation_number_outlined,),
                      counterText: '',
                    ),
                    onChanged: (value) async{
                      controller.authenticateDeviceSNo(); // Call filter validation function from the controller
                    },
                  ),
                ),
                SizedBox(height: Get.height *0.02),
                //vehicle type
                Obx(() => DropdownButtonFormField<String>(
                  value: controller.selectedVehicleType.value.isEmpty
                      ? null
                      : controller.selectedVehicleType.value,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(left: 10, right: 10),
                    labelText: 'Vehicle Type',
                    errorText: controller.vehicleTypeError.value.isNotEmpty
                        ? controller.vehicleTypeError.value
                        : null,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.bike_scooter_outlined),
                  ),
                  items: ['Bike', 'Car', 'Other'].map((String type) {
                    return DropdownMenuItem<String>(
                      value: type,
                      child: Text(type,style: const TextStyle(color: AppColor.mainColor),),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    controller.selectedVehicleType.value = newValue ?? '';
                  },
                ),
                ),
                SizedBox(height: Get.height *0.02),
                //licence plate no
                Obx(
                      ()=> TextFormField(
                    controller: controller.vehicleNumberController.value,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.characters,
                    maxLength: 8,
                    decoration: InputDecoration(
                      contentPadding:const EdgeInsets.only(left: 10,right: 10),
                      hintText: 'ABC1010',
                      labelText: 'Licence Plate Number',
                      errorText: controller.vehicleNumberError.value.isNotEmpty
                          ? controller.vehicleNumberError.value
                          : null,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.numbers_outlined,),
                      counterText: '',
                    ),
                  ),
                ),
                SizedBox(height: Get.height *0.02),
                //make year
                Obx(
                      ()=> TextFormField(
                    controller: controller.makeYearController.value,
                    keyboardType: TextInputType.number,
                    maxLength: 4,
                    decoration: InputDecoration(
                      contentPadding:const EdgeInsets.only(left: 10,right: 10),
                      hintText: '2024',
                      labelText: 'Make Year',
                      errorText: controller.makeYearError.value.isNotEmpty
                          ? controller.makeYearError.value
                          : null,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.calendar_month_outlined),
                      counterText: '',
                    ),
                  ),
                ),
                SizedBox(height: Get.height *0.02),
                RoundButtons(
                    width: Get.width * 0.3,
                    height: Get.height * 0.05,
                    title: 'Next',
                    loading: false,
                    onTap: (){
                      controller.validateAllTextField();
                      if(controller.isFormValid()){
                        controller.profileUpdated();
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
