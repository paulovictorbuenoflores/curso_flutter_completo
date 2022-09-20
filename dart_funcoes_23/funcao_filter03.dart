void main(List<String> args) {
  const notas = const [8.2, 7.1, 6.7, 8.9, 4.5, 9.5];
  var boasNotasFn = (double nota) => nota >= 7.5;

  print(filtrar(notas, boasNotasFn));

  var nomes = ['ana', 'bia', 'rebeca', 'Victor'];
  var nomesGrandeFn = (String nome) => nome.length >= 5;

  print(filtrar(nomes, nomesGrandeFn));
}

//essa funcao que passa como parametro outra funcao que serve para filtrar pode ser usado para filtrar produtos frágeis
//Retorna uma lista generica.  //parametros da funcao filtrar (lista generica, uma funcao que retorna um boolean, tem como parametro uma funcao generica, essa funcao fn é para filtrar a lista)
List<E> filtrar<E>(List<E> lista, bool Function(E) fn) {
  List<E> listaFiltrada = [];
  for (E elemento in lista) {
    if (fn(elemento)) {
      listaFiltrada.add(elemento);
    }
  }

  return listaFiltrada;
}
