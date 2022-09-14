import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/school_filters/filters_cubit.dart';
import 'package:yaschools/models/filter_model.dart';
import 'package:yaschools/utils/enums.dart';
import 'package:yaschools/models/lookup_model.dart';
import 'package:yaschools/widgets/filters/filter_horizontal_item.dart';

class FilterHorizontalSection extends StatelessWidget {
  final String title;
  final List<LookupModel> list;
  final LookupType type;
  final String filterKey;

  const FilterHorizontalSection({
    super.key,
    required this.title,
    required this.list,
    required this.type,
    required this.filterKey,
  });

  @override
  Widget build(BuildContext context) {
    final filters = BlocProvider.of<FiltersCubit>(context);

    setFilter(LookupModel item) {
      filters.setSelFilters(
        type,
        FilterModel(
          filterKey: filterKey,
          filterVal: item.id,
          typeAr: title,
          valAr: item.name,
          isRemovable: true,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocConsumer<FiltersCubit, Map<LookupType, dynamic>>(
          builder: (_, state) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                const SizedBox(height: 5),
                SizedBox(
                  height: 35,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) {
                      final item = list[index];
                      final exist = filters.state[type];

                      return FilterHorizontalItem(
                        isActive: exist != null && item.name == exist.valAr,
                        label: item.name,
                        onPress: () => setFilter(item),
                      );
                    },
                    separatorBuilder: (_, index) => const SizedBox(width: 5),
                    itemCount: list.length,
                  ),
                )
              ],
            ),
          ),
          listener: (_, state) => {},
        ),
        const Divider()
      ],
    );
  }
}
