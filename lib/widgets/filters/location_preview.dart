import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/school_filters/filters_cubit.dart';
import 'package:yaschools/cubits/schools_lookups/lookups_cubit.dart';
import 'package:yaschools/models/filter_model.dart';
import 'package:yaschools/theme/palette.dart';
import 'package:yaschools/utils/enums.dart';

class LocationPreview extends StatelessWidget {
  final LookupType type;

  const LocationPreview(this.type, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final lookups = BlocProvider.of<LookupsCubit>(context);
    final filters = BlocProvider.of<FiltersCubit>(context);
    var list = lookups.districts;
    var filterKey = 'district_id';
    var typeAr = 'الحى';
    var isCity = type == LookupType.city;

    if (isCity) {
      list = lookups.cities;
      filterKey = 'city_id';
      typeAr = 'المدينة';
    }

    return BlocConsumer<FiltersCubit, Map<LookupType, FilterModel>>(
      builder: (_, state) => Container(
          color: Palette.scaffold,
          width: double.infinity,
          height: MediaQuery.of(context).size.height * .35,
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                isCity ? 'أختر المدينة' : 'أختر الحى',
                style: Theme.of(context).textTheme.headline4,
              ),
              const SizedBox(height: 8),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 0,
                  childAspectRatio: 4 / 1,
                  children: list
                      .map((e) => InkWell(
                            onTap: () => filters.setSelFilters(
                              type,
                              FilterModel(
                                filterKey: filterKey,
                                filterVal: e.id,
                                typeAr: typeAr,
                                valAr: e.name,
                              ),
                            ),
                            child: Text(
                              e.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: filters.state.containsKey(type) &&
                                        filters.state[type]!.valAr == e.name
                                    ? Theme.of(context).primaryColor
                                    : Colors.black,
                              ),
                            ),
                          ))
                      .toList(),
                ),
              )

              // Center(
              //   child: Text(
              //     'قم بإختيار المدينة أولاً ..',
              //     style: Theme.of(context).textTheme.headline4,
              //   ),
              // ),
            ],
          )),
      listener: (_, state) {},
    );
  }
}
