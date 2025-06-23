import 'package:flutter/material.dart';

import 'label_utils.dart';

class LabelPill extends StatelessWidget {
  final String label;
  final int? count;
  final bool isSelected;
  final VoidCallback? onTap;

  const LabelPill({
    super.key,
    required this.label,
    this.isSelected = false,
    this.count,
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Label.displayTitle(label),
                style: TextStyle(
                  color: Label.textColor(label),
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              if (count != null)
                FilterCount(count: count!, color: Label.textColor(label)),
            ],
          ),
        ),
      ),
    );
  }
}

class FilterCount extends StatelessWidget {
  final int count;
  final Color color;
  const FilterCount({
    super.key,
    required this.count,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Container(
        padding: const EdgeInsets.fromLTRB(4, 0, 4, 1),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          count.toString(),
          style: TextStyle(
            color: Theme.of(context).canvasColor.withAlpha(200),
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
