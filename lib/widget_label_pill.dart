import 'package:flutter/material.dart';

import 'label.dart';

class LabelPill extends StatelessWidget {
  final Label label;
  final bool isSelected;
  final VoidCallback? onTap;

  const LabelPill({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: isSelected
                ? label.backgroundColor.withAlpha(255)
                : label.backgroundColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? label.textColor : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Text(
            label.displayTitle,
            style: TextStyle(
              color: label.textColor,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
