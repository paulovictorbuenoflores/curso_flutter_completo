import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:shop/utils/constants.dart';

class Product with ChangeNotifier {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.price,
      required this.imageUrl,
      this.isFavorite = false});
  void _alternanciaFavorito() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  Future<void> alternanciaFavorito(String token, String userId) async {
    _alternanciaFavorito();

    final response = await http.put(
      Uri.parse(
          '${Constants.USER_FAVORITES_URL}/$userId/${id}.json?auth=$token'),
      body: jsonEncode(isFavorite),
    );

    if (response.statusCode >= 400) {
      _alternanciaFavorito();
    }
  }
}
