import 'package:flutter/material.dart';
import 'package:yaschools/widgets/filters/location_item.dart';
import 'package:yaschools/widgets/filters/location_preview.dart';

class LocationSection extends StatefulWidget {
  const LocationSection({Key? key}) : super(key: key);

  @override
  State<LocationSection> createState() => _LocationSectionState();
}

class _LocationSectionState extends State<LocationSection> {
  var _isPreview = false;

  togglePreview() {
    setState(() => _isPreview = !_isPreview);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: IntrinsicHeight(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                LocationItem(
                  titleText: 'المدينة',
                  titleIcon: Icons.location_on_outlined,
                  value: "كل المدن",
                  onTogglePreview: togglePreview,
                ),
                const VerticalDivider(thickness: 1.3),
                LocationItem(
                  titleText: 'الحى',
                  titleIcon: Icons.person_pin_circle,
                  value: "كل الأحياء",
                  onTogglePreview: togglePreview,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 8),
        if (_isPreview) const LocationPreview()
      ],
    );
  }
}
