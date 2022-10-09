import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
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
    );
  }
}
