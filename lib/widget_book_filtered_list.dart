import 'package:flutter/material.dart';

import 'book.dart';
import 'widget_book_list.dart';
import 'widget_filter_row.dart';

class BookFilteredList extends StatefulWidget {
  final List<Book> books;

  const BookFilteredList({
    super.key,
    required this.books,
  });

  @override
  State<BookFilteredList> createState() => _BookFilteredListState();
}

class _BookFilteredListState extends State<BookFilteredList> {
  String? _selectedLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FilterRow(
          labels: countLabels(widget.books),
          onFilterChanged: (label) {
            setState(() {
              _selectedLabel = label;
            });
          },
        ),
        Expanded(
          child: BookList(
            books: widget.books,
            selectedLabel: _selectedLabel,
          ),
        ),
      ],
    );
  }
}
