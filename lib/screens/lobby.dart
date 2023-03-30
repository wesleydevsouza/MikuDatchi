// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/constants/styling.dart';

class Lobby extends StatefulWidget {
  const Lobby({Key? key}) : super(key: key);

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
            ],
          ),
        ),
      ),
    );
  }
}
