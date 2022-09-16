import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/school_filters/filters_cubit.dart';
import 'package:yaschools/cubits/schools_list/schools_cubit.dart';
import 'package:yaschools/cubits/schools_list/schools_state.dart';
import 'package:yaschools/theme/palette.dart';
import 'package:yaschools/widgets/header/filter_button.dart';
import 'package:yaschools/widgets/filters/filters_modal.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final schools = BlocProvider.of<SchoolsCubit>(context);
    final filters = BlocProvider.of<FiltersCubit>(context);

    showFilters() {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        builder: (_) => SizedBox(
          width: double.infinity,
          height: size.height * .7,
          child: const Filters(),
        ),
      );
    }

    refresh() {
      schools.getSchools();
      filters.clearFilters();
    }

    return BlocConsumer<SchoolsCubit, SchoolsState>(
      builder: (_, state) => Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: showFilters,
                    icon: const Icon(Icons.filter_list, size: 20),
                    label: const Text("تصفية المدارس"),
                    style: TextButton.styleFrom(
                      foregroundColor: Palette.black,
                      textStyle: Theme.of(context).textTheme.headline3!,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: refresh,
                    icon: const Icon(Icons.autorenew, size: 14),
                    label: const Text("إعادة تهيئة البحث"),
                    style: TextButton.styleFrom(
                      foregroundColor: Palette.grey,
                      textStyle: const TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              if (schools.filterValues.isNotEmpty)
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: 30,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => FilterButton(
                      type: schools.filterKeys[index],
                      label: schools.filterValues[index].typeAr,
                      value: schools.filterValues[index].valAr,
                    ),
                    separatorBuilder: (_, index) => const SizedBox(width: 5),
                    itemCount: schools.filterValues.length,
                  ),
                )
            ],
          ),
        ),
      ),
      listener: (_, state) {},
    );
  }
}
