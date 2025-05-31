import 'package:flutter/material.dart';

import 'book.dart';
import 'label.dart';
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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Filtered list sample', books: books),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.books});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

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
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
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
