import 'package:flutter/material.dart';
import 'package:yaschools/theme/palette.dart';
import 'package:yaschools/widgets/filter_button.dart';
import 'package:yaschools/widgets/filters.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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

    return Container(
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
            SizedBox(
              height: 30,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) =>
                    const FilterButton(label: "المدينة: الرياض"),
                separatorBuilder: (_, index) => const SizedBox(width: 5),
                itemCount: 10,
              ),
            )
          ],
        ),
      ),
    );
  }
}
