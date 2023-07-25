class DataController {
  int drink = 5;
  int food = 6;
  int fun = 7;

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
