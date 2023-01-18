import 'dart:math';
import 'dart:io';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';

import 'package:expenses/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import 'components/chart.dart';

void main(List<String> args) => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //para a orientacao ser apenas no modo retrato para cima
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline1: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
  bool _showChart = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  final List<Transaction> _transactions = [
    Transaction(
        id: 't0', title: 'colete alpinestar', value: 700, date: DateTime.now()),
    Transaction(
        id: 't1', title: 'Leatt Brace', value: 800, date: DateTime.now()),
    Transaction(
        id: 't2',
        title: 'Kit camisa Fox + calça',
        value: 1250,
        date: DateTime.now()),
    Transaction(
        id: 't3', title: 'Joelheira Fox', value: 750, date: DateTime.now()),
    Transaction(id: 't4', title: 'Luva Fox', value: 200, date: DateTime.now()),
    Transaction(
        id: 't5', title: 'óculos Leatt', value: 700, date: DateTime.now()),
  ];
  List<Transaction> get _recentTransations {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        Duration(days: 7),
      ));
    }).toList();
  }

  _addTransaction(String title, double value, DateTime data) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: data,
    );

    setState(() {
      _transactions.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  //abre o modal para que o usuario tenha acesso
  _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  _deleteTransaction(String id) {
    //chamos o metodo setSatate para que possamos setar o estado para alterar a lista de transacao
    /* setState(() {
      _transactions.removeWhere((element) {
        return element.id == id;
      });
    });*/

    //forma simplificada
    setState(() {
      _transactions.removeWhere((element) => element.id == id);
    });
  }

  Widget _getIconButton(IconData icon, Function() fn) {
    return Platform.isIOS
        ? GestureDetector(onTap: fn, child: Icon(icon))
        : IconButton(icon: Icon(icon), onPressed: fn);
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscap = mediaQuery.orientation == Orientation.landscape;

    final iconList = Platform.isIOS ? CupertinoIcons.refresh : Icons.list;
    final chartList =
        Platform.isIOS ? CupertinoIcons.refresh : Icons.show_chart;
    final actions = <Widget>[
      if (isLandscap)
        _getIconButton(
          _showChart ? Icons.list : Icons.bar_chart,
          () {
            setState(() {
              _showChart = !_showChart;
            });
          },
        ),
      _getIconButton(
        Platform.isIOS ? CupertinoIcons.add : Icons.add,
        () => _openTransactionFormModal(context),
      ),
    ];

    final appBar = AppBar(
      title: Text(
        'Despesas Pessoais',
        style: TextStyle(
          fontSize: 20 * mediaQuery.textScaleFactor,
        ),
      ),
      actions: <Widget>[
        if (isLandscap)
          IconButton(
            icon: Icon(_showChart ? Icons.list : Icons.bar_chart),
            onPressed: () {
              setState(() {
                _showChart = !_showChart;
              });
            },
          ),
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () => _openTransactionFormModal(context),
        ),
      ],
    );

    final alturaDisponivel =
        (((mediaQuery.size.height) - appBar.preferredSize.height) -
            mediaQuery.padding.top);

    final badyPage = SafeArea(
      child: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            /*if (isLandscap)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Exibir Gráfico'),
                  Switch.adaptive(
                    activeColor: Theme.of(context).accentColor,
                    value: _showChart,
                    onChanged: (value) {
                      setState(() {
                        _showChart = value;
                      });
                    },
                  ),
                ],
              ),*/
            if (_showChart || !isLandscap)
              Container(
                  height: alturaDisponivel * (isLandscap ? 0.8 : 0.3),
                  child: Chart(_recentTransations)),
            if (!_showChart || !isLandscap)
              Container(
                  height: alturaDisponivel * (isLandscap ? 1 : 0.70),
                  child: TransactionList(_transactions, _deleteTransaction)),
            //Column(),
            //TransactionList(_transactions),
            // TransactionForm(),
            //  TransactionUser(),
          ],
        ),
      ),
    );

    return Platform.isIOS
        ? CupertinoPageScaffold(
            navigationBar: CupertinoNavigationBar(
              middle: Text('Despesas Pessoais'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: actions,
              ),
            ),
            child: badyPage,
          )
        : Scaffold(
            appBar: appBar,
            body: badyPage,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () => _openTransactionFormModal(context),
                  ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
          );
  }
}
