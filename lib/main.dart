import 'package:delente_assignment/controllers/theme_controller.dart';
import 'package:delente_assignment/core/routes/routes.dart';
import 'package:delente_assignment/core/routes/routes_name.dart';
import 'package:delente_assignment/core/services/firebase_api.dart';
import 'package:delente_assignment/core/utils/helpers/app_translations.dart';
import 'package:delente_assignment/core/utils/helpers/stock_binding.dart';
import 'package:delente_assignment/firebase_options.dart';
import 'package:delente_assignment/theme/dark_mode.dart';
import 'package:delente_assignment/theme/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'controllers/localization_controller.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
 await FirebaseApi().initNotifications(); 

 Get.put(ThemeController());
 Get.put(LocalizationController());
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final LocalizationController localizationController = Get.find();
    
    return Obx(() => GetMaterialApp(
      title: 'Flutter Assessment',
      debugShowCheckedModeBanner: false,
     translations: AppTranslations(),
     locale: localizationController.currentLocale,
     fallbackLocale: const Locale('en', 'US'),
     localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
     supportedLocales: const [
            Locale('en', 'US'),
            Locale('es', 'ES'),
            Locale('fr', 'FR'),
          ],
          initialBinding: StockBinding(),
      theme: themeController.isDarkMode.value
      ? darkMode
      : lightMode,
      //home: const LoginScreen(),
      initialRoute: RoutesName.loginScreen,
      getPages: AppRoutes.routes,
    ),

    );
  }}