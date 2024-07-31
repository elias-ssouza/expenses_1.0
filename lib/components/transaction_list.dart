import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) onRemove;

  const TransactionList(this.transactions, this.onRemove);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
          builder: (ctx, constraints){
            return Column(
            children: [
              SizedBox(height: constraints.maxHeight * 0.05),
              Text(
                'Nenhuma Transação Cadastrada!',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: constraints.maxHeight * 0.05),
              SizedBox(
                height: constraints.maxHeight * 0.6,
                child: Image.asset(
                  'assets/images/waiting.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          );
          }
          )
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (ctx, index) {
              final tr = transactions[index];
              return Card(
                elevation: 5,
                margin: EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 5,
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.purple,
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text('${tr.value.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.grey[100]),
                        ),
                        ),
                    ),
                  ),
                  title: Text(tr.title,
                  style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    DateFormat('d MMM y').format(tr.date),
                  ),
                  trailing: MediaQuery.of(context).size.width > 500 ? 
                  TextButton.icon(
                    onPressed: () => onRemove(tr.id), 
                    label:Text(
                      'Excluir',
                      style: TextStyle(color: Theme.of(context).colorScheme.error),
                      ),
                    )
                  : IconButton(
                    onPressed: () => onRemove(tr.id), 
                    icon: const Icon(Icons.delete),
                    color: Theme.of(context).colorScheme.error,
                    ),
                ),
              );
      });
  }
}