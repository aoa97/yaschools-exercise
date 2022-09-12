import 'package:flutter/material.dart';
import 'package:yaschools/theme/palette.dart';
import 'package:yaschools/widgets/filter_dropdown_section.dart';
import 'package:yaschools/widgets/filter_horizontal_section.dart';
import 'package:yaschools/widgets/main_button.dart';
import 'package:yaschools/widgets/filter_slider_section.dart';

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
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Palette.secondaryAccent,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'الحجوزات اونلاين',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2!
                                  .copyWith(
                                    color: Palette.secondary,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.location_on_outlined,
                                      size: 18),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("المدينة"),
                                      Text(
                                        "كل المدن",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              const VerticalDivider(thickness: 1.3),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(Icons.person_pin_circle, size: 18),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text("الحى"),
                                      Text(
                                        "كل الأحياء",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4!
                                            .copyWith(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
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
