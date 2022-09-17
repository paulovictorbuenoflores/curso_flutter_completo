void main(List<String> args) {
  soma(2.3, 5);
  print(somaComRetorno(3.14, 4.3));
  juntar(2, 3);
  nomeIdade("Paulo", 25); //parametros opcional

  //como chamar funcao parametro nomeado
  imprimir(nome: "Victor", idade: 12);
}

//parametros posicional
soma(double a, double b) {
  print(a + b);
}

double somaComRetorno(double a, double b) {
  return a + b;
}

juntar(dynamic a, b) {
  print(a + b);
}

nomeIdade(String nome, [int? idade]) {
  print("Nome:$nome ");
  print((idade != null) ? idade : null);
}

//parametros nomeado, essa caracteristica é muito usada no flutter

imprimir({String? nome, int? idade}) {
  print("$nome $idade");
}
