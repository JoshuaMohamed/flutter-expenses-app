import 'package:flutter/material.dart';
import 'package:gitpodflutter/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

import './chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  // list of maps
  // getter (dynamically generated property)
  List<Map<String, Object>> get groupedTransactionValues {
    // body of better is a 7x loop with function taking index as arg
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      // loops through all transactions and adds amount to weekDay's
      //total (current generator day)
      for (var tx in recentTransactions) {
        if (tx.date.day == weekDay.day &&
            tx.date.month == weekDay.month &&
            tx.date.year == weekDay.year) {
          totalSum += tx.amount;
        }
      }

      // alternative for loop:
      // internal variable with initial value; exit condition; increment variable
      // for (var i = 0; i < recentTransactions.length; i++) {}

      print(DateFormat.E().format(weekDay).substring(0, 1));
      print(totalSum);

      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get totalSpending {
    // allows changing list to other type with logic
    return groupedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionValues.map((data) {
          // uses $ for string interpolation,
          //so dart just sees one long string (no variables)
          return ChartBar(
            data['day'],
            data['amount'],
            totalSpending == 0.0
                ? 0.0
                : (data['amount'] as double) / totalSpending,
          );
        }).toList(),
      ),
    );
  }
}
