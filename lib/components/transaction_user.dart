import 'package:expenses/components/transaction_form.dart';
import 'package:expenses/components/transaction_list.dart';
import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionUser extends StatefulWidget {
  const TransactionUser({super.key});

  @override
  State<TransactionUser> createState() => _TransactionUserState();
}

class _TransactionUserState extends State<TransactionUser> {

  final _transactions = [
      Transaction(
        id: 't1', title: 'Tênis novo', value: 349.99, date: DateTime.now()),
      Transaction(
        id: 't2', title: 'Luz', value: 150.49, date: DateTime.now())
    ];
    
  @override
  Widget build(BuildContext context) {
    return Column(
      children:<Widget> [
        TransactionList(_transactions),
        TransactionForm(),
      ],
    );
  }
}