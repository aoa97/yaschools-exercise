import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/schools_list/schools_cubit.dart';
import 'package:yaschools/cubits/schools_list/schools_state.dart';
import 'package:yaschools/widgets/school_list/school_list_skeleton.dart';
import 'package:yaschools/widgets/school_list/schools_list_item.dart';

class SchoolsList extends StatelessWidget {
  const SchoolsList({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Expanded(
      child: BlocBuilder<SchoolsCubit, SchoolsState>(
        builder: (_, state) {
          if (state is SchoolsLoading) {
            return const SchoolsListSkeleton();
          } else if (state is SchoolsSuccess) {
            if (state.schools.isEmpty) {
              return Center(
                child: Text(
                  'لا توجد نتائج برجاء إعادة تهيئة البحث ...',
                  style: Theme.of(context).textTheme.headline3,
                ),
              );
            }
            return GridView.builder(
              padding: const EdgeInsets.all(15),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: size.height > 700 ? 3 / 5.5 : 3 / 5.2,
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (_, index) => SchoolsListItem(state.schools[index]),
              itemCount: state.schools.length,
            );
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}
