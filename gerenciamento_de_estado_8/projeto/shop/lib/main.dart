import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/models/auth.dart';
import 'package:shop/models/cart.dart';
import 'package:shop/models/order_pedido_list.dart';
import 'package:shop/models/product_list.dart';
import 'package:shop/pages/auth_or_home_page.dart';
import 'package:shop/pages/auth_page.dart';
import 'package:shop/pages/cart_page.dart';
import 'package:shop/pages/order_page.dart';
import 'package:shop/pages/product_detail_page.dart';
import 'package:shop/pages/product_form_page.dart';
import 'package:shop/pages/products_overview_page.dart';
import 'package:shop/pages/products_page.dart';
import 'package:shop/utils/app_routes.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        //O provider de productList depende do provider Auth(), ou seja , um provider depende do outro, preciso pegar o token do provider auth para enviar na requisicao do produtos do provider productList
        //para resolver o problema acima, usaremos o proxyProvider, usamos o proxyProvider quando vamos depender de um unico provider,  se o seu provider precisar de mais de um provider sera necessario usar outro tipo de proxyProvider
        // Como usar o ChangeNotifierProxyProvider ? é simples ChangeNotifierProxyProvider< NOME DO PROVIDER QUE PRECISO/DEPENDO, NOME DO PROVIDER QUE PRECISA>
        ChangeNotifierProvider(create: (((context) => Auth()))),
        ChangeNotifierProxyProvider<Auth, ProductList>(
          create: ((context) => ProductList('', [])),
          update: (ctx, auth, previous) {
            return ProductList(auth.token ?? '', previous?.items ?? []);
          },
        ),
        ChangeNotifierProxyProvider<Auth, OrderPedidoList>(
          create: ((context) => OrderPedidoList('', [])),
          update: (ctx, auth, previous) {
            return OrderPedidoList(auth.token ?? '', previous?.items ?? []);
          },
        ),
        ChangeNotifierProvider(create: ((context) => Cart())),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        initialRoute: AppRoutes.AUTH_OR_HOME,
        routes: {
          AppRoutes.AUTH_OR_HOME: (context) => AuthOrHomePage(),
          // AppRoutes.HOME_PAGE: (context) => ProductsOverviewPage(),
          AppRoutes.PRODUCT_DETAIL: (context) => ProductDetailPage(),
          AppRoutes.CART_PAGE: (context) => CartPage(),
          AppRoutes.ORDERS: (context) => OrderPage(),
          AppRoutes.PRODUCTS: (context) => ProductsPage(),
          AppRoutes.PRODUCT_FORM: (context) => ProductFormPage(),
        },
        //home: ProductsOverviewPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
