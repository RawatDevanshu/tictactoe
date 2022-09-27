import 'package:flutter/material.dart';

List<int> values = [2, 2, 2, 2, 2, 2, 2, 2, 2];

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
      backgroundColor: Colors.cyan,
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
  int turn = 0;
  @override
  Widget build(BuildContext context) {
    double boardwidth = MediaQuery.of(context).size.width;
    return Container(
        width: boardwidth,
        height: boardwidth,
        color: Colors.cyanAccent,
        child: GridView.count(
          crossAxisCount: 3,
          padding: const EdgeInsets.all(16),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          children: List.generate(9, (index) {
            return Container(
              width: 100,
              height: 100,
              decoration: const BoxDecoration(color: Colors.blueGrey),
              child: Center(
                child: IconButton(
                  icon: values[index] == 2
                      ? const Icon(Icons.minimize)
                      : values[index] == 0
                          ? const Icon(Icons.circle_outlined)
                          : const Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      if (values[index] == 2) {
                        values[index] = turn;
                        if (turn == 1) {
                          turn = 0;
                        } else {
                          turn = 1;
                        }
                      }
                    });
                  },
                ),
              ),
            );
          }),
        ));
  }
}
