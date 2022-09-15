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
    final size = MediaQuery.of(context).size;

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
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      item.logo,
                      height: size.height * .12,
                      width: size.height * .12,
                      errorBuilder: (_, __, ___) => Image.network(
                        AppAssets.schoolPlaceholder,
                        height: size.height * .12,
                        width: size.height * .12,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Text(
                        item.name,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    Text(
                      '${item.districtName} - ${item.cityName}',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
                const SizedBox(width: 5),
                Text(
                  "الرسوم تبدأ من ${item.minFee} ر.س",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
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
