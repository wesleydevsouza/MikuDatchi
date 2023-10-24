import 'dart:math';

import 'package:miku_datchi/functions/DataController.dart';

class Functions {
  late int sts;

  int getRandomSeconds() {
    Random random = Random();
    return random.nextInt(30);
  }

  int getRandomSecondsHappy() {
    Random random = Random();
    return random.nextInt(90);
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

  void decreaseHappiness() {
    if (DataController.dataController.happy > 1) {
      if (DataController.dataController.happy < 4 ||
          DataController.dataController.drink < 4 ||
          DataController.dataController.fun < 4) {
        DataController.dataController.happy =
            DataController.dataController.happy - 1;
      }
    }
  }

  void indecreaseHappiness() {
    if (DataController.dataController.happy < 10 ||
        DataController.dataController.drink < 10 ||
        DataController.dataController.fun < 10) {
      DataController.dataController.happy =
          DataController.dataController.happy + 0.5;
    }
  }
}
