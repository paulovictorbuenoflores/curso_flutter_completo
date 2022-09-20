void main(List<String> args) {
  //lista de map, a ideia de uma funcao map é mapear um elemento em outro
  var alunos = [
    {'nome': 'Victor1', 'nota': 9.9},
    {'nome': 'Victor2', 'nota': 9.9},
    {'nome': 'Victor3', 'nota': 9.9},
    {'nome': 'Victor4', 'nota': 9.9},
    {'nome': 'Victor5', 'nota': 9.9},
    {'nome': 'Victor6', 'nota': 9.9},
  ];

  String Function(Map) pegarApenasNome = (aluno) => aluno['nome'];

  int Function(String) qtdDeLetras = (texto) => texto.length;
  int Function(int) dobro = (numero) => numero * 2;
  var resultado = alunos.map(pegarApenasNome).map(qtdDeLetras).map(dobro);
  print(resultado);
//map é um exemplo de como passar uma funcao como paramentor para outra funcao
  //funcao map tem objetivo transformar um elemento em outro elemento, nao muda o tamanho da lista gerada, tem o mesmo tamanho da lista original
}
