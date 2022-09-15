import 'dart:math';

void main(List<String> args) {
  var nota = Random().nextInt(11);
  // final nota = 5;
  if (nota >= 7) {
    print("Passou");
  } else if (nota < 5) {
    print("Reprovou");
  } else if (nota >= 5 && nota < 7) {
    print("Reteste");
  }
}
