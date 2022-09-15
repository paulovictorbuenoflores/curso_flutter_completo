void main(List<String> args) {
  List<String> textos = const ['#', '##', '###', '####', '#####', '######'];

  for (var t in textos) {
    print(t);
  }

  for (var valor = '#'; valor != '#######'; valor += '#') {
    print(valor);
  }
}
