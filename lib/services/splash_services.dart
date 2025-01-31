import 'dart:async';

import 'package:get/get.dart';

import '../res/route/routes_names.dart';

class SplashServices{
  void isLogin(){
    Timer(const Duration(seconds: 3),()=>Get.offNamed(RouteName.loginScreen));
  }
}
/*
class SplashServices{
  final authUser = FirebaseAuth.instance.currentUser;
  final ref = FirebaseDatabase.instance.ref('tracking');

  void isLogin(){
    if(authUser != null){
      User? user = authUser;
      if (user != null) {
        String email = user.email ?? '';
        // Query to find the entry with the current user's email
        Query query = ref.orderByChild('email').equalTo(email);
        query.onValue.listen((event) {
          if(event.snapshot.exists) {
            //Utils.toastMessage('user email available in db');
            Timer(const Duration(seconds: 3),()=>Get.offNamed(RouteName.dashboardScreen));
          }else {
            //Utils.toastMessage('Not Found user in db');
            Timer(const Duration(seconds: 3),()=>Get.offNamed(RouteName.profileScreen));
          }
        });
      }
    }else{
      Timer(const Duration(seconds: 3),()=>Get.offNamed(RouteName.loginScreen));
    }
  }
}*/
