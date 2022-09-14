import 'package:flutter/material.dart';

class FilterHorizontalItem extends StatelessWidget {
  final String label;
  final bool isActive;
  final void Function()? onPress;

  const FilterHorizontalItem({
    Key? key,
    required this.label,
    required this.isActive,
    this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: isActive ? Theme.of(context).primaryColor : Colors.white,
            border: Border.all(
              color: isActive ? Colors.transparent : Colors.grey,
              width: 1.2,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(
            label,
            style: TextStyle(color: isActive ? Colors.white : Colors.black),
          )),
    );
  }
}
