import 'carro.dart';
import 'ferrarie.dart';
import 'gol.dart';

void main(List<String> args) {
  Carro carro = new Carro();
  //polimorfismos, a variavel carro1 pode assumir mutiplas formas, pode assumir a forma de Ferrarie e depois pode assumir a forma de Gol
  var carro1 = new Ferrarie();
  print(carro1.acelerar());
  carro1.frear();
  //usando o mixin
  carro1.ligarTurbo();
  print(carro1.acelerar());
}
