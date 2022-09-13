import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/school_filters/filters_cubit.dart';
import 'package:yaschools/utils/enums.dart';

class ReservationIItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final LookupType type;

  const ReservationIItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final filters = BlocProvider.of<FiltersCubit>(context);

    return BlocConsumer<FiltersCubit, Map<LookupType, dynamic>>(
      builder: (_, state) => Container(
        margin: const EdgeInsets.only(bottom: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: Checkbox(
                value: state[type] ?? false,
                onChanged: (val) => filters.setSelFilters(type, val),
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
      ),
      listener: (_, state) {},
    );
  }
}
