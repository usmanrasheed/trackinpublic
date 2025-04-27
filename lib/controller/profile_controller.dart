
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../res/route/routes_names.dart';
import '../res/utils/utils.dart';

class ProfileController extends GetxController{

  final emailController = TextEditingController().obs;
  final nameController = TextEditingController().obs;
  final phoneController = TextEditingController().obs;
  final deviceIdController = TextEditingController().obs;
  final deviceSNoController = TextEditingController().obs;
  var selectedVehicleType = ''.obs;  // This will hold the selected value
  final vehicleNumberController = TextEditingController().obs;
  final makeYearController = TextEditingController().obs;

  var emailError = ''.obs;
  var nameError = ''.obs;
  var phoneError = ''.obs;
  var deviceIdError = ''.obs;
  var deviceSNoError = ''.obs;
  var vehicleTypeError = ''.obs;
  var vehicleNumberError = ''.obs;
  var makeYearError = ''.obs;
  bool authenticateIdBool = false;
  bool authenticateSNoBool = false;
  bool alreadyRegisteredId = false;

  void getEmail(){
    Utils.toastMessage('get email function call');
    emailController.value.text = "usman@gmail.com";
  }
  void validateEmail() {
    if (emailController.value.text.isEmpty) {
      emailError.value = "Email can't be empty";
    } else if (!GetUtils.isEmail(emailController.value.text)) {
      emailError.value = "Enter a valid email";
    } else {
      emailError.value = '';
    }
  }
  void validateName() {
    if (nameController.value.text.isEmpty) {
      nameError.value = "Name can't be empty";
    }
    else if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(nameController.value.text)) {
      nameError.value = 'Name can only contain letters and spaces';
    }
    else {
      nameError.value = '';
    }
  }
  void validatePhone() {
    if (phoneController.value.text.isEmpty) {
      phoneError.value = "Phone can't be empty";
    }
    else if (!RegExp(r'^[0-9]{11}$').hasMatch(phoneController.value.text)) {
      phoneError.value = 'Phone number must be exactly 11 digits';
    }
    else {
      phoneError.value = '';
    }
  }
  void validateDeviceId() {
    if (deviceIdController.value.text.isEmpty) {
      deviceIdError.value = "Tracking Device Id can't be empty";
    }
    else {
      deviceIdError.value = '';
    }
  }
  void validateDeviceSNo() {
    if (deviceSNoController.value.text.isEmpty) {
      deviceSNoError.value = "Tracking Device S.No can't be empty";
    }
    else {
      deviceSNoError.value = '';
    }
  }
  void validateVehicleType() {
    if (selectedVehicleType.value.isEmpty) {
      vehicleTypeError.value = "Vehicle Type can't be empty";
    } else {
      vehicleTypeError.value = '';
    }
  }
  void validateVehicleNumber() {
    if (vehicleNumberController.value.text.isEmpty) {
      vehicleNumberError.value = "Vehicle Number can't be empty";
    }
    else if (!RegExp(r'^[a-zA-Z0-9]+$').hasMatch(vehicleNumberController.value.text)) {
      vehicleNumberError.value = 'Special Character Not Allowed';
    }
    else {
      vehicleNumberError.value = '';
    }
  }
  void validateMakeYear() {
    if (makeYearController.value.text.isEmpty) {
      makeYearError.value = "Make Year can't be empty";
    }
    else if (!RegExp(r'^[0-9]+$').hasMatch(makeYearController.value.text)) {
      makeYearError.value = 'Make Year can only contain numbers';
    }
    else {
      makeYearError.value = '';
    }
  }
  void validateAllTextField() {
    validateEmail();
    validateName();
    validatePhone();
    validateDeviceId();
    validateDeviceSNo();
    validateVehicleType();
    validateVehicleNumber();
    validateMakeYear();
  }
  bool isFormValid() {
    return emailError.value.isEmpty &&
        nameError.value.isEmpty &&
        phoneError.value.isEmpty &&
        deviceIdError.value.isEmpty &&
        deviceSNoError.value.isEmpty &&
        vehicleTypeError.value.isEmpty &&
        vehicleNumberError.value.isEmpty &&
        makeYearError.value.isEmpty;
  }

  @override
  void onClose() {
    emailController.value.dispose();
    phoneController.value.dispose();
    nameController.value.dispose();
    deviceIdController.value.dispose();
    deviceSNoController.value.dispose();
    vehicleNumberController.value.dispose();
    makeYearController.value.dispose();
    super.onClose();
  }

  void profileUpdated() {
    Utils.toastMessage('profile updated function call..');//login function
    Get.toNamed(RouteName.dashboardScreen);
  }

  void authenticateDeviceId() async {
    Utils.toastMessage('Auth device Id');
  }
  void authenticateDeviceSNo() async {
    Utils.toastMessage('Auth device sno');
  }
  void checkDeviceAlreadyRegistered() async {
    Utils.toastMessage('check device already registered..');
  }

}