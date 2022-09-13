import 'package:flutter/material.dart';

class ReservationIItem extends StatelessWidget {
  final String title;
  final String subtitle;

  const ReservationIItem({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 24,
            height: 24,
            child: Checkbox(
              value: true,
              onChanged: (val) {},
            ),
          ),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              ),
              Text(
                subtitle,
                style: Theme.of(context).textTheme.caption!,
              )
            ],
          ),
        ],
      ),
    );
  }
}
