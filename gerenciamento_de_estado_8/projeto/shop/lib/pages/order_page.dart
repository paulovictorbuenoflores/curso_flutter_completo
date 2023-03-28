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
    //  final OrderPedidoList orders = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
        future:
            Provider.of<OrderPedidoList>(context, listen: false).loadOrders(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.error != null) {
            return Center(
              child: Text('Ocorreu um erro!'),
            );
          } else {
            return Consumer<OrderPedidoList>(
              builder: (ctx, orders, child) => ListView.builder(
                itemCount: orders.itemsCount,
                itemBuilder: ((context, index) =>
                    OrderPedidoWidget(orderPedido: orders.items[index])),
              ),
            );
          }
        },
      ),
    );
  }
}
