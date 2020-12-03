// flutter.dev/docs if stuck
// Ctrl+Space to get autocompletion of named args

import 'package:flutter/material.dart';

// should have a block of imports that points to packages
//and a separate block that points to own files
import './question.dart';
import './answer.dart';

// main function always executed when app launches
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

// leading underscore in every instance
//of name makes class/property private
class _MyAppState extends State<MyApp> {
  // lists can group relate data together
  final questions = const [
    // map (a dictionary in Python) of key value pairs
    {
      'questionText': 'What\'s your favourite colour?',
      'answers': ['Black', 'Red', 'Blue', 'White'],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': ['Rabbit', 'Snake', 'Elephant', 'Lion'],
    },
    {
      'questionText': 'Who\'s your favourite instructor?',
      'answers': ['Max', 'Max', 'Max', 'Max'],
    },
  ];

  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < questions.length) {
      print('We have more questions!');
    }
  }

  // decorator shows that we're deliberately overriding
  //the build method with our implementation.
  // This is always the case with a StatelessWidget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Scaffold creates a base page design
      home: Scaffold(
        // all widgets are classes, so we must instantiate them
        appBar: AppBar(
          title: Text('My First App'),
        ),
        // adding a comma after parenthesis allows to to autoformat it
        // body only takes one widget
        // ternary expression (condition)
        body: _questionIndex < questions.length
            // question mark marks start of code to run if condition met
            // only 1 expression can follow (Column in this case)
            ? Column(
                children: [
                  Question(
                    questions[_questionIndex]['questionText'],
                  ),
                  // spread operators pull all values in list out and add them to
                  //surrounding list as individual values, to prevent nested list
                  ...(questions[_questionIndex]['answers'] as List<String>)
                      .map((answer) {
                    // pointer to _answerQuestion function is passed as a callback
                    // (receiving widget calls it in the future)
                    return Answer(_answerQuestion, answer);
                  }).toList(), // map() gives an iterable, which we specify is a list
                ],
              )
            // colon marks start of else block
            : Center(
                child: Text('You did it!'),
              ),
      ),
    );
  }
}
