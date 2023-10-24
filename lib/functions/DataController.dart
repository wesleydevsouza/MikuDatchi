class DataController {
  double drink = 10;
  double food = 10;
  double fun = 10;
  double happy = 1;

  int controleFood = 1;
  int controleDrink = 1;
  int controleFun = 1;

  static final DataController _dataController =
      DataController._construtorPrivado();

  DataController._construtorPrivado();

  static DataController get dataController => _dataController;

  double IncrementSts(double atributo) {
    if (atributo < 10) {
      return ++atributo;
    } else {
      return atributo = 10;
    }
  }

  double DecrementSts(double atributo) {
    return --atributo;
  }
}
