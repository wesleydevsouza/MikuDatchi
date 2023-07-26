class DataController {
  int drink = 5;
  int food = 6;
  int fun = 7;

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
