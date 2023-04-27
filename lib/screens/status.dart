// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:water_reminder/commons/button.dart';
import 'package:water_reminder/constants/styling.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen(
      {Key? key,
      required this.drink,
      required this.eat,
      required this.sleep,
      required this.sing})
      : super(key: key);

  //Var
  final int drink;
  final int eat;
  final int sleep;
  final int sing;

  @override
  _StatusScreenState createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  void initState() {
    super.initState();
  }

  int progressValue = 1; // Defina o valor de progresso aqui

  void increaseProgress() {
    setState(() {
      if (progressValue != 10) {
        // Verifica se o valor não é igual a 10
        progressValue++; // Incrementa o valor da variável
      }
    });
  }

  void decreaseProgress() {
    setState(() {
      if (progressValue != 1) {
        // Verifica se o valor não é igual a 1
        progressValue--; // Decrementa o valor da variável
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.corScaffold,
      body: SafeArea(
        minimum: EdgeInsets.fromLTRB(10, 32, 10, 10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 50,
                child: LinearProgressIndicator(
                  value: progressValue / 10, // Calcula o valor do progresso
                  backgroundColor: Colors.grey[300], // Cor de fundo da barra
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.orange), // Cor da barra de progresso
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                child: LinearProgressIndicator(
                  value: progressValue / 10, // Calcula o valor do progresso
                  backgroundColor: Colors.grey[300], // Cor de fundo da barra
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.blue), // Cor da barra de progresso
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                child: LinearProgressIndicator(
                  value: progressValue / 10, // Calcula o valor do progresso
                  backgroundColor: Colors.grey[300], // Cor de fundo da barra
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.purple), // Cor da barra de progresso
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                child: LinearProgressIndicator(
                  value: progressValue / 10, // Calcula o valor do progresso
                  backgroundColor: Colors.grey[300], // Cor de fundo da barra
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.yellow), // Cor da barra de progresso
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      increaseProgress(); // Chama a função de incremento
                    },
                    child: Icon(Icons.add),
                  ),
                  SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      decreaseProgress(); // Chama a função de decremento
                    },
                    child: Icon(Icons.remove),
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
