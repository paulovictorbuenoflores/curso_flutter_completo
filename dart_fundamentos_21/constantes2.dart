void main(List<String> args) {
  final lista = [
    'Ana',
    'Lia',
    'Gui'
  ]; //posso alterar o conteudo da lista crud, mas não posso enseri uma nova lista

  //ao adicionar que a lista é constante nao posso alterar o seu valor
  final lista2 = const ['Ana', 'Lia', 'Gui'];
  lista.add('Rebeca'); //o CRUD é permitido
  //lista = ['Rafa', 'Eliane'];//nao é permitido atribuir uma nova lista

  print(lista);
}
