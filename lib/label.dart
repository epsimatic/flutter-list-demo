import 'package:flutter/widgets.dart';

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
        return '100 ₽';
      case Label.broken:
        return 'Требуется обновление';
      default:
        return toString().split('.').last;
    }
  }
}
