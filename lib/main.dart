 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'res/colors/app_color.dart';
import 'res/localization/language.dart';
import 'res/route/routes.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // Make status bar transparent or use any color
    statusBarIconBrightness: Brightness.dark, // Use dark icons for a light background
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'trackIn',
      translations: Languages(),
      locale: Locale('en','US'),
      fallbackLocale: Locale('en','US'),
      theme: ThemeData(
        useMaterial3: true, // Enable Material 3
        inputDecorationTheme: const InputDecorationTheme(
          contentPadding: EdgeInsets.only(left: 10, right: 10),
          hintStyle: TextStyle(color: AppColor.greyColor), // Hint text color
          labelStyle: TextStyle(color: AppColor.mainColor), // Label text color
          errorStyle: TextStyle(color: AppColor.errorColor), // Error text color
          border: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.greyColor), // Default border color
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.mainColor), // Focused border color
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.greyColor), // Enabled border color
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColor.errorColor), // Error border color
          ),
          prefixIconColor: AppColor.secondaryColor, // Color for prefix icons
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColor.secondaryColor, // Change cursor color
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: AppColor.mainColor), // Default input text color
        ),
      ),
      /*ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),*/
      getPages:RouteClass.appRoute(),
    );
  }
}
