import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/app_drawer.dart';
import 'package:shop/components/order_pedido_widget.dart';
import 'package:shop/models/order_pedido_list.dart';

class OrderPage extends StatefulWidget {
  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  bool _isloading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<OrderPedidoList>(context, listen: false)
        .loadOrders()
        .then((value) {
      setState(() {
        _isloading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final OrderPedidoList orders = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Meus Pedidos'),
      ),
      drawer: AppDrawer(),
      /* body: FutureBuilder(
        future:
            Provider.of<OrderPedidoList>(context, listen: false).loadOrders(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
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
      ),*/
      body: _isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: orders.itemsCount,
              itemBuilder: ((context, index) =>
                  OrderPedidoWidget(orderPedido: orders.items[index])),
            ),
    );
  }
}
