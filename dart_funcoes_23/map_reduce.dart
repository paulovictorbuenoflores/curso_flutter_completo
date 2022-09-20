void main(List<String> args) {
  //List<double> notas = [7.3, 5.4, 7.7, 8.1, 5.5, 4.9, 9.1, 10.0];
  List<double> notas = const [1.0, 1.0, 2.0, 3.0, 5.0, 8.0, 13.0, 21.0, 34.0];

  //reduce é uma funcao mais poderosa que o map porque ela é capaz de transformar uma lista em qualquer outra coisa
  var total = notas.reduce(somar);
  print(total);
}

double somar(double acumulador, double elemento) {
  print("$acumulador + $elemento = ${acumulador + elemento}");
  return acumulador + elemento;
}
