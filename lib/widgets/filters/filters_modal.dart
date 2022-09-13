import 'package:flutter/material.dart';
import 'package:yaschools/widgets/filters/filter_dropdown_section.dart';
import 'package:yaschools/widgets/filters/filter_horizontal_section.dart';
import 'package:yaschools/widgets/filters/location_section.dart';
import 'package:yaschools/widgets/filters/reservation_section.dart';
import 'package:yaschools/widgets/ui/main_button.dart';
import 'package:yaschools/widgets/filters/filter_slider_section.dart';

class Filters extends StatelessWidget {
  const Filters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "تصفية البحث",
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      const SizedBox(height: 8),
                      const ReservationSection(),
                      const LocationSection(),
                      const Divider(),
                      const FilterDropdownSection(title: "المنهح"),
                      const FilterHorizontalSection(title: "المرحلة الدراسية"),
                      const FilterHorizontalSection(title: "الطلاب"),
                      const FilterSliderSection(title: "الرسوم الدراسية"),
                      const FilterHorizontalSection(title: "نوع المدرسة"),
                    ],
                  ),
                ),
              ),
              MainButton(
                label: "تصفية النتائج",
                padding: const EdgeInsets.symmetric(vertical: 10),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
