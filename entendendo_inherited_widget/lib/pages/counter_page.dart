import 'package:entendendo_inherited_widget/providers/counter_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({Key? key}) : super(key: key);

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override
  Widget build(BuildContext context) {
    final provider = CounterProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Exemplo Contador usando Provider'),
      ),
      body: Column(
        children: [
          Card(
            elevation: 5,
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      provider?.state.inc();
                    });

                    print(provider?.state.value);
                  },
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      provider?.state.dec();
                    });

                    print(provider?.state.value);
                  },
                  icon: Icon(Icons.remove),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                      left: 10, top: 2.5, bottom: 10, right: 10),
                  child: Text(
                    '|',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 45,
                    ),
                  ),
                ),
                Text(
                  '${provider?.state.value.toString() ?? '0'}',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 40,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            provider?.state.inc();
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
