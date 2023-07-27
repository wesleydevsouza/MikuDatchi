class DataController {
  int drink = 10;
  int food = 10;
  int fun = 10;
  int happy = 1;

  int controleFood = 1;
  int controleDrink = 1;
  int controleFun = 1;

  static final DataController _dataController =
      DataController._construtorPrivado();

  DataController._construtorPrivado();

  static DataController get dataController => _dataController;

  int IncrementSts(int atributo) {
    if (atributo < 10) {
      return ++atributo;
    } else {
      return atributo = 10;
    }
  }

  int DecrementSts(int atributo) {
    return --atributo;
  }
}
