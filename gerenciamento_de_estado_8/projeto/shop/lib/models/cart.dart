import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:shop/models/cart_item.dart';
import 'package:shop/models/product.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    //vamos clonar a lista para que alguém de fora nao possa limpar a lista ou excluir, manipular a lista.
    return {..._items};
  }

  int get itemsCount {
    // notifyListeners();
    return _items.length;
  }

  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantidade;
    });

    return total;
  }

  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items.update(
        product.id,
        (itemExistente) => CartItem(
            id: itemExistente.id,
            productId: itemExistente.productId,
            name: itemExistente.name,
            quantidade: itemExistente.quantidade + 1,
            price: itemExistente.price),
      );
    } else {
      _items.putIfAbsent(
          product.id,
          () => CartItem(
              id: Random().nextDouble().toString(),
              productId: product.id,
              name: product.name,
              quantidade: 1,
              price: product.price));
    }
    notifyListeners();
  }

  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      return;
    }
    if (_items[productId]?.quantidade == 1) {
      _items.remove(productId);
    } else {
      _items.update(
        productId,
        (itemExistente) => CartItem(
            id: itemExistente.id,
            productId: itemExistente.productId,
            name: itemExistente.name,
            quantidade: itemExistente.quantidade - 1,
            price: itemExistente.price),
      );
    }
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }
}
