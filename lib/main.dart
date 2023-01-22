import 'package:flutter/material.dart';
import 'package:tictactoe/routes/routes.dart' as route;


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
      onGenerateRoute: route.controller,
      initialRoute: route.mainMenu,
    );
  }
}
