import 'package:flutter/widgets.dart';

class Label {
  static const free = 'free';
  static const paid = 'paid';
  static const available = 'available';
  static const ondevice = 'ondevice';
  static const broken = 'broken';

  static double getHue(String label) {
    switch (label) {
      case Label.free:
        return 120; // Green
      case Label.paid:
        return 30; // Orange
      case Label.broken:
        return 0; // Red
      default:
        return (label.hashCode % 360).toDouble();
    }
  }

  static Color backgroundColor(String label) {
    return HSLColor.fromAHSL(0.6, getHue(label), 0.8, 0.9).toColor();
  }

  static Color textColor(String label) {
    return HSLColor.fromAHSL(0.8, getHue(label), 0.8, 0.4).toColor();
  }
  
  static final Map<String, String> _titleMap = {
    available: 'Куплена',
    ondevice: 'Загружена',
    free: 'Free',
    paid: '100 ₽',
    broken: 'Требуется обновление',
  };

  static String displayTitle(String label) {
    return _titleMap[label] ?? label[0].toUpperCase() + label.substring(1);
  }
}
