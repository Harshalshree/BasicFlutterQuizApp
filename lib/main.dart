import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Which football club is the best?',
      'answers': [
        {'text': 'FC Barcelona', 'score': 0},
        {'text': 'FC Bayern Munich', 'score': 5},
        {'text': 'Manchester City', 'score': 10}
      ],
    },
    {
      'questionText': 'Who is the GOAT?',
      'answers': [
        {'text': 'Ronaldo', 'score': 0},
        {'text': 'DeBruyne', 'score': 10},
        {'text': 'Messi', 'score': 5}
      ],
    },
    {
      'questionText': 'Best Football Moment?',
      'answers': [
        {'text': 'Aguerooooo', 'score': 10},
        {'text': 'Gerrard Slip', 'score': 5},
        {'text': 'PSG-BARCA', 'score': 0}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
    _questionIndex = 0;
    _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quiz App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(_answerQuestion, _questions, _questionIndex)
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
