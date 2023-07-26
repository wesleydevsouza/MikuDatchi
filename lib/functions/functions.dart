import 'dart:math';

import 'package:miku_datchi/functions/DataController.dart';

class Functions {
  late int sts;

  int getRandomSeconds() {
    Random random = Random();
    return random.nextInt(30);
  }

  void decayValue(atributo) {
    if (atributo > 1) {
      --atributo;
    }
  }

  void getRandomStatus() {
    Random dan = Random();
    sts = dan.nextInt(60);

    switch (sts) {
      case 0:
        if (DataController.dataController.food > 1) {
          --DataController.dataController!.food;
        }
        return;

      case 1:
        if (DataController.dataController.drink > 1) {
          --DataController.dataController!.drink;
        }
        return;

      case 2:
        if (DataController.dataController.fun > 1) {
          --DataController.dataController!.fun;
        }
        return;

      default:
        return;
    }
  }
}
