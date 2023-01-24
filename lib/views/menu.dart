import 'package:flutter/material.dart';
import 'package:tictactoe/routes/routes.dart' as route;

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});
  final val = 0;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 44, 51, 51),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                    onPressed: (() {
                      Navigator.pushNamed((context), route.offline1v1);
                    }),
                    child: const Text(
                      "1v1",
                      textScaleFactor: 5,
                    ),
                  ),
            ],
          ),
        ));
  }
}
