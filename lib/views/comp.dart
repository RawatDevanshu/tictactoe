import 'package:flutter/material.dart';
import 'package:tictactoe/utils/gamematrix.dart';




class Comp extends StatefulWidget {
  const Comp({super.key});

  @override
  State<Comp> createState() => _CompState();
}

class _CompState extends State<Comp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 44, 51, 51),
      appBar: AppBar(
        title: const Text("Tic-Tac-Toe!!!"),
        backgroundColor: const Color.fromARGB(255, 44, 51, 51),
      ),
      body: null,
    );
  }
}
