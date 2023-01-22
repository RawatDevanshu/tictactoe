import 'package:flutter/material.dart';
import 'package:tictactoe/views/offline1v1.dart';
import 'package:tictactoe/views/menu.dart';
import 'package:tictactoe/views/comp.dart';

const String mainMenu = 'mainMenu';
const String offline1v1 = 'offline1v1';
const String comp = 'comp';
const String rooms = 'online_rooms';

Route<dynamic> controller(RouteSettings settings) {
  switch (settings.name) {
    case mainMenu:
      return MaterialPageRoute(builder: (context) => const MainMenu());
    case offline1v1:
      return MaterialPageRoute(builder: (context) => const Offline1v1());
    case comp:
      return MaterialPageRoute(
        builder: (context) => const Comp(),
      );
    default:
      throw ("This route doesnt exist");
  }
}
