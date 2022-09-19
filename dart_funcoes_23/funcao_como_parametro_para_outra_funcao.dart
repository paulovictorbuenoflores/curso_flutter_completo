import 'dart:math';

void main(List<String> args) {
  Function minhaFnPar = () => print("é Par!");
  Function minhaFnImpar = () => print("é Impar!");
  executar(minhaFnPar, minhaFnImpar);
}

void executar(Function fnPar, Function fnImpar) {
  Random().nextInt(10) % 2 == 0 ? fnPar() : fnImpar();
}
