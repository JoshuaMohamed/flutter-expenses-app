import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitpodflutter/widgets/adaptive_text_button.dart';
import 'package:intl/intl.dart';

import './adaptive_text_button.dart';

// making this stateful means it will be maintains internally by Flutter
//more easily, so text fields won't be cleared while inputting
class NewTransaction extends StatefulWidget {
  final Function addTx;

  NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    if (_amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    // rejects empty title, negative amount, and no date selected
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      // stops function execution, so no new Tx added
      return;
    }

    // widget. allows access to widget properties/methods in state class
    widget.addTx(
      enteredTitle,
      enteredAmount,
      _selectedDate,
    );

    // closes topmost screen displayed
    // 'context' is a property available classwide in state class
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    // creates a 'future' (class which creates objects
    //that will give a value in the future),
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      // 'then' method allows a function to be executed once the
      //'future' resolves to a value
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Title'),
                // controller listens to and saves user input in text field
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
                // fires with every keystroke
                // onChanged: (val) => titleInput = val,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: _amountController,
                keyboardType: TextInputType.number,
                // underscore is a convention for an argument we don't care about
                onSubmitted: (_) => _submitData(),
                // onChanged: (val) => amountInput = val,
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No Date Chosen!'
                            : 'Picked Date: ${DateFormat.yMd().format(_selectedDate)}',
                      ),
                    ),
                    AdaptiveTextButton('Choose Date', _presentDatePicker),
                  ],
                ),
              ),
              ElevatedButton(
                child: Text('Add Transaction'),
                onPressed: _submitData,
              )
            ],
          ),
        ),
      ),
    );
  }
}
