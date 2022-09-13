import 'package:flutter/material.dart';
import 'package:yaschools/theme/palette.dart';
import 'package:yaschools/widgets/filters/reservation_item.dart';

class ReservationSection extends StatelessWidget {
  const ReservationSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: Palette.secondary,
                ),
          ),
          const SizedBox(height: 10),
          const ReservationIItem(
            title: 'تقـسيـط',
            subtitle: 'مدارس لديها إمكانية التقسيط على 12 شهر',
          ),
          const SizedBox(height: 10),
          const ReservationIItem(
            title: 'دفــعــات',
            subtitle: 'دفع الرسوم على 3 دفعات',
          ),
        ],
      ),
    );
  }
}
