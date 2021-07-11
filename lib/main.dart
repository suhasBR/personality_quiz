import 'package:flutter/material.dart';

import './answer.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'What\'s your favorite color ?',
      'answers': [
        {
          'text': 'Black',
          'score': 10
        },
        {
          'text': 'Red',
          'score': 5
        },
        {
          'text': 'Green',
          'score': 3
        },
        {
          'text': 'Yellow',
          'score': 1
        }
      ]
    },
    {
      'questionText': 'What\'s your favorite animal ?',
      'answers': [
        {
          'text': 'Rabbit',
          'score': 10
        },
        {
          'text': 'Rabbit',
          'score': 3
        },
        {
          'text': 'Rabbit',
          'score': 5
        },
        {
          'text': 'Rabbit',
          'score': 1
        }
      ]
    }
  ];

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
      print('We have more questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Personality Quiz'),
        ),
        body: _questionIndex < _questions.length ? Quiz(answerQuestion: _answerQuestion, questionIndex: _questionIndex, questions: _questions) : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
