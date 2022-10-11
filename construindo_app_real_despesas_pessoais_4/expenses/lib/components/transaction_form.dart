import 'package:expenses/components/transaction_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class TransactionForm extends StatelessWidget {
  final titleController = TextEditingController();
  final valueController = TextEditingController();

  final void Function(String, double) onSubmit;
  TransactionForm(this.onSubmit);

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
                      final title = titleController.text;
                      final value = double.tryParse(valueController.text) ?? 0;
                      onSubmit(title, value);
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