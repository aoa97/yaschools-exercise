import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:yaschools/pages/home_page.dart';
import 'package:yaschools/theme/palette.dart';

class MainTab extends StatefulWidget {
  const MainTab({super.key});

  @override
  State<MainTab> createState() => _MainTabState();
}

class _MainTabState extends State<MainTab> {
  var _currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomePage(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          selectedItemColor: Palette.mainSwatch,
          unselectedItemColor: Palette.grey,
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home_outlined),
              title: const Text("الرئيسية"),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.grid_view_sharp),
              title: const Text("بحث المدارس"),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.notifications_outlined),
              title: const Text("الإشعارات"),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.person_outline),
              title: const Text("الصفخة الشخصية"),
            ),
          ],
        ),
      ),
    );
  }
}
