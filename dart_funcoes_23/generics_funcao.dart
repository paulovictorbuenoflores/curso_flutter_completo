void main(List<String> args) {
  var lista = [1, 2, 3, 4, 5, 6];
  print(segundoElementoV1(lista));
  int segundoElemento = segundoElementoV2<int>(lista);
  print(segundoElemento);
  segundoElemento = segundoElementoV2(lista);
  print(segundoElemento);
}

//object em dart pode ser qualquer coisa é bem generico
Object segundoElementoV1(List lista) {
  return lista.length >= 2 ? lista[1] : null;
}

//funcao generica que pode ser qualquer coisa
segundoElementoV2<E>(List<E> lista) {
  return lista.length >= 2 ? lista[1] : null;
}
