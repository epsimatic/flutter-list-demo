import 'package:flutter/material.dart';

enum Label {
  free,
  paid,
  available,
  ondevice,
  broken,
}

extension LabelExtension on Label {
  double get hue {
    switch (this) {
      case Label.free:
        return 120; // Green
      case Label.paid:
        return 30; // Orange
      case Label.broken:
        return 0; // Red
      default:
        return (toString().split('.').last.hashCode % 360).toDouble();
    }
  }

  Color get backgroundColor {
    return HSLColor.fromAHSL(0.6, hue, 0.8, 0.9).toColor();
  }

  Color get textColor {
    return HSLColor.fromAHSL(0.8, hue, 0.8, 0.4).toColor();
  }

  String get displayTitle {
    switch (this) {
      case Label.available:
        return 'Куплена';
      case Label.ondevice:
        return 'Загружена';
      case Label.free:
        return 'Free';
      case Label.paid:
        return 'Pro';
      case Label.broken:
        return 'Требуется обновление';
      default:
        return toString().split('.').last;
    }
  }
}

class Item {
  final String title;
  final List<Label>? labels;

  Item({required this.title, this.labels});
}

class LabelPill extends StatelessWidget {
  final Label label;
  final bool isSelected;
  final VoidCallback? onTap;

  const LabelPill({
    Key? key,
    required this.label,
    this.isSelected = false,
    this.onTap,
  }) : super(key: key);

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

class ItemFilter extends StatefulWidget {
  final ValueChanged<Label?> onFilterChanged;

  const ItemFilter({Key? key, required this.onFilterChanged}) : super(key: key);

  @override
  State<ItemFilter> createState() => _ItemFilterState();
}

class _ItemFilterState extends State<ItemFilter> {
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

class ItemList extends StatelessWidget {
  final List<Item> items;
  final Label? selectedLabel;

  const ItemList({
    Key? key,
    required this.items,
    this.selectedLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // If a label is selected, we filter items that contain that label.
    // If no label is selected, we show all items.
    final displayedItems = selectedLabel == null
        ? items
        : items
            .where((item) =>
                item.labels?.contains(selectedLabel) ?? false)
            .toList();

    return ListView.builder(
      itemCount: displayedItems.length,
      itemBuilder: (context, index) {
        final item = displayedItems[index];
        return ListTile(
          title: Text(item.title),
          trailing: item.labels != null
              ? Wrap(
                  spacing: 4,
                  children: item.labels!
                      .map((label) => LabelPill(label: label))
                      .toList(),
                )
              : null,
        );
      },
    );
  }
}

class ItemFilteredList extends StatefulWidget {
  final List<Item> items;

  const ItemFilteredList({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<ItemFilteredList> createState() => _ItemFilteredListState();
}

class _ItemFilteredListState extends State<ItemFilteredList> {
  Label? _selectedLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ItemFilter(
          onFilterChanged: (label) {
            setState(() {
              _selectedLabel = label;
            });
          },
        ),
        Expanded(
          child: ItemList(
            items: widget.items,
            selectedLabel: _selectedLabel,
          ),
        ),
      ],
    );
  }
}
