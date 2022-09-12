import 'package:flutter/material.dart';
import 'package:yaschools/theme/palette.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primarySwatch: Palette.mainSwatch,
    scaffoldBackgroundColor: Palette.scaffold,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headline2: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Palette.black,
      ),
      headline3: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Palette.black,
      ),
      headline4: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Palette.black,
      ),
      headline5: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Palette.grey,
      ),
      headline6: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.bold,
        color: Palette.grey,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      labelStyle: TextStyle(color: Palette.grey),
    ),
  );
}
