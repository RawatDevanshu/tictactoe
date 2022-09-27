import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tic-Tack-Toe!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Tic-Tack-Toe!'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const IconGrid(),
    );
  }
}

class IconGrid extends StatefulWidget {
  const IconGrid({super.key});

  @override
  State<IconGrid> createState() => _IconGridState();
}

class _IconGridState extends State<IconGrid> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const <Widget>[
        TicToeCol(),TicToeCol(),TicToeCol()
      ],
    );
  }
}



class TicToeCol extends StatefulWidget {
  const TicToeCol({super.key});

  @override
  State<TicToeCol> createState() => _TicToeColState();
}

class _TicToeColState extends State<TicToeCol> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const <Widget>[TicToes(), TicToes(), TicToes()],
    );
  }
}



class TicToes extends StatefulWidget {
  const TicToes({super.key});

  @override
  State<TicToes> createState() => _TicToesState();
}

class _TicToesState extends State<TicToes> {
  bool toggle = true;
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          setState(() {
            toggle = !toggle;
          });
        },
        icon: toggle
            ? const Icon(Icons.circle_outlined)
            : const Icon(Icons.close));
  }
}

