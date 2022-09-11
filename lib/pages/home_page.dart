import 'package:flutter/material.dart';
import 'package:yaschools/utils/assets.dart';
import 'package:yaschools/widgets/header.dart';
import 'package:yaschools/widgets/schools_list.dart';
import 'package:yaschools/widgets/search_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _isSearchVisible = false;

  _toggleSearch() {
    setState(() => _isSearchVisible = !_isSearchVisible);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _isSearchVisible ? size.height * .20 : size.height * .12,
        bottom: PreferredSize(
          preferredSize: Size.zero,
          child: Visibility(
            visible: _isSearchVisible,
            child: const SerachForm(),
          ),
        ),
        title: Row(children: [
          Image.network(
            AppAssets.appLogo,
            width: 30,
            height: 30,
          ),
          const SizedBox(width: 8),
          const Text("تصفح المدارس")
        ]),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.map_outlined)),
          IconButton(onPressed: _toggleSearch, icon: const Icon(Icons.search)),
        ],
      ),
      body: Column(children: const [
        Header(),
        SchoolsList(),
      ]),
    );
  }
}
