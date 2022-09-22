class Data {
  int? dia, mes, ano;
  //parametros posicionais
  Data([this.dia, this.mes, this.ano]);
  //construtor nomeado
  Data.com({this.dia = 1, this.mes = 1, this.ano = 1970});
  Data.ultimoDiaDoAno(this.ano) {
    dia = 31;
    mes = 12;
  }

  String obterFormato() {
    return "$dia/$mes/$ano";
  }

  String toString() {
    return obterFormato();
  }
}

void main(List<String> args) {
  var dataFinal = Data.com(dia: 12, mes: 07, ano: 2019);

  print(dataFinal);
  var ultimoDiaDoAno = Data.ultimoDiaDoAno(2023);
  print(ultimoDiaDoAno);
  print(dataFinal.toString());
}
