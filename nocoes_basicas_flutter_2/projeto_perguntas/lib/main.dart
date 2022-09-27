import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questao.dart';

void main(List<String> args) => runApp(PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });

    print(_perguntaSelecionada);
  }

  @override
  Widget build(BuildContext context) {
    final List<String> perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?',
    ];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('Perguntas')),
      body: Column(
        children: [
          Questao(
            texto: perguntas[_perguntaSelecionada],
          ),
          Container(
              child: RaisedButton(
                  child: Text("Resposta 1"), onPressed: _responder)),
          Container(
              child: RaisedButton(
                  child: Text('Resposta 2'), onPressed: _responder)),
          Container(
              child: RaisedButton(
                  child: Text('Resposta 3'), onPressed: _responder)),
        ],
      ),
    ));
  }
}

class PerguntaApp extends StatefulWidget {
  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
