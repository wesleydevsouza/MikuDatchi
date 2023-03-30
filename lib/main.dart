import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'commons/routes.dart';
import 'constants/styling.dart';

void main() {
  WidgetsFlutterBinding?.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const AdazzioApp());
}

class AdazzioApp extends StatelessWidget {
  const AdazzioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miku Datchi',
      theme: AppTheme.mikuTheme,
      initialRoute: '/lobby',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
