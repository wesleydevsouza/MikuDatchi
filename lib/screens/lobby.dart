// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/commons/button.dart';
import 'package:water_reminder/constants/styling.dart';
import 'package:water_reminder/screens/status.dart';

class Lobby extends StatefulWidget {
  //Var
  int drink;
  int eat;
  int sleep;
  int sing;

  Lobby(this.drink, this.eat, this.sleep, this.sing);

  @override
  _LobbyState createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  int _drink = 10;
  int _eat = 10;
  int _sleep = 10;
  int _sing = 10;

  void _incrementDrink() {
    setState(() {
      _drink++;
    });
  }

  void _incrementEat() {
    setState(() {
      _eat++;
    });
  }

  void _incrementSing() {
    setState(() {
      _sing++;
    });
  }

  void _incrementSleep() {
    setState(() {
      _sleep++;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  void _goToScreenTwo() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => StatusScreen(
                eat: _eat,
                drink: _drink,
                sing: _sing,
                sleep: _sleep,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.corScaffold,
      body: SafeArea(
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
                        decoration: const BoxDecoration(shape: BoxShape.circle),
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
                            text: 'Datchi',
                            style: TextStyle(color: AppTheme.corLogo2)),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: InkWell(
                      onTap: () {
                        print("funfou");
                      }, //hides the player view
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: const BoxDecoration(shape: BoxShape.circle),
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
              Row(
                children: [
                  AddazButton(
                      onPress: () {},
                      icone: Icons.fastfood,
                      tamanho: 60,
                      cor: Colors.blueAccent),
                  AddazButton(
                      onPress: () {},
                      icone: Icons.emoji_food_beverage,
                      tamanho: 60,
                      cor: Colors.blueAccent),
                  AddazButton(
                      onPress: () {},
                      icone: Icons.mic,
                      tamanho: 60,
                      cor: Colors.blueAccent),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
