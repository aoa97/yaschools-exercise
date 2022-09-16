import 'package:flutter/material.dart';
import 'package:yaschools/theme/palette.dart';

ThemeData getApplicationTheme() {
  return ThemeData(
    primarySwatch: Palette.mainSwatch,
    scaffoldBackgroundColor: Palette.scaffold,
    textTheme: const TextTheme(
      headline1: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      headline2: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Palette.black,
      ),
      headline3: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: Palette.black,
      ),
      headline4: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Palette.black,
      ),
      headline5: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Palette.grey,
      ),
      headline6: TextStyle(
        fontSize: 11,
        color: Palette.grey,
      ),
      caption: TextStyle(
        fontSize: 14,
        color: Palette.grey,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      labelStyle: TextStyle(color: Palette.grey),
      contentPadding: EdgeInsets.only(left: 5),
      constraints: BoxConstraints(maxHeight: 40),
      isCollapsed: true,
      isDense: true,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Palette.mainSwatch,
        ),
      ),
    ),
    sliderTheme: const SliderThemeData(
      showValueIndicator: ShowValueIndicator.always,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        padding: const EdgeInsets.symmetric(horizontal: 8),
      ),
    ),
  );
}
