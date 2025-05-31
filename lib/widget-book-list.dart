import 'package:flutter/material.dart';

import 'book.dart';
import 'label.dart';
import 'widget-label-pill.dart';

class BookList extends StatefulWidget {
  final List<Book> books;
  final Label? selectedLabel;

  const BookList({
    Key? key,
    required this.books,
    this.selectedLabel,
  }) : super(key: key);

  @override
  State<BookList> createState() => _BookListState();
}

class _BookListState extends State<BookList> {
  // We'll use a GlobalKey for the AnimatedList to allow for animated insertions/removals.
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late List<Book> _displayedBooks;
  @override
  void initState() {
    super.initState();
    _displayedBooks = _computeDisplayedBooks();
  }

  @override
  void didUpdateWidget(BookList oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldBooks = oldWidget.books;
    final newBooks = widget.books;
    final oldSelectedLabel = oldWidget.selectedLabel;
    final newSelectedLabel = widget.selectedLabel;

    // We only need to animate if the filter label changed or the entire item list changed.
    if (oldSelectedLabel != newSelectedLabel || oldBooks != newBooks) {
      final previousDisplayedBooks = _displayedBooks;
      final newDisplayedBooks = _computeDisplayedBooks();

      // Compute which Books are added and which are removed.
      final addedBooks = newDisplayedBooks
          .where((item) => !previousDisplayedBooks.contains(item))
          .toList();
      final removedBooks = previousDisplayedBooks
          .where((item) => !newDisplayedBooks.contains(item))
          .toList();

      // First, remove the Books that are no longer in the list.
      for (final removedItem in removedBooks) {
        final index = previousDisplayedBooks.indexOf(removedItem);
        // It's possible the item might have been removed already by a previous operation?
        // But we are iterating over the list at the time of the change.
        if (index != -1) {
          final item = previousDisplayedBooks.removeAt(index);
          _listKey.currentState?.removeItem(index, (context, animation) {
            return _buildRemovedItem(item, animation);
          });
        }
      }

      // Then, add the new Books at their correct positions in the new list.
      for (final addedItem in addedBooks) {
        final index = newDisplayedBooks.indexOf(addedItem);
        if (index != -1) {
          _displayedBooks.insert(index, addedItem);
          _listKey.currentState?.insertItem(index);
        }
      }
    }
  }

  List<Book> _computeDisplayedBooks() {
    return widget.selectedLabel == null
        ? List.from(widget.books)
        : widget.books
            .where(
                (item) => item.labels?.contains(widget.selectedLabel) ?? false)
            .toList();
  }

  Widget _buildRemovedItem(Book book, Animation<double> animation) {
    // Build a ListTile that will animate out.
    return FadeTransition(
      opacity: CurvedAnimation(
        parent: animation,
        curve: Curves.easeOut,
      ),
      child: SizeTransition(
        sizeFactor: animation,
        child: _buildItem(book),
      ),
    );
  }

  Widget _buildItem(Book book) {
    return ListTile(
      key: ValueKey(book.title),
      title: Text(book.title),
      trailing: book.labels != null
          ? Wrap(
              spacing: 4,
              children:
                  book.labels!.map((label) => LabelPill(label: label)).toList(),
            )
          : null,
    );
  }

  @override
  Widget build(BuildContext context) {
    // We are using an AnimatedList to handle the insertions and removals with animation.
    return AnimatedList(
      key: _listKey,
      initialItemCount: _displayedBooks.length,
      itemBuilder: (context, index, animation) {
        final item = _displayedBooks[index];
        return FadeTransition(
          opacity: animation.drive(CurveTween(curve: Curves.easeIn)),
          child: _buildItem(item),
        );
      },
    );
  }
}
