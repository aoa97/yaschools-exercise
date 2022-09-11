import 'package:flutter/material.dart';
import 'package:yaschools/widgets/schools_list_item.dart';

class SchoolsList extends StatelessWidget {
  const SchoolsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 5.5,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (_, index) => const SchoolsListItem(),
        itemCount: 14,
      ),
    );
  }
}
