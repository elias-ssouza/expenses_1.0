import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

main() => runApp(ExpensesApp());

class ExpensesApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:MyHomePage()
    );
  }
}

  class MyHomePage extends StatelessWidget{
    final _transactions = [
      Transaction(
        id: 't1', title: 'Tênis novo', value: 349.99, date: DateTime.now()),
      Transaction(
        id: 't2', title: 'Luz', value: 150.49, date: DateTime.now())
    ];
  
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar:AppBar(title: Text('Despesas Pessoais'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              child: Card(
                color: Colors.blue,
                child: Text('Gráfico'),
                elevation: 5,
              ),
            ),
            Card(
              child: Text('Lista de Transações'),
            ),
          ],
        ),
      );
    }
  }
