import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main(List<String> args) => runApp(PerguntaApp());
void responder() {
  print('Pergunta responddida!');
}

class PerguntaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?'
    ];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Perguntas')),
      body: Column(
        children: [
          Text(perguntas[0]),
          Container(
              child: RaisedButton(
                  child: Text('Resposta 1'), onPressed: responder)),
          Container(
              child: RaisedButton(child: Text('Resposta 2'), onPressed: () {})),
          Container(
              child: RaisedButton(child: Text('Resposta 3'), onPressed: () {})),
        ],
      ),
    ));
  }
}
