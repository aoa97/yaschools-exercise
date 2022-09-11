import 'package:flutter/material.dart';

class RangeSliderlSection extends StatefulWidget {
  final String title;

  const RangeSliderlSection({super.key, required this.title});

  @override
  State<RangeSliderlSection> createState() => _RangeSliderlSectionState();
}

class _RangeSliderlSectionState extends State<RangeSliderlSection> {
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
