void main(List<String> args) {
  var alunos = [
    {'nome': 'Victor1', 'nota': 9.9},
    {'nome': 'Victor2', 'nota': 8.9},
    {'nome': 'Victor3', 'nota': 7.9},
    {'nome': 'Victor4', 'nota': 6.9},
    {'nome': 'Victor5', 'nota': 4.9},
    {'nome': 'Victor6', 'nota': 5.9},
  ];

  var total = alunos
      .map((aluno) => aluno['nota'])
      .map((nota) => (nota as double))
      .reduce((t, a) => t + a);
  print("Notal total da turma: $total");
}
//3 funcoes classicas da programacao funcional .map .reduce fucao como variavel