/**
 * Principio da programacao funcional
 * Uma caracteristica muito importante do dart é a capacidade de armazenar uma funcao em uma variavel, coseguir retornar uma funcao
 * quando conseguir armazernar uma funcao em uma variavel vc vai conseguir passar uma funcao para outra funcao como variavel
 */

void main(List<String> args) {
  //como criar uma variavel
  //tipo nome =valor;
  int a = 9;
  //como criar uma funcao em uma variavel
  //tipo Function(Parametros da funcao) nome = funcao/ou tipo anonimo, ou seja uma funcao sem nome
  int Function(int, int) soma = somaFn;

  print(soma(1, 2));

  ///funcao anonima, ou seja, funcao sem nome
  int Function(int, int) soma2 = (x, y) {
    return x + y;
  };
  //por inferencia
  var soma3 = (x, y) {
    return x + y;
  };
  print(soma2(1, 2));
  print(soma3(1, 2));
}

int somaFn(int a, int b) {
  return a + b;
}
