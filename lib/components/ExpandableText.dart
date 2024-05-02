import 'package:flutter/material.dart';

class ExpandableText extends StatelessWidget {
  const ExpandableText({
    super.key,
    required this.text,
    required this.isExpanded,
    this.maxLines = 2,
    this.onPressed,
  });

  final String text;
  final bool isExpanded;
  final int maxLines;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SingleChildScrollView(
        physics: !isExpanded ? const NeverScrollableScrollPhysics() : null,
        child: Text(
          text,
          maxLines: !isExpanded ? maxLines : null,
          overflow: !isExpanded ? TextOverflow.ellipsis : null,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
