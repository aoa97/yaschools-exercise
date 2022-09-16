import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/schools_list/schools_cubit.dart';
import 'package:yaschools/cubits/schools_lookups/lookups_cubit.dart';
import 'package:yaschools/utils/assets.dart';
import 'package:yaschools/widgets/header/header.dart';
import 'package:yaschools/widgets/school_list/schools_list.dart';
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
  void initState() {
    BlocProvider.of<LookupsCubit>(context);
    BlocProvider.of<SchoolsCubit>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: _isSearchVisible ? size.height * .20 : size.height * .09,
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
          Text("تصفح المدارس", style: Theme.of(context).textTheme.headline1)
        ]),
        actions: [
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
