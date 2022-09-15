import 'dart:ffi';

void main(List<String> args) {
  var notas = [10, 2.3, 3.4, 4.2, 1.5];

//for in
  for (var nota in notas) {
    print(nota);
  }
  print("\n\n");
  //percorrendo um Map
  Map<String, double> alunos = {
    'Joao': 91,
    'Maria': 4.5,
    'Ana': 5.6,
    'Joana': 8.7
  };

  for (var nome in alunos.keys) {
    print("Aluno ${nome} nota: ${alunos[nome]}");
  }
}
