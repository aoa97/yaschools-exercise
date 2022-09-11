import 'dart:io';
import 'package:flutter/material.dart';
import 'package:yaschools/http_overrides.dart';
import 'package:yaschools/pages/main_tab.dart';
import 'package:yaschools/theme/theme_manager.dart';

void main(List<String> args) {
  HttpOverrides.global = PostHttpOverrides(); // Fix NW images error
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: MainTab(),
      ),
      theme: getApplicationTheme(),
    );
  }
}