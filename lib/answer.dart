import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  // store received arguments selectHandler as a property
  final Function selectHandler;
  final String answerText;

  // constructor
  Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        // uses static property 'blue', which can be used
        //without instantiating the class
        color: Colors.blue,
        child: Text(answerText),
        textColor: Colors.white,
        // pass name, not result, so no ()
        onPressed: selectHandler,
      ),
    );
  }
}
