import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/school_filters/filters_cubit.dart';
import 'package:yaschools/models/filter_model.dart';
import 'package:yaschools/utils/enums.dart';

class ReservationIItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final LookupType type;
  final String filterKey;

  const ReservationIItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.type,
    required this.filterKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filters = BlocProvider.of<FiltersCubit>(context);

    setFilter(bool value) {
      filters.setSelFilters(
        type,
        FilterModel(
          filterKey: filterKey,
          filterVal: value,
          typeAr: '',
          valAr: subtitle,
        ),
      );
    }

    return BlocConsumer<FiltersCubit, Map<LookupType, FilterModel>>(
      builder: (_, state) {
        final exist = filters.state[type];

        return Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 24,
                height: 24,
                child: Checkbox(
                  value: exist != null ? exist.filterVal : false,
                  onChanged: (val) => setFilter(val!),
                ),
              ),
              const SizedBox(width: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline2!.copyWith(
                          color: Theme.of(context).primaryColor,
                        ),
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.caption!,
                  )
                ],
              ),
            ],
          ),
        );
      },
      listener: (_, state) {},
    );
  }
}
