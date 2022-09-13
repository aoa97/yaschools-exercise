import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yaschools/cubits/school_filters/filters_cubit.dart';
import 'package:yaschools/cubits/school_filters/filters_state.dart';
import 'package:yaschools/theme/palette.dart';
import 'package:yaschools/utils/enums.dart';
import 'package:yaschools/widgets/header/filter_button.dart';
import 'package:yaschools/widgets/filters/filters_modal.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final filters = BlocProvider.of<FiltersCubit>(context);

    showFilters() {
      showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        builder: (_) => SizedBox(
          width: double.infinity,
          height: size.height * .7,
          child: const Filters(),
        ),
      );
    }

    return BlocConsumer<FiltersCubit, Map<LookupType, dynamic>>(
      builder: (_, state) => Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    onPressed: showFilters,
                    icon: const Icon(Icons.filter_list),
                    label: const Text("تصفية المدارس"),
                    style: TextButton.styleFrom(
                      foregroundColor: Palette.black,
                      textStyle: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.autorenew, size: 14),
                    label: const Text("إعادة تهيئة البحث"),
                    style: TextButton.styleFrom(
                      foregroundColor: Palette.grey,
                      textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              if (filters.state.isNotEmpty)
                SizedBox(
                  height: 30,
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (_, index) => FilterButton(
                      type: filters.state.keys.toList()[index],
                      label: filters.state.values.toList()[index],
                    ),
                    separatorBuilder: (_, index) => const SizedBox(width: 5),
                    itemCount: filters.state.length,
                  ),
                )
            ],
          ),
        ),
      ),
      listener: (_, state) {},
    );
  }
}
