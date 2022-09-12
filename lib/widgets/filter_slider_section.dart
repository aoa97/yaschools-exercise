import 'package:flutter/material.dart';

class FilterSliderSection extends StatefulWidget {
  final String title;

  const FilterSliderSection({super.key, required this.title});

  @override
  State<FilterSliderSection> createState() => _FilterSliderSectionState();
}

class _FilterSliderSectionState extends State<FilterSliderSection> {
  RangeValues _currentRangeValues = const RangeValues(50, 80);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title),
              RangeSlider(
                min: 10,
                max: 90,
                values: _currentRangeValues,
                labels: RangeLabels(
                  _currentRangeValues.start.round().toString(),
                  _currentRangeValues.end.round().toString(),
                ),
                onChanged: (RangeValues values) {
                  setState(() {
                    _currentRangeValues = values;
                  });
                },
              ),
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
