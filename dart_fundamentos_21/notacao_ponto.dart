void main(List<String> args) {
  double peso = 6.99.truncateToDouble(); //tira as casas decimais
  double nota = (6.99).roundToDouble(); //valor arredondado para 7

  print("bom dia".toUpperCase());
  print(peso);
  print(nota);

  String s1 = "Ola mundo";
  String s2 = s1.substring(0, 9);
  String s3 = s2.toUpperCase();
  String s4 = s3.padRight(2, " qualquer coisa");
  print(s4);
  var s5 = s4;
  print(s5.substring(0, 9).toLowerCase().padRight(15, '!'));
  print(s5);
}
