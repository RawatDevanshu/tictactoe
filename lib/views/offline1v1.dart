import 'package:flutter/material.dart';
import 'package:tictactoe/utils/gamematrix.dart';




class Offline1v1 extends StatefulWidget {
  const Offline1v1({super.key});

  @override
  State<Offline1v1> createState() => _Offline1v1State();
}

class _Offline1v1State extends State<Offline1v1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 44, 51, 51),
      appBar: AppBar(
        title: const Text("Offline 1v1"),
        backgroundColor: const Color.fromARGB(255, 44, 51, 51),
      ),
      body: const GameMatrix(),
    );
  }
}


