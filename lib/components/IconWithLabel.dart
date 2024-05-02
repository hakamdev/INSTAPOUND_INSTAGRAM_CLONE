import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IconWithLabel extends StatelessWidget {
  const IconWithLabel({
    super.key,
    required this.label,
    required this.icon,
    this.color,
    this.labelColor,
  });

  final String label;
  final IconData icon;
  final Color? color;
  final Color? labelColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: color),
        const SizedBox(width: 4),
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.w500, color: labelColor),
        )
      ],
    );
  }
}
