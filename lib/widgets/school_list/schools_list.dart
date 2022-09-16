import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/school_filters/filters_cubit.dart';
import 'package:yaschools/cubits/schools_list/schools_cubit.dart';
import 'package:yaschools/cubits/schools_list/schools_state.dart';
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
          return NotificationListener<ScrollNotification>(
            onNotification: (not) {
              if (not is ScrollEndNotification &&
                  not.metrics.pixels == not.metrics.maxScrollExtent) {
                schools.getSchools(filters: filters.state, nextPage: true);
              }
              return false;
            },
            child: RefreshIndicator(
              onRefresh: () => pullRefresh(),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: CustomScrollView(slivers: [
                  if (state is SchoolsSuccess && schools.schoolsList.isEmpty)
                    SliverFillRemaining(
                      child: Center(
                        child: Text(
                          'لا توجد نتائج برجاء إعادة تهيئة البحث ...',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                    ),
                  if (schools.schoolsList.isNotEmpty)
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                        (_, index) =>
                            SchoolsListItem(schools.schoolsList[index]),
                        childCount: schools.schoolsList.length,
                      ),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: .55,
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                    ),
                  if (state is SchoolsLoading && schools.schoolsList.isNotEmpty)
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(top: 16, bottom: 8),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  if (state is SchoolsLoading && schools.schoolsList.isEmpty)
                    const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  if (state is SchoolsFailure)
                    const SliverFillRemaining(
                      child: Center(child: Text('Something went wrong')),
                    )
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
