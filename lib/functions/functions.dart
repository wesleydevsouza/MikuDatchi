import 'dart:math';

import 'package:water_reminder/functions/DataController.dart';

class Functions {
  final DataController dataController;
  late int sts;

  Functions(
    this.dataController,
  );

  int getRandomSeconds() {
    Random random = Random();
    return random.nextInt(1);
  }

  void decayValue(atributo) {
    if (atributo > 1) {
      --atributo;
    }
  }

  void getRandomStatus() {
    Random dan = Random();
    sts = dan.nextInt(3);

    switch (sts) {
      case 0:
        if (dataController.food > 1) {
          --dataController!.food;
        }
        return;

      case 1:
        if (dataController.drink > 1) {
          --dataController!.drink;
        }
        return;

      case 2:
        if (dataController.fun > 1) {
          --dataController!.fun;
        }
        return;

      default:
        if (dataController.fun > 1) {
          --dataController!.fun;
        }
        return;
    }
  }
}
