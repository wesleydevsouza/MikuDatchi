// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:water_reminder/screens/lobby.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/lobby':
        return MaterialPageRoute(
          builder: (context) => Lobby(),
        );

      default:
        return MaterialPageRoute(builder: (context) => Lobby());
    }
  }
}
