import 'package:flutter/material.dart';

// making this stateful means it will be maintains internally by Flutter
//more easily, so text fields won't be cleared while inputting
class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    // rejects no titles and negative amounts
    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      // stops function execution, so no new Tx added
      return;
    }

    // widget. allows access to widget properties/methods in state class
    widget.addTx(
      enteredTitle,
      enteredAmount,
    );

    // closes topmost screen displayed
    // 'context' is a property available classwide in state class
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // controller listens to and saves user input in text field
              controller: titleController,
              onSubmitted: (_) => submitData(),
              // fires with every keystroke
              // onChanged: (val) => titleInput = val,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              // underscore is a convention for an argument we don't care about
              onSubmitted: (_) => submitData(),
              // onChanged: (val) => amountInput = val,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.purple,
              onPressed: submitData,
            )
          ],
        ),
      ),
    );
  }
}
