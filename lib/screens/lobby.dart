// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miku_datchi/components/HorizontalBar.dart';
import 'package:miku_datchi/components/button.dart';
import 'package:miku_datchi/constants/styling.dart';
import 'package:miku_datchi/functions/DataController.dart';
import 'package:miku_datchi/functions/functions.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class Lobby extends StatefulWidget {
  @override
  _LobbyState createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
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
          int secs = 5;
          int randomSeconds = func.getRandomSeconds();

          final decreaseStatusTimer = RestartableTimer(
            Duration(seconds: randomSeconds),
            () {
              print("Próxima atualização em $randomSeconds segundos");
              Future.delayed(
                Duration(seconds: randomSeconds),
                () => setState(
                  () {
                    func.getRandomStatus();
                  },
                ),
              );
            },
          );
          if (randomSeconds == 0) {
            decreaseStatusTimer.reset();
          }

          Timer mytimer = Timer.periodic(Duration(seconds: 10), (timer) {
            setState(() {
              print("Happy Done");
              func.decreaseHappiness();
            });
          });

          final verifyTimer = RestartableTimer(
            Duration(seconds: 1),
            () {
              if (DataController.dataController.food == 4) {
                switch (DataController.dataController.controleFood) {
                  case 1:
                    final snackBar = SnackBar(
                      elevation: 0,
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.transparent,
                      content: AwesomeSnackbarContent(
                        title: 'Atenção Atenção!',
                        message: 'Obrigado pela atenção!',

                        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                        contentType: ContentType.failure,
                      ),
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);

                    // _showPopup(
                    //   context,
                    //   DataController.dataController.food,
                    //   'Miku está ficando com fome.',
                    // );
                    DataController.dataController.controleFood = 2;
                    print("Dialog será exibido");

                    break;

                  case 2:
                    print("Dialog ja foi exibido");
                    break;

                  default:
                }
              }

              if (DataController.dataController.drink == 4) {
                switch (DataController.dataController.controleDrink) {
                  case 1:
                    _showPopup(
                      context,
                      DataController.dataController.drink,
                      'Miku está ficando com sede.',
                    );
                    DataController.dataController.controleDrink = 2;
                    print("Dialog será exibido");

                    break;

                  case 2:
                    print("Dialog ja foi exibido");
                    break;

                  default:
                }
              }

              if (DataController.dataController.fun == 4) {
                switch (DataController.dataController.controleFun) {
                  case 1:
                    _showPopup(
                      context,
                      DataController.dataController.fun,
                      'Miku está ficando entediada.',
                    );
                    DataController.dataController.controleFun = 2;
                    print("Dialog será exibido");

                    break;

                  case 2:
                    print("Dialog ja foi exibido");
                    break;

                  default:
                }
              }
            },
          );
          if (randomSeconds == 0) {
            verifyTimer.reset();
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
                            Navigator.pushNamed(context, '/status');
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
                          onTap: () {},
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AddazButton(
                              onPress: () {
                                setState(() {
                                  func.indecreaseHappiness();
                                  DataController.dataController.controleFood =
                                      1;
                                  DataController.dataController.food =
                                      DataController.dataController
                                          .IncrementSts(DataController
                                              .dataController.food);
                                });
                              },
                              icone: Icons.fastfood,
                              tamanho: 60,
                              bgCor: AppTheme.bgfome,
                              cor: AppTheme.fome),
                          AddazButton(
                              onPress: () {
                                setState(() {
                                  func.indecreaseHappiness();
                                  DataController.dataController.controleDrink =
                                      1;
                                  DataController.dataController.drink =
                                      DataController.dataController
                                          .IncrementSts(DataController
                                              .dataController.drink);
                                });
                              },
                              icone: Icons.emoji_food_beverage,
                              tamanho: 60,
                              bgCor: AppTheme.bgDrink,
                              cor: AppTheme.drink),
                          AddazButton(
                              onPress: () {
                                setState(() {
                                  func.indecreaseHappiness();
                                  DataController.dataController.controleFun = 1;
                                  DataController.dataController.fun =
                                      DataController
                                          .dataController
                                          .IncrementSts(DataController
                                              .dataController.fun);
                                });
                              },
                              icone: Icons.mic,
                              tamanho: 60,
                              bgCor: AppTheme.bgBtnFun,
                              cor: AppTheme.corCirculo),
                          SizedBox(
                            height: 40,
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          AwesomeSnackbarContent(
                              title: "SaaS",
                              message: "Wood está SaaS",
                              contentType: ContentType.failure);
                        },
                        child: const Text('Carai'),
                      ),
                      ElevatedButton(
                        child: const Text('Teste'),
                        onPressed: () {
                          final snackBar = SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: 'Atenção Atenção!',
                              message: 'Meu pau ta durão!',

                              /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                              contentType: ContentType.failure,
                            ),
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        },
                      ),
                      Text(
                          'Felicidade: ${DataController.dataController.happy}'),
                      HorizontalBar(
                        value: DataController.dataController.happy,
                        cor: AppTheme.corCirculo,
                        corBG: AppTheme.corProgresso,
                      ),
                      // HorizontalBar(
                      //   value: DataController.dataController.drink,
                      //   cor: AppTheme.corCirculo,
                      //   corBG: AppTheme.corProgresso,
                      // ),
                      // HorizontalBar(

                      //   value: DataController.dataController.fun,
                      //   cor: AppTheme.corCirculo,
                      //   corBG: AppTheme.corProgresso,
                      // ),
                      // // Text('Drink: ${dataController.drink}'),
                      // // Text('Fun: ${dataController.fun}'),
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

  void _showPopup(BuildContext context, double atr, String msg) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: RichText(
            text: TextSpan(
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Aviso',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          content: RichText(
            textAlign: TextAlign.left,
            textDirection: TextDirection.ltr,
            text: TextSpan(
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: msg,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
