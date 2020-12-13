// flutter run -d web-server --web-port=8080 --web-hostname=0.0.0.0

// flutter.dev/docs if stuck
// Ctrl+Space to get autocompletion of named args

import 'package:flutter/material.dart';

// should have a block of imports that points to packages
//and a separate block that points to own files
import './quiz.dart';
import './result.dart';

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
  final _questions = const [
    // map (a dictionary in Python) of key value pairs
    {
      'questionText': 'What\'s your favourite colour?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Blue', 'score': 3},
        {'text': 'White', 'score': 1},
      ],
    },
    {
      'questionText': 'What\'s your favourite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 3},
        {'text': 'Snake', 'score': 10},
        {'text': 'Elephant', 'score': 5},
        {'text': 'Lion', 'score': 8},
      ],
    },
    {
      'questionText': 'Pick a number',
      'answers': [
        {'text': '1', 'score': 1},
        {'text': '2', 'score': 2},
        {'text': '3', 'score': 3},
        {'text': '4', 'score': 4},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if (_questionIndex < _questions.length) {
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
        body: _questionIndex < _questions.length
            // question mark marks start of code to run if condition met
            // only 1 expression can follow (Column in this case)
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            // colon marks start of else block
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
