import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationController extends GetxController{
  static final languages = ['English', 'Español', 'Français'].obs;
  var currentLanguage = 'English'.obs;

  final locales = const {
    'English': Locale('en', 'US'),
    'Español': Locale('es', 'ES'),
    'Français': Locale('fr', 'FR'),
  };

  Locale get currentLocale => locales[currentLanguage.value] ?? const Locale('en', 'US');
  

  void changeLanguage(String lang) {
    currentLanguage.value = lang;
    Get.updateLocale(locales[lang]!);
  }

}

