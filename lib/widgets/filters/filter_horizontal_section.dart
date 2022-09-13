import 'package:flutter/material.dart';

class FilterHorizontalSection extends StatelessWidget {
  final String title;

  const FilterHorizontalSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title),
              SizedBox(
                height: 25,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (_, index) => Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1.2),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: const Text('عنصر')),
                  separatorBuilder: (_, index) => const SizedBox(width: 5),
                  itemCount: 16,
                ),
              )
            ],
          ),
        ),
        const Divider()
      ],
    );
  }
}
