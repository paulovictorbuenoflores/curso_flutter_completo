//vai gerenciar todos os nossos pedidos, sempre que ouver um pedido vai gerar uma notificacao

import 'dart:math';

import 'package:flutter/material.dart';

import 'cart.dart';
import 'order_pedido.dart';

class OrderPedidoList with ChangeNotifier {
  List<OrderPedido> _items = [];

  List<OrderPedido> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void addOrder(Cart cart) {
    _items.insert(
      0,
      OrderPedido(
        id: Random().nextDouble().toString(),
        total: cart.totalAmount,
        products: cart.items.values.toList(),
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
