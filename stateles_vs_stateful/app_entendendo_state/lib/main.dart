import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StatelesVsStateful',
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _tam = 32.0;

  void aumentar() {
    setState(() {
      _tam = _tam + 16;
    });
  }

  void diminuir() {
    setState(() {
      _tam = _tam - 16;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entendendo stateful e estrutura inicial'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FlutterLogo(
            size: _tam,
          ),
          Row(
            children: [
              FlatButton(
                child: Icon(
                  Icons.add,
                ),
                onPressed: aumentar,
              ),
              FlatButton(
                child: Icon(
                  Icons.remove,
                ),
                onPressed: diminuir,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
