// @required implemented in flutter, not dart
import 'package:flutter/foundation.dart';

class Transaction {
  // all runtime constants (get value when transaction is created,
  //but value thereafter never changes)
  final String id;
  final String title;
  final double amount;
  // dart built-in type
  DateTime date;

  // constructor with curly brackets for named arguments
  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.date,
  });
}
