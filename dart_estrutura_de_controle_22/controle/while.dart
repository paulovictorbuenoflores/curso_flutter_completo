import 'dart:io';

void main(List<String> args) {
  //o while e o do while é pra quando vc tem quantidades indeterminadas de repeticao
  String? sair = '';
  /////WHILE/////
  while (sair != 'sair') {
    //enquanto for verdade execulte
    stdout.write('While-Digite algo ou sair: ');
    sair = stdin.readLineSync();
  }
/////////////DO WHILE////////////
  do {
    stdout.write('DO-WhileDigite algo ou sair: ');
    sair = stdin.readLineSync();
  } while (sair != 'sair');
}
