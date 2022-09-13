import 'package:flutter/material.dart';

class LocationItem extends StatelessWidget {
  final String titleText;
  final IconData titleIcon;
  final String value;
  final void Function()? onTogglePreview;

  const LocationItem({
    Key? key,
    required this.titleText,
    required this.titleIcon,
    required this.value,
    required this.onTogglePreview,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTogglePreview,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            titleIcon,
            size: 18,
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(titleText),
              Text(
                value,
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      color: Theme.of(context).primaryColor,
                    ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
