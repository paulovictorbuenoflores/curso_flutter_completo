import 'dart:ffi';

void main(List<String> args) {
  //por inferencia
  var n1 = 2;
  var n2 = 3.14;
  //por declaracao
  int n3 = 2;
  double n4 = 3.14;

  print(n1 + n2);
  print(n1.runtimeType);
  print(n2.runtimeType);
  print(n1 is int);
  print(n1 is String);
}
