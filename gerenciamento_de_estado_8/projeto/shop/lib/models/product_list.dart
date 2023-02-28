import 'package:flutter/cupertino.dart';
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier {
  List<Product> _items = dummyProducts;
  bool _showFavoriteOnly = false;
  List<Product> get items => [..._items];

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners(); //notifica as interessados de forma reativa, ou seja, reativa a insercao de um novo produto na lista.
  }
}
/**
 * Estamos usando o mixin para implementar o ChangeNotifier, o objetivo é notificar os interessados 
 * na lista de produtos, toda vez que alguma coisa nela mudar, para notificar os interessados atraves do changeNotifier usamos 
 * o metodo notifyListeners(), no metodo que é alterado quando alguma coisa acontece, no nosso caso é o metodo de adicionar um novo produto na lista. 
 */


/**
 * 
 *  bool _showFavoriteOnly = false;
  List<Product> get items {
    if (_showFavoriteOnly) {
      return _items.where((prod) => prod.isFavorite).toList();
    }
    return [..._items];
  }

  void addProduct(Product product) {
    _items.add(product);
    notifyListeners(); //notifica as interessados de forma reativa, ou seja, reativa a insercao de um novo produto na lista.
  }

  void showFavoriteOnly() {
    _showFavoriteOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoriteOnly = false;
    notifyListeners();
  }
 * **/