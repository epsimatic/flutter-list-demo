class Book {
  final String title;
  final List<String>? labels;

  Book({required this.title, this.labels});
}

/// Returns a map where the keys are the label strings and the value is the count.
Map<String, int> countLabels(List<Book> books) {
  Map<String, int> labelCount = {};
  for (var book in books) {
    for (var label in book.labels ?? []) {
      String labelString = label.toString();
      labelCount.update(labelString, (value) => value + 1, ifAbsent: () => 1);
    }
  }
  return labelCount;
}
