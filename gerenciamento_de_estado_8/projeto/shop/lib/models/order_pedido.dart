import 'package:shop/models/cart_item.dart';

class OrderPedido {
  final String id;
  final double total;
  final List<CartItem> products;
  final DateTime date;

  OrderPedido(
      {required this.id,
      required this.total,
      required this.products,
      required this.date});
}
