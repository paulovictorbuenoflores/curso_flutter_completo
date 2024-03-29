import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shop/components/cart_item_widget.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_pedido_list.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Cart cart = Provider.of(context);
    final items = cart.items.values.toList();
    return Scaffold(
      appBar: AppBar(title: Text('Carrinho')),
      body: Column(children: [
        Card(
          margin: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 25,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total:',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Chip(
                  backgroundColor: Theme.of(context).primaryColor,
                  label: Text(
                    'R\$${cart.totalAmount.toStringAsFixed(2)}',
                    style: TextStyle(
                      color:
                          Theme.of(context).primaryTextTheme.headline6?.color,
                    ),
                  ),
                ),
                Spacer(),
                CartButton(cart: cart),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: ((context, index) =>
                CartItemWidget(cartItem: items[index])),
          ),
        ),
      ]),
    );
  }
}

class CartButton extends StatefulWidget {
  const CartButton({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Cart cart;

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  bool isLoading = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : TextButton(
            child: Text('COMPRAR'),
            style: TextButton.styleFrom(
              textStyle: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
            onPressed: widget.cart.itemsCount == 0
                ? null
                : () async {
                    setState(() => isLoading = true);

                    if (!widget.cart.items.isEmpty) {
                      await Provider.of<OrderPedidoList>(context, listen: false)
                          .addOrder(widget.cart);

                      widget.cart.clear();
                      setState(() => isLoading = false);
                    }
                  },
          );
  }
}
