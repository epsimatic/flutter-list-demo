import 'package:flutter/widgets.dart';

import 'label.dart';
import 'widget_label_pill.dart';

class FilterRow extends StatefulWidget {
  final ValueChanged<Label?> onFilterChanged;

  const FilterRow({super.key, required this.onFilterChanged});

  @override
  State<FilterRow> createState() => _FilterRowState();
}

class _FilterRowState extends State<FilterRow> {
  Label? _selectedLabel;

  void _selectLabel(Label label) {
    setState(() {
      if (_selectedLabel == label) {
        _selectedLabel = null;
        widget.onFilterChanged(null);
      } else {
        _selectedLabel = label;
        widget.onFilterChanged(label);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: Label.values
            .map(
              (label) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: LabelPill(
                  label: label,
                  isSelected: label == _selectedLabel,
                  onTap: () => _selectLabel(label),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
