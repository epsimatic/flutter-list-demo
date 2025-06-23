import 'package:flutter/material.dart';

import 'book.dart';
import 'label_utils.dart';
import 'widget_book_filtered_list.dart';

void main() {
  final List<Book> books = [
    Book(
        title: 'Туманность Андромеды',
        labels: [Label.free],
        price: 0,
        sizeBytes: 1200000),
    Book(
        title: 'Пикник на обочине',
        labels: [Label.paid],
        price: 200,
        sizeBytes: 3850000),
    Book(
        title: 'Обитаемый остров',
        labels: [Label.paid],
        price: 300,
        sizeBytes: 2300000),
    Book(
        title: 'Трудно быть богом',
        labels: [Label.free],
        price: 0,
        sizeBytes: 1100000),
    Book(
        title: 'Понедельник начинается в субботу',
        labels: [Label.paid],
        price: 249,
        sizeBytes: 950000),
    Book(
        title: 'Страна багровых туч',
        labels: [Label.free],
        price: 0,
        sizeBytes: 1350000),
    Book(
        title: 'Полдень, XXII век',
        labels: [Label.paid],
        price: 180,
        sizeBytes: 1800000),
    Book(title: 'Малыш', labels: [Label.free], price: 0, sizeBytes: 750000),
    Book(
        title: 'Жук в муравейнике',
        labels: [Label.paid, Label.available],
        price: 350,
        sizeBytes: 1800000),
    Book(
        title: 'Волны гасят ветер',
        labels: [Label.paid, Label.available],
        price: 350,
        sizeBytes: 2100000),
    Book(
        title: 'Час Быка',
        labels: [Label.paid, Label.available],
        price: 400,
        sizeBytes: 2750000),
    Book(
        title: 'Таис Афинская',
        labels: [Label.paid, Label.available],
        price: 450,
        sizeBytes: 3200000),
    Book(
        title: 'Лезвие бритвы',
        labels: [Label.paid, Label.available],
        price: 300,
        sizeBytes: 1900000),
    Book(
        title: 'Хищные вещи века',
        labels: [Label.paid, Label.ondevice],
        price: 200,
        sizeBytes: 890000),
    Book(
        title: 'Попытка к бегству',
        labels: [Label.free, Label.ondevice],
        price: 0,
        sizeBytes: 1150000),
    Book(
        title: 'Далёкая Радуга',
        labels: [Label.free, Label.ondevice],
        price: 0,
        sizeBytes: 780000),
    Book(
        title: 'Отягощённые злом',
        labels: [Label.paid, Label.broken],
        price: 200,
        sizeBytes: 1250000),
    Book(
        title: 'Парень из преисподней',
        labels: [Label.paid, Label.broken],
        price: 200,
        sizeBytes: 920000),
  ];
  books.shuffle();

  runApp(MyApp(books: books));
}

class MyApp extends StatelessWidget {
  final List<Book> books;
  const MyApp({super.key, required this.books});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Filtered list sample', books: books),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.books});
  final String title;
  final List<Book> books;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BookFilteredList(books: widget.books),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
