import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  // list is set with constructor, used for passing data from
  //parent widget to child widget
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      // without defining a height, ListView - which has infinite height - and
      //column - which takes maximum height - would cause an error
      height: 300,
      child: ListView.builder(
        itemBuilder: (ctxt, index) {
          return Card(
            child: Row(
              children: [
                // only takes one child
                // styling options as well as alignment
                // flexible width
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.purple,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    // $ is a reserved character for inserting a variable
                    //or expression (put into {}) into a string
                    //(string interpolation)
                    // escape character \ can be used for $ as text
                    '\$${transactions[index].amount}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.purple,
                    ),
                  ),
                ),
                // takes unlimited children
                // no styling options
                // always takes full available height/width
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMd()
                          .add_Hm()
                          .format(transactions[index].date),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
        itemCount: transactions.length,
      ),
    );
  }
}
