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
              children: [Text(book.title)],
            ),
          ),
        ),
      ],
    );
  }
}
