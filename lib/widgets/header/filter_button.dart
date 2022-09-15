import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/school_filters/filters_cubit.dart';
import 'package:yaschools/cubits/schools_list/schools_cubit.dart';
import 'package:yaschools/utils/enums.dart';

class FilterButton extends StatelessWidget {
  final String label;
  final dynamic value;
  final LookupType type;

  const FilterButton({
    super.key,
    required this.label,
    required this.value,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    final filters = BlocProvider.of<FiltersCubit>(context);
    final schools = BlocProvider.of<SchoolsCubit>(context);

    deleteItem() {
      filters.removeFilterItem(type);
      schools.getSchools(filters: filters.state);
    }

    return Material(
      child: InkWell(
        onTap: deleteItem,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(5),
          ),
          padding: const EdgeInsets.all(5),
          child: Row(
            children: [
              Text(
                label.isEmpty ? value : '$label : $value',
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 11,
                ),
              ),
              const SizedBox(width: 5),
              const Icon(
                Icons.close,
                size: 12,
                color: Colors.red,
              )
            ],
          ),
        ),
      ),
    );
  }
}
