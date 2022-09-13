import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/school_filters/filters_cubit.dart';
import 'package:yaschools/models/lookup_model.dart';
import 'package:yaschools/utils/enums.dart';

class FilterDropdownSection extends StatelessWidget {
  final String title;
  final List<LookupModel> list;
  final LookupType type;

  const FilterDropdownSection({
    super.key,
    required this.title,
    required this.list,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final filters = BlocProvider.of<FiltersCubit>(context);

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
                  value: filters.state[type],
                  items: list
                      .map(
                        (e) => DropdownMenuItem(
                          value: e.name,
                          child: Text(e.name),
                        ),
                      )
                      .toList(),
                  onChanged: (val) => filters.setSelFilters(type, val),
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
