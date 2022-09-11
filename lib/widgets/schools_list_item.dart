import 'package:flutter/material.dart';
import 'package:yaschools/utils/assets.dart';
import 'package:yaschools/widgets/main_button.dart';
import 'package:yaschools/widgets/rating_stars.dart';

class SchoolsListItem extends StatelessWidget {
  const SchoolsListItem({super.key});

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
                    const Placeholder(fallbackHeight: 8, fallbackWidth: 16),
                    const SizedBox(width: 5),
                    Text("اهلى", style: Theme.of(context).textTheme.headline4),
                  ],
                ),
                const RatingStars()
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
            child: Row(
              children: [
                const Icon(Icons.people, color: Colors.grey, size: 16),
                const SizedBox(width: 5),
                Text("بنين", style: Theme.of(context).textTheme.headline4),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Image.network(AppAssets.schoolLogo),
                  ),
                  Text(
                    'قمم الحياة العالمية',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  Text(
                    'العزيزية - الرياض',
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
                  "الرسوم تبدأ من 12 ر.س",
                  style: Theme.of(context).textTheme.headline5,
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
