// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:miku_datchi/functions/DataController.dart';
import 'package:miku_datchi/screens/lobby.dart';

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
          builder: (context) => StatusScreen(),
        );

      default:
        return MaterialPageRoute(builder: (context) => Lobby());
    }
  }
}
