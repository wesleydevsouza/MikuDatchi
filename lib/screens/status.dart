// ignore_for_file: prefer_const_constructors

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miku_datchi/components/HorizontalBar.dart';
import 'package:miku_datchi/constants/styling.dart';
import 'package:miku_datchi/functions/DataController.dart';
import 'package:miku_datchi/functions/functions.dart';
import 'package:timer_builder/timer_builder.dart';

class StatusScreen extends StatefulWidget {
  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.corScaffold,
      body: TimerBuilder.periodic(
        Duration(seconds: 1),
        builder: (context) {
          Functions func = Functions();
          int randomSeconds = func.getRandomSeconds();

          final restartableTimer = RestartableTimer(
            Duration(seconds: randomSeconds),
            () {
              print("Próxima atualização em $randomSeconds segundos");
              Future.delayed(
                  Duration(seconds: randomSeconds),
                  () => setState(() {
                        func.getRandomStatus();
                      }));
            },
          );
          restartableTimer.reset();

          return SafeArea(
            minimum: EdgeInsets.fromLTRB(10, 32, 10, 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  textDirection: TextDirection.ltr,
                  text: TextSpan(
                    style: GoogleFonts.righteous(
                        fontSize: 45, color: AppTheme.corLogo),
                    // ignore: prefer_const_literals_to_create_immutables
                    children: <TextSpan>[
                      TextSpan(text: 'Miku'),
                      TextSpan(
                          text: 'Status',
                          style: TextStyle(color: AppTheme.corLogo2)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 8, top: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Fome: ${DataController.dataController.food}',
                      style: GoogleFonts.roboto(
                          fontSize: 25,
                          color: AppTheme.bgfome,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                HorizontalBar(
                  value: DataController.dataController.food,
                  cor: AppTheme.fome,
                  corBG: AppTheme.bgfome,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 8, top: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Sede: ${DataController.dataController.drink}',
                      style: GoogleFonts.roboto(
                          fontSize: 25,
                          color: AppTheme.bgDrink,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                HorizontalBar(
                  value: DataController.dataController.drink,
                  cor: AppTheme.drink,
                  corBG: AppTheme.bgDrink,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8, bottom: 8, top: 30),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Diversão: ${DataController.dataController.fun}',
                      style: GoogleFonts.roboto(
                          fontSize: 25,
                          color: AppTheme.corCirculo,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                HorizontalBar(
                  value: DataController.dataController.fun,
                  cor: AppTheme.corCirculo,
                  corBG: AppTheme.corProgresso,
                ),
                SizedBox(
                  height: 80,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Voltar',
                    style: GoogleFonts.roboto(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  width: 60,
                  height: 60,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: const Icon(
                        Icons.gamepad,
                        color: AppTheme.corCirculo,
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
