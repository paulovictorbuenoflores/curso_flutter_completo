import 'modelo/carro.dart';

void main(List<String> args) {
  Carro carro = new Carro.velocidadeMax(velocidadeMaxima: 10);

  carro.acelerar();
  carro.acelerar();
  carro.acelerar();

  print(carro.toString());

  carro.frear();
  print("Apertou o Freio!\n " + carro.toString());
  carro.frear();
}
