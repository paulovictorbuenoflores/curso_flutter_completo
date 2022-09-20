void main(List<String> args) {
  const notas = const [8.2, 7.1, 6.7, 8.9, 4.5, 6.5];

  print(notasMaiores07(notas));
  print("====================================================================");

  bool Function(double) notasBoasFn = (double nota) => nota >= 7;
  var notasBoas = notas.where(
      notasBoasFn); //dessa lista de notas, pegue apenas as boas, quando for true

  print(notasBoas);
}

//maneira convencional
List<double> notasMaiores07(List notas) {
  List<double> lista = [];

  for (int i = 0; i < notas.length; i++) {
    if (notas[i] >= 7) {
      lista.add(notas[i]);
    }
  }

  return lista;
}
