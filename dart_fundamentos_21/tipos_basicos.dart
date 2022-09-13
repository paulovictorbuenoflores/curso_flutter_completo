void main(List<String> args) {
  int n1 = 3;
  double n2 = (-5.43).abs(); //absoluto sem -
  num n3; // é o pai do int e double pode receber inteiro e double, ou seja, int e double extends de num
  //é tranformado para o tipo que consegue armazenar mais valores
  print(n1 + n2);
  dynamic x = "um tipo texto"; //nao tem um tipo pre definido é dinamico
  print(x);
  x = 123;
  print(x);
}
