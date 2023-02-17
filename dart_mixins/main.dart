import 'carro.dart';
import 'ferrarie.dart';
import 'gol.dart';

void main(List<String> args) {
  Carro carro = new Carro();
  //polimorfismos, a variavel carro1 pode assumir mutiplas formas, pode assumir a forma de Ferrarie e depois pode assumir a forma de Gol
  Carro carro1 = new Ferrarie();
  print(carro1.acelerar());
  carro1 = Gol();
  print(carro1.acelerar());
}
