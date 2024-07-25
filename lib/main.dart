import 'dart:math';

import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
        ),
    );
  }
}

  class MyHomePage extends StatefulWidget{

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _transactions = [
      Transaction(
        id: 't1', title: 'Tênis novo', value: 349.99, date: DateTime.now()),
      Transaction(
        id: 't2', title: 'Luz', value: 150.49, date: DateTime.now())
    ];

    _addTransaction(String title, double value){
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title, 
      value: value, 
      date: DateTime.now()
     );

     setState(() {
       _transactions.add(newTransaction);
     });

     Navigator.of(context).pop();
}

    _openTransactionFormModal(BuildContext context){
      showModalBottomSheet(
        context: context, 
        builder: (_){
          return TransactionForm(_addTransaction);
        }
      );
    }

    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar:AppBar(title: Text('Despesas Pessoais'),
        actions: [
          IconButton(
            onPressed: () => _openTransactionFormModal(context),
            icon: Icon(Icons.add))
        ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Card(
                  color: Colors.blue,
                  child: Text('Gráfico'),
                  elevation: 5,
                ),
              ),
              TransactionList(_transactions),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: 
          Icon(Icons.add),
          onPressed: () => _openTransactionFormModal(context),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    }
}