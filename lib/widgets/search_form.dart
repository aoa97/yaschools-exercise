import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/schools_list/schools_cubit.dart';

class SerachForm extends StatelessWidget {
  const SerachForm({super.key});

  @override
  Widget build(BuildContext context) {
    searchHandler(String val) {
      if (val.isEmpty) {
        return;
      }
      BlocProvider.of<SchoolsCubit>(context).getSchools(searchQuery: val);
    }

    return Container(
      padding: const EdgeInsets.only(bottom: 16, left: 8, right: 8),
      child: TextField(
        onSubmitted: searchHandler,
        textInputAction: TextInputAction.search,
        decoration: const InputDecoration(
          hintText: "اكتب كلمة البحث هنا",
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
