import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/school_filters/filters_cubit.dart';
import 'package:yaschools/cubits/schools_list/schools_cubit.dart';
import 'package:yaschools/cubits/schools_lookups/lookups_cubit.dart';
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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SchoolsCubit()..getSchools()),
        BlocProvider(create: (_) => LookupsCubit()..getLookups()),
        BlocProvider(create: (_) => FiltersCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Directionality(
          textDirection: TextDirection.rtl,
          child: MainTab(),
        ),
        theme: getApplicationTheme(),
      ),
    );
  }
}
