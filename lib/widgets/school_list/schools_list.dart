import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/school_filters/filters_cubit.dart';
import 'package:yaschools/cubits/schools_list/schools_cubit.dart';
import 'package:yaschools/cubits/schools_list/schools_state.dart';
import 'package:yaschools/widgets/school_list/school_list_skeleton.dart';
import 'package:yaschools/widgets/school_list/schools_list_item.dart';

class SchoolsList extends StatelessWidget {
  const SchoolsList({super.key});

  @override
  Widget build(BuildContext context) {
    final schools = BlocProvider.of<SchoolsCubit>(context);
    final filters = BlocProvider.of<FiltersCubit>(context);

    pullRefresh() {
      return schools.getSchools(filters: filters.state);
    }

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
            return NotificationListener<ScrollNotification>(
              onNotification: (not) {
                if (not is ScrollEndNotification &&
                    not.metrics.pixels == not.metrics.maxScrollExtent) {
                  print('Next Page ...');
                }
                return false;
              },
              child: RefreshIndicator(
                onRefresh: () => pullRefresh(),
                child: GridView.builder(
                  padding: const EdgeInsets.all(15),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: .55,
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (_, index) =>
                      SchoolsListItem(state.schools[index]),
                  itemCount: state.schools.length,
                ),
              ),
            );
          } else {
            return const Center(child: Text('Something went wrong'));
          }
        },
      ),
    );
  }
}
