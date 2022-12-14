import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/school_filters/filters_cubit.dart';
import 'package:yaschools/cubits/schools_lookups/lookups_cubit.dart';
import 'package:yaschools/models/filter_model.dart';
import 'package:yaschools/utils/enums.dart';
import 'package:yaschools/widgets/filters/location_item.dart';
import 'package:yaschools/widgets/filters/location_preview.dart';

class LocationSection extends StatefulWidget {
  const LocationSection({Key? key}) : super(key: key);

  @override
  State<LocationSection> createState() => _LocationSectionState();
}

class _LocationSectionState extends State<LocationSection> {
  var _isCityPreview = false;
  var _isDistPreview = false;

  @override
  Widget build(BuildContext context) {
    final filters = BlocProvider.of<FiltersCubit>(context);
    final lookups = BlocProvider.of<LookupsCubit>(context);

    togglePreview(LookupType type) async {
      final selCity = filters.state[LookupType.city];

      setState(() {
        if (type == LookupType.district) {
          _isDistPreview = !_isDistPreview;
          _isCityPreview = false;
        } else {
          _isCityPreview = !_isCityPreview;
          _isDistPreview = false;
        }
      });
    }

    return BlocConsumer<FiltersCubit, Map<LookupType, FilterModel>>(
      builder: (_, state) {
        final city = filters.state[LookupType.city];
        final district = filters.state[LookupType.district];

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
                      value: city != null ? city.valAr : 'كل المدن',
                      onTogglePreview: () => togglePreview(LookupType.city),
                    ),
                    const VerticalDivider(thickness: 1.3),
                    LocationItem(
                      titleText: 'الحى',
                      titleIcon: Icons.person_pin_circle,
                      value: district != null ? district.valAr : 'كل الأحياء',
                      onTogglePreview: () => togglePreview(LookupType.district),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            if (_isCityPreview)
              LocationPreview(
                type: LookupType.city,
                onClose: () => setState(() => _isCityPreview = false),
              ),
            if (_isDistPreview)
              LocationPreview(
                type: LookupType.district,
                onClose: () => setState(() => _isDistPreview = false),
              ),
          ],
        );
      },
      listener: (_, state) => {},
    );
  }
}
