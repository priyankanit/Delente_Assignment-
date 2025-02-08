import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.green.shade200,
    primary: Colors.green.shade300,
    secondary: Colors.green.shade400,
    tertiary: Colors.green.shade600,
    inversePrimary: Colors.green.shade800,
  ),
  textTheme: ThemeData.light().textTheme.apply(
    bodyColor: Colors.green[800],
    displayColor: Colors.black,
  ),
);