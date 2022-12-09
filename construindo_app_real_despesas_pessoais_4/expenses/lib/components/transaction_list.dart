import 'package:expenses/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final void Function(String)
      onRemove; // essa funcao vai retornar void, vai receber uma string
  TransactionList(this._transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return _transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, Constraints) {
              return Column(
                children: <Widget>[
                  SizedBox(
                    height: Constraints.maxHeight * 0.05,
                  ),
                  Container(
                    height: Constraints.maxHeight * 0.3,
                    child: Text(
                      'Nenhuma Transação cadastrada',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                  SizedBox(
                    height: Constraints.maxHeight * 0.05,
                  ),
                  Container(
                    height: Constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemCount: _transactions.length,
            itemBuilder: (ctx, index) {
              final tr = _transactions[index];
              return Card(
                //cada linha da lista
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text('R\$${tr.value}'),
                      ),
                    ),
                  ),
                  title: Text(
                    tr.title,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(
                    DateFormat('d MMM y').format(tr.date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 400
                      ? FlatButton.icon(
                          onPressed: () => onRemove(tr.id),
                          icon: Icon(Icons.delete,
                              color: Theme.of(context).errorColor),
                          label: Text('Excluir'),
                        )
                      : IconButton(
                          color: Theme.of(context).errorColor,
                          icon: Icon(Icons.delete),
                          onPressed: () => onRemove(tr.id),
                        ),
                ),
              );
            },
          );
  }
}
