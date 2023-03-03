import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/order_pedido_widget.dart';
import 'package:shop/models/order_pedido_list.dart';

class OrderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final OrderPedidoList orders = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orders.itemsCount,
        itemBuilder: ((context, index) =>
            OrderPedidoWidget(orderPedido: orders.items[index])),
      ),
    );
  }
}