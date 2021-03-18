import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  // list is set with constructor, used for passing data from
  //parent widget to child widget
  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: [
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.55,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctxt, index) {
              return TransactionItem(
                // set key on transaction item on direct child of listview
                // gives every new transaction list item a custom identifier
                key: ValueKey(transactions[index].id),
                transaction: transactions[index], deleteTx: deleteTx,
              );
            },
            itemCount: transactions.length,
          );
  }
}
