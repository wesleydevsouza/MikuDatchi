// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:water_reminder/screens/lobby.dart';

import '../screens/status.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/lobby':
        return MaterialPageRoute(
          builder: (context) => Lobby(),
        );

      case '/status':
        return MaterialPageRoute(
          builder: (context) =>
              StatusScreen(drink: 10, eat: 10, sing: 10, sleep: 10),
        );

      default:
        return MaterialPageRoute(builder: (context) => Lobby());
    }
  }
}
