import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/school_filters/filters_cubit.dart';
import 'package:yaschools/models/filter_model.dart';
import 'package:yaschools/utils/enums.dart';

class FilterSliderSection extends StatefulWidget {
  final String title;

  const FilterSliderSection({super.key, required this.title});

  @override
  State<FilterSliderSection> createState() => _FilterSliderSectionState();
}

class _FilterSliderSectionState extends State<FilterSliderSection> {
  RangeValues values = const RangeValues(5000, 50000);
  RangeLabels labels = const RangeLabels('5000', "50000");

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final filters = BlocProvider.of<FiltersCubit>(context);
      final min = filters.state[LookupType.min];
      final max = filters.state[LookupType.max];

      if (min != null && max != null) {
        final minVal = min.filterVal;
        final maxVal = max.filterVal;
        values = RangeValues(minVal.toDouble(), maxVal.toDouble());
        labels = RangeLabels('$maxVal', '$maxVal');
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final filters = BlocProvider.of<FiltersCubit>(context);

    handleChange(RangeValues value) {
      final min = value.start.toInt();
      final max = value.end.toInt();

      setState(() {
        values = value;
        labels = RangeLabels('$min', '$max');
      });

      filters.setSelFilters(
        LookupType.max,
        FilterModel(
          filterKey: 'max',
          filterVal: max,
          typeAr: 'السعر إلى',
          valAr: '$max',
        ),
      );
      filters.setSelFilters(
        LookupType.min,
        FilterModel(
          filterKey: 'min',
          filterVal: min,
          typeAr: 'السعر من',
          valAr: '$min',
        ),
      );
    }

    return BlocConsumer<FiltersCubit, Map<LookupType, FilterModel>>(
      builder: (_, state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.title),
                RangeSlider(
                  min: 5000,
                  max: 50000,
                  values: values,
                  labels: labels,
                  onChanged: handleChange,
                ),
              ],
            ),
          ),
          const Divider()
        ],
      ),
      listener: (_, state) => {},
    );
  }
}
