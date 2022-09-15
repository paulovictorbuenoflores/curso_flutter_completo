import 'dart:io';

void main(List<String> args) {
  int op;
  print("Informe uma opcao de 1 a 5");
  op = int.parse(stdin.readLineSync().toString());
  switch (op) {
    case 1:
      print("Op 1");
      break;
    case 2:
      print("Op 2");
      break;
    case 3:
      print("Op 3");
      break;
    case 4:
      print("Op 4");
      break;
    case 5:
      print("Op 5");
      break;
  }
}
