import 'package:flutter/widgets.dart';
import 'widget_label_pill.dart';

class FilterRow extends StatefulWidget {
  final ValueChanged<String?> onFilterChanged;
  final Map<String, int> labels;

  const FilterRow(
      {super.key, required this.labels, required this.onFilterChanged});

  @override
  State<FilterRow> createState() => _FilterRowState();
}

class _FilterRowState extends State<FilterRow> {
  String? _selectedLabel;

  void _selectLabel(String label) {
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
        children: widget.labels.keys
            .map(
              (label) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: LabelPill(
                  label: label,
                  count: widget.labels[label],
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
