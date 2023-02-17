import 'carro.dart';
import 'esportivo.dart';
import 'luxo.dart';

//ferrarie herda de carro, o with é o mixins,
////com isso posso receber mais de uma caracteristica,
/////diferente de heranca, que só pode herdar apenas uma vez.
/////uma classe pode ter multiplos mixins
class Ferrarie extends Carro with Esportivo, Luxo {
  @override
  int acelerar() {
    if (turboLigado) {
      super.acelerar();
    }
    return super.acelerar();
  }
}
