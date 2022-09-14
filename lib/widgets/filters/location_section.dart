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
  var _isPreview = false;
  var category = '';

  @override
  Widget build(BuildContext context) {
    final filters = BlocProvider.of<FiltersCubit>(context);
    final lookups = BlocProvider.of<LookupsCubit>(context);

    togglePreview(String cat) {
      category = cat;
      final selCity = filters.state[LookupType.city];

      if (cat == 'dist' && selCity != null) {
        final cityId = selCity.filterVal;
        lookups.getDistrictById(cityId);
      }

      setState(() => _isPreview = !_isPreview);
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
                      onTogglePreview: () => togglePreview('city'),
                    ),
                    const VerticalDivider(thickness: 1.3),
                    LocationItem(
                      titleText: 'الحى',
                      titleIcon: Icons.person_pin_circle,
                      value: district != null ? district.valAr : 'كل الأحياء',
                      onTogglePreview: () => togglePreview('dist'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            if (_isPreview && category == 'city')
              const LocationPreview(LookupType.city),
            if (_isPreview && category == 'dist')
              const LocationPreview(LookupType.district)
          ],
        );
      },
      listener: (_, state) => {},
    );
  }
}
