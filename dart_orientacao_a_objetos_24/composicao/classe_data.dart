class Data {
  int? dia;
  int? mes;
  int? ano;
//Data(){}
  Data(this.dia, this.mes, this.ano);

  dataFormatada() {
    print("$dia/$mes/$ano");
  }
}

void main(List<String> args) {
  var dataAniversario = new Data(28, 10, 1996);

  dataAniversario.dataFormatada();

  Data dataCompra = Data(28, 10, 1996);
  dataCompra.dia = 23;
  dataCompra.mes = 12;
  dataCompra.ano = 2022;
}
