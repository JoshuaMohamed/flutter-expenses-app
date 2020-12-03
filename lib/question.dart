import 'package:flutter/material.dart';

// use 'st' to autocomplete stateful/less widget
class Question extends StatelessWidget {
  // 'final' tells dart that this value won't change
  //after its initialisation in the constructor
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    // core of container is child
    // padding can then be added around container
    // border too (can be coloured if you want)
    // then margin around the container
    return Container(
      // width of container
      // text automatically takes full width of container
      width: double.infinity,
      // spacing around container
      // class name repeated (this.attribute) means it's a constructor
      // 'all' means spacing is same on every side
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        // text has named arguments, including style
        style: TextStyle(
          fontSize: 28,
          color: Colors.blue,
        ),

        // TextAlign is an 'enum' (list of predefined values
        //with assigned human-readable labels)
        textAlign: TextAlign.center,
      ),
    );
  }
}
