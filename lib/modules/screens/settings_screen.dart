import 'package:delente_assignment/controllers/theme_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/localization_controller.dart';
import '../../core/utils/constants/text_constants.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    final LocalizationController localizationController = Get.find();

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: Text(
          TextConstants.settings.tr,
          style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 25,
              fontWeight: FontWeight.w400),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20.0,
          ),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(left: 25, top: 10, right: 25),
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //dark mode
                    Text(
                      TextConstants.darkMode.tr,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),

                    //switch

                    Obx(
                      () => CupertinoSwitch(
                        value: themeController.isDarkMode.value,
                        onChanged: (value) => themeController.toggleTheme(),
                      ),
                    ),
                  ],
                ),
              ),
              // Language Selection
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                margin: const EdgeInsets.only(left: 25, top: 20, right: 25),
                padding: const EdgeInsets.all(25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      TextConstants.language.tr, // Localized Language label
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    Obx(
                      () => DropdownButton<String>(
                        value: localizationController.currentLanguage.value,
                        dropdownColor: Theme.of(context).colorScheme.primary,
                        items: LocalizationController.languages
                            .map(
                              (lang) => DropdownMenuItem(
                                value: lang,
                                child: Text(lang),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          if (value != null) {
                            localizationController.changeLanguage(value);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
