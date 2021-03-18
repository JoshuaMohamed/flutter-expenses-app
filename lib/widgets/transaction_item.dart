import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    // key accepted for root level stateful widget
    Key key,
    @required this.transaction,
    @required this.deleteTx,
    // calling super instantiates parent class
    //(only necessary for passing extra data to parent class)
    // constructor inistialiser list forwards key to parent class
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor;

  @override
  // called before build, so setState not needed
  void initState() {
    const availableColours = [
      Colors.red,
      Colors.blue,
      Colors.black,
      Colors.purple,
    ];
    _bgColor = availableColours[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _bgColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text('£${widget.transaction.amount}'),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.headline6,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 500
            ? TextButton.icon(
                icon: const Icon(Icons.remove_circle),
                label: const Text('Delete'),
                onPressed: () => widget.deleteTx(widget.transaction.id),
                style:
                    TextButton.styleFrom(primary: Theme.of(context).errorColor),
              )
            : IconButton(
                icon: const Icon(Icons.remove_circle),
                color: Theme.of(context).errorColor,
                onPressed: () => widget.deleteTx(widget.transaction.id),
              ),
      ),
    );
  }
}
