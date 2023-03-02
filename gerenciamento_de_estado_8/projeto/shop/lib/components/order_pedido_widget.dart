import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:shop/models/order_pedido.dart';

class OrderPedidoWidget extends StatefulWidget {
  final OrderPedido orderPedido;
  OrderPedidoWidget({required this.orderPedido});

  @override
  State<OrderPedidoWidget> createState() => _OrderPedidoWidgetState();
}

class _OrderPedidoWidgetState extends State<OrderPedidoWidget> {
  bool _expand = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          ListTile(
            title: Text('R\$ ${widget.orderPedido.total.toStringAsFixed(2)}'),
            //no pubspec.yaml temos importacao do intl, que é responsavel pela formatacao da data
            subtitle: Text(
                DateFormat('dd/MM/yyyy hh:mm').format(widget.orderPedido.date)),
            trailing: IconButton(
              icon: _expand ? Icon(Icons.expand_less) : Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  _expand = !_expand;
                });
              },
            ),
          ),
          if (_expand)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              height: (widget.orderPedido.products.length * 25.0) + 10,
              child: ListView(
                children: widget.orderPedido.products.map((product) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        ' ${product.quantidade}x R\$ ${product.price}',
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  );
                }).toList(),
              ),
            )
        ],
      ),
    );
  }
}
