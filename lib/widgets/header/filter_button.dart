import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/school_filters/filters_cubit.dart';
import 'package:yaschools/utils/enums.dart';

class FilterButton extends StatelessWidget {
  final dynamic label;
  final LookupType type;

  const FilterButton({
    super.key,
    required this.label,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    deleteItem() {
      print(type);
      BlocProvider.of<FiltersCubit>(context).removeFilterItem(type);
    }

    var text = label;
    if (type == LookupType.hasDiscount) {
      text = 'يشمل إمكانية التقسيط';
    }
    if (type == LookupType.hasInstallment) {
      text = 'يشمل الرسوم على دفعات';
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
                text,
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
