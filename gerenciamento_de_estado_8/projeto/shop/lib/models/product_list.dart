import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shop/data/dummy_data.dart';
import 'package:shop/models/product.dart';

class ProductList with ChangeNotifier {
  final _baseUrl = 'https://shop-cod3r-1a4a8-default-rtdb.firebaseio.com';

  List<Product> _items = dummyProducts;

  List<Product> get items => [..._items];
  List<Product> get favoriteItems =>
      _items.where((prod) => prod.isFavorite).toList();

  int get itemsCount {
    // notifyListeners();
    return _items.length;
  }

  Future<void> saveProduct(Map<String, Object> data) {
    bool hasId = data['id'] != null;
    final product = Product(
      id: hasId ? data['id'] as String : Random().nextDouble().toString(),
      name: data['name'] as String,
      description: data['description'] as String,
      price: data['price'] as double,
      imageUrl: data['imageUrl'] as String,
    );
    if (hasId) {
      return updateProduct(product);
    } else {
      return addProduct(product);
    }
  }

  Future<void> updateProduct(Product product) {
    int index = _items.indexWhere((p) => p.id == product.id);
    if (index >= 0) {
      _items[index] = product;
      notifyListeners();
    }
    return Future.value();
  }

  void removeProduct(Product product) {
    int index = _items.indexWhere((p) => p.id == product.id);
    if (index >= 0) {
      _items.removeWhere((p) => p.id == product.id);
      notifyListeners();
    }
  }

  Future<void> addProduct(Product product) {
    final future = http.post(
      Uri.parse('$_baseUrl/products.json'),
      body: jsonEncode(
        {
          "name": product.name,
          "description": product.description,
          "price": product.price,
          "imageUrl": product.imageUrl,
          "isFavorite": product.isFavorite,
        },
      ),
    );
    //resposta da requisicao do http, o metodo retorna o futuro que é recebido aqui no .then
//se eu quiser execultar algum codigo, apos salvar os dados, é nesse metodo
    return future.then<void>((resposta) {
      //   print(resposta.body); //para ver oq veio no corpo da resposta
      final id = jsonDecode(resposta.body)['name'];
      _items.add(Product(
          id: id,
          name: product.name,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl));
      notifyListeners(); //notifica as interessados de forma reativa, ou seja, reativa a insercao de um novo produto na lista.
    }).catchError((error) {
      print(error.toString());
      throw error;
    });
  }
}
