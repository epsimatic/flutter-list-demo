import 'package:flutter/material.dart';

import 'book.dart';
import 'label_utils.dart';

class BookWidget extends StatelessWidget {
  final Book book;
  const BookWidget({
    super.key,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).hintColor;
    late final Icon bookIcon;
    if (book.labels.contains(Label.broken)) {
      bookIcon = Icon(Icons.broken_image, color: Label.textColor(Label.broken));
    } else if (book.labels.contains(Label.ondevice)) {
      bookIcon = Icon(Icons.offline_pin, color: iconColor);
    } else {
      bookIcon = const Icon(Icons.cloud_circle, color: Colors.transparent);
    }

    return Row(
      children: [
        bookIcon,
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Wrap(
              children: [
                Text(book.title),
                Container(width: 6),
                Specs(
                  price: book.price,
                  sizeBytes: book.sizeBytes,
                  isPurchased: book.labels.contains(Label.available),
                  isDownloaded: book.labels.contains(Label.ondevice),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Specs extends StatelessWidget {
  final int price;
  final int sizeBytes;
  final bool isPurchased;
  final bool isDownloaded;

  const Specs({
    super.key,
    required this.price,
    required this.sizeBytes,
    required this.isPurchased,
    required this.isDownloaded,
  });

  @override
  Widget build(BuildContext context) {
    String formatSize(int bytes) {
      return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} МБ';
    }

    String formatPrice(int price, bool isPurchased, bool isDownloaded) {
      if (isDownloaded) return 'Загружена';
      if (isPurchased) return 'Куплена';
      if (price == 0) return 'Бесплатно';
      return '$price ₽';
    }

    const double borderRadius = 6;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                bottomLeft: Radius.circular(borderRadius),
              ),
            ),
            child: Text(
              formatPrice(price, isPurchased, isDownloaded),
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontSize: 12),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(borderRadius),
                bottomRight: Radius.circular(borderRadius),
              ),
            ),
            child: Text(
              formatSize(sizeBytes),
              style: TextStyle(
                  color: Theme.of(context).colorScheme.onTertiaryContainer,
                  fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
