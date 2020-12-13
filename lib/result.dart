import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  // getter: special type of property (property + method)
  // type + 'get' keyword + any name
  // used as a normal property, but always returns something
  String get resultPhrase {
    String resultText;
    if (resultScore <= 8) {
      resultText = 'DoubleMegaPog!';
    } else if (resultScore <= 12) {
      resultText = 'Pog!';
    } else if (resultScore <= 16) {
      resultText = 'Not Pog?';
    } else {
      resultText = 'tH!S Is nOt POGGGG!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Restart Quiz!',
            ),
            textColor: Colors.blue,
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
