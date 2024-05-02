import 'package:flutter/material.dart';

class StoryAddButton extends StatelessWidget {
  const StoryAddButton({
    super.key,
    this.onPressed,
    this.colors,
    this.size,
    this.iconSize,
  });

  final VoidCallback? onPressed;
  final List<Color>? colors;
  final double? size;
  final double? iconSize;

  List<Color> getColors() {
    return colors ??
        const [
          Colors.purple,
          Colors.red,
          Colors.pink,
          Colors.amber,
          Colors.purple,
        ];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size ?? 76,
        height: size ?? 76,
        padding: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: SweepGradient(colors: getColors()),
        ),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 4),
            borderRadius: BorderRadius.circular(29),
          ),
          child: Icon(
            Icons.add_rounded,
            color: Colors.white,
            size: iconSize ?? 32,
          ),
        ),
      ),
    );
  }
}
