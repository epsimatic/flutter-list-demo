class Book {
  final String title;
  final List<String> labels;
  final int price;
  final int sizeBytes;

  Book(
      {required this.title,
      this.labels = const [],
      this.price = 0,
      required this.sizeBytes});
}

/// Returns a map where the keys are the label strings and the value is the count.
Map<String, int> countLabels(List<Book> books) {
  Map<String, int> labelCount = {};
  for (var book in books) {
    for (var label in book.labels) {
      String labelString = label.toString();
      labelCount.update(labelString, (value) => value + 1, ifAbsent: () => 1);
    }
  }
  return labelCount;
}
