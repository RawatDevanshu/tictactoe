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
      title: 'Tic-Tac-Toe!',
      theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 57, 91, 100))))),
      home: const MyHomePage(title: 'Tic-Tac-Toe!'),
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
      backgroundColor: const Color.fromARGB(255, 44, 51, 51),
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: const Color.fromARGB(255, 44, 51, 51),
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
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            turn == 0 ? "Player 1's turn(O)" : "Player 2's turn(X)",
            style: const TextStyle(color: Color.fromRGBO(255, 255, 255, 1)),
          ),
          Container(
              width: boardwidth,
              height: boardwidth,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 57, 91, 100),
                  borderRadius: BorderRadius.circular(16)),
              child: GridView.count(
                crossAxisCount: 3,
                padding: const EdgeInsets.all(16),
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                children: List.generate(9, (index) {
                  return Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 165, 201, 202),
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: IconButton(
                        iconSize: 100,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
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
              )),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  values = [2, 2, 2, 2, 2, 2, 2, 2, 2];
                  turn = 0;
                });
              },
              child: const Icon(Icons.replay)),
        ]);
  }
}
