import 'package:get/get.dart';
import 'package:trackin/res/route/routes_names.dart';
import 'package:trackin/view/language_selection_screen.dart';
import '../../view/auth/login_screen.dart';
import '../../view/auth/sign_up_screen.dart';
import '../../view/dashboard_screen.dart';
import '../../view/profile_screen.dart';
import '../../view/splash_screen.dart';

class RouteClass{
  static appRoute()=>[
    GetPage(
      name: RouteName.splashScreen,
      page: () => SplashScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 600),),

    GetPage(
      name: RouteName.languageSelectionScreen,
      page: () => LanguageSelectionScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 600),),

    GetPage(
      name: RouteName.loginScreen,
      page: () => LoginScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 600),),

    GetPage(
      name: RouteName.signUpScreen,
      page: () => SignUpScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 600),),

    GetPage(
      name: RouteName.profileScreen,
      page: () => ProfileScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 600),),

    GetPage(
      name: RouteName.dashboardScreen,
      page: () => DashboardScreen(),
      transition: Transition.rightToLeft,
      transitionDuration: Duration(milliseconds: 600),),

  ];
}