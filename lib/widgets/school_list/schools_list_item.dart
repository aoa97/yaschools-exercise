import 'package:flutter/material.dart';
import 'package:yaschools/models/school_model.dart';
import 'package:yaschools/utils/assets.dart';
import 'package:yaschools/widgets/ui/main_button.dart';
import 'package:yaschools/widgets/ui/rating_stars.dart';

class SchoolsListItem extends StatelessWidget {
  final SchoolModel item;

  const SchoolsListItem(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.network(AppAssets.flagKSA, height: 8, width: 16),
                    const SizedBox(width: 5),
                    Text(
                      item.categoryTitle,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
                RatingStars(value: item.totalRating)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
            child: Row(
              children: [
                const Icon(Icons.people, color: Colors.grey, size: 16),
                const SizedBox(width: 5),
                Text(
                  item.genderTitle,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      item.logo,
                      errorBuilder: (_, __, ___) => Image.network(
                        AppAssets.schoolPlaceholder,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    '${item.districtName} - ${item.cityName}',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    "\$",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 11,
                    ),
                  ),
                ),
                Text(
                  "الرسوم تبدأ من ${item.minFee} ر.س",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          MainButton(
            label: "احجز الأن",
            icon: Icons.pan_tool_alt,
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
