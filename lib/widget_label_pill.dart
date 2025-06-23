import 'package:flutter/material.dart';

import 'label_utils.dart';

class LabelPill extends StatelessWidget {
  final String label;
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
                ? Label.backgroundColor(label).withAlpha(255)
                : Label.backgroundColor(label),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? Label.textColor(label) : Colors.transparent,
              width: 1.5,
            ),
          ),
          child: Text(
            Label.displayTitle(label),
            style: TextStyle(
              color: Label.textColor(label),
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }
}
