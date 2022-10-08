import 'dart:ffi';

import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main(List<String> args) => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo tenis',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despesas Pessoais'),
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blue,
              child: Text('Gráfico'),
              elevation: 5,
            ),
          ),
          Column(
            children: _transactions.map((tr) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 209, 53, 236),
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        "R\$ " + tr.value.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.purple,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          tr.title,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat('d/MM/y').format(tr.date),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
          Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    //onchanged sempre que mudar vou setar o valor nessa variavel, titulo
                    // onChanged: (novoValor) => titulo = novoValor,
                    controller: titleController,
                    decoration: InputDecoration(
                      labelText: 'Titulo',
                    ),
                  ),
                  TextField(
                    //  onChanged: (novoValor) => valor = novoValor,
                    controller: valueController,
                    decoration: InputDecoration(
                      labelText: 'Valor (R\$)',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                          onPressed: () {
                            print(titleController.text);
                            print(valueController.text);
                          },
                          textColor: Colors.purple,
                          child: Text('Nova Transação'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
