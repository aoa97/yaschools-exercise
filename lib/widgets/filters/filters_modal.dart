import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/school_filters/filters_cubit.dart';
import 'package:yaschools/cubits/schools_list/schools_cubit.dart';
import 'package:yaschools/cubits/schools_lookups/lookups_cubit.dart';
import 'package:yaschools/cubits/schools_lookups/lookups_state.dart';
import 'package:yaschools/utils/enums.dart';
import 'package:yaschools/widgets/filters/filter_dropdown_section.dart';
import 'package:yaschools/widgets/filters/filter_horizontal_section.dart';
import 'package:yaschools/widgets/filters/location_section.dart';
import 'package:yaschools/widgets/filters/reservation_section.dart';
import 'package:yaschools/widgets/ui/main_button.dart';
import 'package:yaschools/widgets/filters/filter_slider_section.dart';

class Filters extends StatelessWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    final lookups = BlocProvider.of<LookupsCubit>(context);
    final filters = BlocProvider.of<FiltersCubit>(context);
    final schools = BlocProvider.of<SchoolsCubit>(context);

    handlePress() {
      Navigator.of(context).pop();
      // Selects nothing / doesn't change filters => skip fetching again
      if (filters.state.isEmpty || filters.state == schools.currentFilters) {
        return;
      }
      schools.getSchools(filters: filters.state);
    }

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "تصفية البحث",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(height: 8),
                      const ReservationSection(),
                      const LocationSection(),
                      const Divider(),
                      FilterDropdownSection(
                        title: "المنهح",
                        list: lookups.curriculums,
                        filterKey: 'curriculum_id',
                        type: LookupType.curriculum,
                      ),
                      FilterHorizontalSection(
                        title: "المرحلة الدراسية",
                        list: lookups.stages,
                        filterKey: 'stage_id',
                        type: LookupType.stage,
                      ),
                      FilterHorizontalSection(
                        title: "الطلاب",
                        list: lookups.students,
                        filterKey: 'gender_id',
                        type: LookupType.student,
                      ),
                      FilterHorizontalSection(
                        title: "نوع المدرسة",
                        list: lookups.categories,
                        filterKey: 'category_id',
                        type: LookupType.category,
                      ),
                      const FilterSliderSection(
                        title: "الرسوم الدراسية",
                      ),
                    ],
                  ),
                ),
              ),
              MainButton(
                label: "تصفية النتائج",
                padding: const EdgeInsets.symmetric(vertical: 10),
                onPressed: handlePress,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
