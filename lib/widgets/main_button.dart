import 'package:flutter/material.dart';
import 'package:yaschools/theme/palette.dart';

class MainButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressed;

  const MainButton({
    super.key,
    required this.label,
    this.icon,
    this.padding,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        color: Palette.secondary,
        padding: padding ?? const EdgeInsets.symmetric(vertical: 5),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (icon != null) Icon(icon, size: 17),
              const SizedBox(width: 5),
              Text(
                label,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ]),
      ),
    );
  }
}
