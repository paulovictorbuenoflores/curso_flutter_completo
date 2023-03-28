import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  //static const _url ='https://identitytoolkit.googleapis.com/v1/accounts: signUp             ?key=AIzaSyCUe2zMH0ccoNSrIhIkgIwxhymFqeEv4pY';
  //https://identitytoolkit.googleapis.com/v1/accounts: signInWithPassword ?key=AIzaSyCUe2zMH0ccoNSrIhIkgIwxhymFqeEv4pY
  Future<void> _authenticate(
      String email, String password, String urlFragment) async {
    print('${email} ${password}');
    final url =
        'https://identitytoolkit.googleapis.com/v1/accounts:${urlFragment}?key=AIzaSyCUe2zMH0ccoNSrIhIkgIwxhymFqeEv4pY';
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(
        {
          'email': email,
          'password': password,
          'returnSecureToken': true,
        },
      ),
    );
    print(jsonDecode(response.body));
  }

  Future<void> signup(String email, String password) async {
    _authenticate(email, password, 'signUp');
    print('cadastro signup');
  }

  Future<void> login(String email, String password) async {
    _authenticate(email, password, 'signInWithPassword');
    print('login');
  }
}
