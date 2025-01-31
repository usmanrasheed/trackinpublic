import 'package:get/get.dart';
import 'package:trackin/res/route/routes_names.dart';
import '../../view/auth/login_screen.dart';
import '../../view/auth/sign_up_screen.dart';
import '../../view/dashboard_screen.dart';
import '../../view/profile_screen.dart';
import '../../view/splash_screen.dart';

class RouteClass{
  static appRoute()=>[
    GetPage(
      name: RouteName.splashScreen, page: () => const SplashScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(microseconds: 300),),

    GetPage(
      name: RouteName.loginScreen, page: () => LoginScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(microseconds: 300),),

    GetPage(
      name: RouteName.signUpScreen, page: () => const SignUpScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(microseconds: 300),),

    GetPage(
      name: RouteName.profileScreen, page: () => const ProfileScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(microseconds: 300),),

    GetPage(
      name: RouteName.dashboardScreen, page: () => const DashboardScreen(),
      transition: Transition.leftToRight,
      transitionDuration: const Duration(microseconds: 300),),

  ];
}