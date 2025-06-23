import 'package:flutter/material.dart';

import 'book.dart';
import 'label_utils.dart';
import 'widget_book_filtered_list.dart';

void main() {
  final List<Book> books = [
    Book(title: 'Туманность Андромеды', labels: [Label.free]),
    Book(title: 'Пикник на обочине', labels: [Label.paid]),
    Book(title: 'Обитаемый остров', labels: [Label.paid]),
    Book(title: 'Трудно быть богом', labels: [Label.free]),
    Book(title: 'Понедельник начинается в субботу', labels: [Label.paid]),
    Book(title: 'Страна багровых туч', labels: [Label.free]),
    Book(title: 'Полдень, XXII век', labels: [Label.paid]),
    Book(title: 'Малыш', labels: [Label.free]),
    Book(title: 'Жук в муравейнике', labels: [Label.paid, Label.available]),
    Book(title: 'Волны гасят ветер', labels: [Label.paid, Label.available]),
    Book(title: 'Час Быка', labels: [Label.paid, Label.available]),
    Book(title: 'Таис Афинская', labels: [Label.paid, Label.available]),
    Book(title: 'Лезвие бритвы', labels: [Label.paid, Label.available]),
    Book(title: 'Хищные вещи века', labels: [Label.paid, Label.ondevice]),
    Book(title: 'Попытка к бегству', labels: [Label.free, Label.ondevice]),
    Book(title: 'Далёкая Радуга', labels: [Label.free, Label.ondevice]),
    Book(title: 'Отягощённые злом', labels: [Label.paid, Label.broken]),
    Book(title: 'Парень из преисподней', labels: [Label.paid, Label.broken]),
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
