import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/school_filters/filters_cubit.dart';
import 'package:yaschools/utils/enums.dart';
import 'package:yaschools/models/lookup_model.dart';

class FilterHorizontalSection extends StatelessWidget {
  final String title;
  final List<LookupModel> list;
  final LookupType type;

  const FilterHorizontalSection({
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
                    itemBuilder: (_, index) => InkWell(
                      onTap: () => filters.setSelFilters(
                        type,
                        list[index].name,
                        isRemovable: true,
                      ),
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: filters.state[type] == list[index].name
                                ? Theme.of(context).primaryColor
                                : Colors.white,
                            border: Border.all(
                              color: filters.state[type] == list[index].name
                                  ? Colors.transparent
                                  : Colors.grey,
                              width: 1.2,
                            ),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            list[index].name,
                            style: TextStyle(
                              color: filters.state[type] == list[index].name
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          )),
                    ),
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
