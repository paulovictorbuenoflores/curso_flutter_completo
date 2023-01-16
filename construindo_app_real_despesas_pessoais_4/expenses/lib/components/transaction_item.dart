import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.tr,
    required this.mediaQuery,
    required this.onRemove,
  }) : super(key: key);

  final Transaction tr;
  final MediaQueryData mediaQuery;
  final void Function(String p1) onRemove;

  @override
  Widget build(BuildContext context) {
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
        trailing: mediaQuery.size.width > 400
            ? FlatButton.icon(
                onPressed: () => onRemove(tr.id),
                icon: const Icon(Icons.delete),
                /*icon:  Icon(Icons.delete,
                    color: Theme.of(context).errorColor),*/
                label: const Text('Excluir'),
                textColor: Theme.of(context).errorColor,
              )
            : IconButton(
                color: Theme.of(context).errorColor,
                icon: Icon(Icons.delete),
                onPressed: () => onRemove(tr.id),
              ),
      ),
    );
  }
}
