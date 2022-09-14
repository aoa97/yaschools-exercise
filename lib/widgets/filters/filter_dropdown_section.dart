import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/school_filters/filters_cubit.dart';
import 'package:yaschools/models/filter_model.dart';
import 'package:yaschools/models/lookup_model.dart';
import 'package:yaschools/utils/enums.dart';

class FilterDropdownSection extends StatelessWidget {
  final String title;
  final List<LookupModel> list;
  final LookupType type;
  final String filterKey;

  const FilterDropdownSection({
    super.key,
    required this.title,
    required this.list,
    required this.type,
    required this.filterKey,
  });

  @override
  Widget build(BuildContext context) {
    final filters = BlocProvider.of<FiltersCubit>(context);

    setFilter(LookupModel lookup) {
      filters.setSelFilters(
          type,
          FilterModel(
            filterKey: filterKey,
            filterVal: lookup.id,
            typeAr: title,
            valAr: lookup.name,
          ));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocConsumer<FiltersCubit, Map<LookupType, dynamic>>(
          builder: (ctx, state) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                DropdownButton(
                  isExpanded: true,
                  hint: Text(title),
                  items: list
                      .map((LookupModel e) =>
                          DropdownMenuItem(value: e, child: Text(e.name)))
                      .toList(),
                  onChanged: (lookup) => setFilter(lookup!),
                )
              ],
            ),
          ),
          listener: (_, state) {},
        ),
        const Divider()
      ],
    );
  }
}
