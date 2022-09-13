import 'package:flutter/material.dart';

class FilterDropdownSection extends StatefulWidget {
  final String title;

  const FilterDropdownSection({super.key, required this.title});

  @override
  State<FilterDropdownSection> createState() => _FilterDropdownSectionState();
}

class _FilterDropdownSectionState extends State<FilterDropdownSection> {
  var _value = '1';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title),
              DropdownButton(
                isExpanded: true,
                hint: Text(widget.title),
                value: _value,
                items: const [
                  DropdownMenuItem(value: '1', child: Text('1')),
                  DropdownMenuItem(value: '2', child: Text('2')),
                  DropdownMenuItem(value: '3', child: Text('3')),
                ],
                onChanged: (val) => setState(() => _value = val!),
              )
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
