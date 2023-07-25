// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/commons/button.dart';
import 'package:water_reminder/components/HorizontalBar.dart';
import 'package:water_reminder/constants/styling.dart';
import 'package:water_reminder/functions/DataController.dart';
import 'package:water_reminder/functions/functions.dart';
import 'package:water_reminder/screens/status.dart';
import 'package:timer_builder/timer_builder.dart';

class Lobby extends StatefulWidget {
  @override
  _LobbyState createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  DataController dataController = DataController();

  @override
  void initState() {
    super.initState();
  }

  void _StatusScreen() async {
    Navigator.pushNamed(context, '/status');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.corScaffold,
      body: TimerBuilder.periodic(
        Duration(seconds: 1),
        builder: (context) {
          int seconds = DateTime.now().second;
          if (seconds == 0) {
            Functions func = Functions(dataController);
            int randomSeconds = func.getRandomSeconds();

            // dataController.DecrementSts(randomSts);
            print("Próxima atualização em $randomSeconds segundos");
            Future.delayed(
                Duration(seconds: randomSeconds),
                () => setState(() {
                      func.getRandomStatus();
                    }));
          }

          return SafeArea(
            minimum: EdgeInsets.fromLTRB(10, 32, 10, 10),
            child: Container(
              width: double.infinity,
              // decoration: const BoxDecoration(
              //   image: DecorationImage(
              //       image: AssetImage("images/bg.jpg"), fit: BoxFit.cover),
              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: InkWell(
                          onTap: () {
                            print("funfou");
                          }, //hides the player view
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: const Icon(
                              Icons.menu,
                              color: Colors.blueAccent,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
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
                                text: 'Dachi',
                                style: TextStyle(color: AppTheme.corLogo2)),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 60,
                        height: 60,
                        child: InkWell(
                          onTap: () {
                            _StatusScreen;
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration:
                                const BoxDecoration(shape: BoxShape.circle),
                            child: const Icon(
                              Icons.alarm,
                              color: Colors.blueAccent,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Stack(
                    children: <Widget>[
                      Container(
                        width: double.infinity,
                        //borderRadius: BorderRadius.circular(1000),
                        child: Image.asset('images/scene.png', scale: 2),
                      ),
                      Container(
                        //borderRadius: BorderRadius.circular(1000),
                        child: Image.asset('images/char.png'),
                      ),
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(1000),
                      //   child: Image.asset('images/placeholder.jpg', scale: 2),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          AddazButton(
                              onPress: () {
                                setState(() {
                                  dataController.food =
                                      dataController.IncrementSts(
                                          dataController.food);
                                });
                              },
                              icone: Icons.fastfood,
                              tamanho: 60,
                              cor: Colors.blueAccent),
                          AddazButton(
                              onPress: () {
                                setState(() {
                                  dataController.drink =
                                      dataController.IncrementSts(
                                          dataController.drink);
                                });
                              },
                              icone: Icons.emoji_food_beverage,
                              tamanho: 60,
                              cor: Colors.blueAccent),
                          AddazButton(
                              onPress: () {
                                setState(() {
                                  dataController.fun =
                                      dataController.IncrementSts(
                                          dataController.fun);
                                });
                              },
                              icone: Icons.mic,
                              tamanho: 60,
                              cor: Colors.blueAccent),
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                      Text('Food: ${dataController.food}'),
                      // FAProgressBar(
                      //   currentValue: dataController.food * 10,
                      //   displayText: '%',
                      // ),
                      HorizontalBar(
                        value: dataController.food,
                        cor: AppTheme.corCirculo,
                        corBG: AppTheme.corProgresso,
                      ),
                      HorizontalBar(
                        value: dataController.drink,
                        cor: AppTheme.corCirculo,
                        corBG: AppTheme.corProgresso,
                      ),
                      HorizontalBar(
                        value: dataController.fun,
                        cor: AppTheme.corCirculo,
                        corBG: AppTheme.corProgresso,
                      ),
                      // Text('Drink: ${dataController.drink}'),
                      // Text('Fun: ${dataController.fun}'),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  int value = 100;
  int minDecayValue = 1;

  int getRandomSeconds() {
    Random random = Random();
    return random.nextInt(31) + 30;
  }
}
