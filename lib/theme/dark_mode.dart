import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    inversePrimary: Colors.green.shade500,
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: Colors.green[300],
    displayColor: Colors.white,
  ),
);