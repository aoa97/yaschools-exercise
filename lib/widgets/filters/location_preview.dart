import 'package:flutter/material.dart';
import 'package:yaschools/theme/palette.dart';

class LocationPreview extends StatelessWidget {
  const LocationPreview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Palette.scaffold,
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .35,
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'أختر الحى',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'قم بإختيار المدينة أولاً ..',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ));
  }
}
