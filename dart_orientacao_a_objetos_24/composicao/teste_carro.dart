import 'carro.dart';

void main(List<String> args) {
  Carro carro = new Carro.velocidadeMax(velocidadeMaxima: 27);

  carro.acelerar();
  carro.acelerar();
  carro.acelerar();
  carro.acelerar();
  carro.acelerar();
  carro.acelerar();

  print(carro.toString());

  carro.frear();
  carro.frear();
  carro.frear();
  carro.frear();
  carro.frear();
  carro.frear();
  carro.frear();
  carro.frear();

  //carro.frear();
  //print("Apertou o Freio!\n " + carro.toString());
}
