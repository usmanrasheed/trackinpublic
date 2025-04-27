import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LocalizationService {
  static final box = GetStorage();

  static final locales = {
    'en': Locale('en', 'US'),
    'ur': Locale('ur', 'PK'),
  };

  static Locale get currentLocale {
    String? langCode = box.read('language');
    return locales[langCode] ?? Locale('en', 'US');
  }

  static void changeLocale(String langCode) {
    box.write('language', langCode);
    Get.updateLocale(locales[langCode]!);
  }
}
