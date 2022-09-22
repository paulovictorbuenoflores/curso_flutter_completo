import 'produto.dart';
import 'venda_item.dart';
import 'cliente.dart';
import 'venda.dart';

void main(List<String> args) {
  List<VendaItem> vendaItem = [];
  var venda = Venda(
      cliente: Cliente(nome: 'Francisco Cardoso', cpf: '123.456.789-00'),
      itens: <VendaItem>[
        VendaItem(
            quantidade: 10,
            produto:
                Produto(codigo: 1, nome: 'Caneta Bic', preco: 5, desconto: 0.5))
      ]);

  print("valor total da venda é : R\$${venda.valorTotal}");
  print("Nome do primeiro produtoo é : ${venda.itens[0].produto!.nome}");
}
