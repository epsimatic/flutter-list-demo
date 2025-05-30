import 'package:flutter/material.dart';

import 'list_item.dart';

void main() {
  final List<Item> items = [
    Item(title: 'The Great Gatsby', labels: [Label.free]),
    Item(title: 'To Kill a Mockingbird', labels: [Label.paid]),
    Item(title: '1984', labels: [Label.paid]),
    Item(title: 'Pride and Prejudice', labels: [Label.free]),
    Item(title: 'The Catcher in the Rye', labels: [Label.paid]),
    Item(title: 'Animal Farm', labels: [Label.free]),
    Item(title: 'Lord of the Flies', labels: [Label.paid]),
    Item(title: 'Brave New World', labels: [Label.free]),
    Item(title: 'The Hobbit', labels: [Label.paid]),
    Item(title: 'Fahrenheit 451', labels: [Label.free]),
    Item(title: 'Moby Dick', labels: [Label.paid, Label.available]),
    Item(title: 'War and Peace', labels: [Label.paid, Label.available]),
    Item(title: 'The Odyssey', labels: [Label.paid, Label.available]),
    Item(title: 'Crime and Punishment', labels: [Label.paid, Label.available]),
    Item(title: 'The Iliad', labels: [Label.paid, Label.available]),
    Item(title: 'The Brothers Karamazov', labels: [Label.paid, Label.ondevice]),
    Item(title: 'Ulysses', labels: [Label.free, Label.ondevice]),
    Item(title: 'In Search of Lost Time', labels: [Label.free, Label.ondevice]),
    Item(title: 'The Divine Comedy', labels: [Label.paid, Label.broken]),
    Item(title: 'Don Quixote', labels: [Label.paid, Label.broken]),
  ];

  runApp(MyApp(items: items));
}

class MyApp extends StatelessWidget {
  final List<Item> items;
  const MyApp({super.key, required this.items});

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
      home: MyHomePage(title: 'Filtered list demo', items: items),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.items});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final List<Item> items;

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
      body: ItemFilteredList(items: widget.items),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
