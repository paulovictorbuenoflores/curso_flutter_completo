//vai gerenciar todos os nossos pedidos, sempre que ouver um pedido vai gerar uma notificacao

import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shop/models/cart_item.dart';
import 'package:shop/utils/constants.dart';

import 'cart.dart';
import 'order_pedido.dart';

class OrderPedidoList with ChangeNotifier {
  final String? _token;
  final String? _userId;
  List<OrderPedido> _items = [];

  OrderPedidoList(
      [this._token = '', this._userId = '', this._items = const []]);
  List<OrderPedido> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  Future<void> loadOrders() async {
    List<OrderPedido> items = [];

    final response = await http.get(
      Uri.parse('${Constants.ORDER_BASE_URL}/$_userId.json?auth=$_token'),
    ); //o await fica esperando a resposta

    if (response.body == 'null') return;
    Map<String, dynamic> data = jsonDecode(response.body);
    data.forEach((orderId, orderData) {
      items.add(
        OrderPedido(
          id: orderId,
          total: orderData['total'],
          date: DateTime.parse(orderData['date']),
          products: (orderData['products'] as List<dynamic>).map((item) {
            return CartItem(
              id: item['id'].toString(),
              productId: item['productId'].toString(),
              name: item['name'].toString(),
              quantidade: int.parse(item['quantidade'].toString()),
              price: double.parse(item['price'].toString()),
            );
          }).toList(),
        ),
      );
    });
    _items = items.reversed.toList();
    print(data.toString());
    notifyListeners();
  }

  Future<void> addOrder(Cart cart) async {
    final date = DateTime.now();

    final response = await http.post(
      Uri.parse('${Constants.ORDER_BASE_URL}/$_userId.json?auth=$_token'),
      body: jsonEncode(
        {
          "total": cart.totalAmount,
          "date": date.toIso8601String(), //formato padronizado
          "products": cart.items.values
              .map((cartItem) => {
                    'id ': cartItem.id,
                    'productId': cartItem.productId,
                    'name': cartItem.name,
                    'quantidade': cartItem.quantidade,
                    'price': cartItem.price,
                  })
              .toList(),
        },
      ),
    );
    if (response.body == null) return;
    final id = jsonDecode(response.body)['name'];
    _items.insert(
      0,
      OrderPedido(
        id: id,
        total: cart.totalAmount,
        products: cart.items.values.toList(),
        date: date,
      ),
    );
    notifyListeners();
  }
}
