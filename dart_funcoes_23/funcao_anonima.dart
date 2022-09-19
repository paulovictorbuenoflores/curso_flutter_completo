void main(List<String> args) {
  //funcao anonima é uma funcao sem nome, só com os parametros
  var multiplicacao = (int a, int b) => a * b;
  var divisao = (int a, int b) => a / b;
  var subtracao = (int a, int b) => a - b; //funcao anonima com =>
  var adicao = (int a, int b) {
    return a + b;
  }; //funcao anonima sem =>
  print(subtracao(9, 13));
  print(adicao(4, 19));

//var x =
//Function x =
//int Function (int,int) x =
  int Function(int, int) x = (int x, int y) {
    return x + y;
  }; //funcao anonima
}
