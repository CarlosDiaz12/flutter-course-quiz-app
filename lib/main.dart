import 'package:flutter/material.dart';
import 'package:flutter_course_quiz/quiz.dart';
import 'package:flutter_course_quiz/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _actualQuestionIndex = 0;
  int _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _actualQuestionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _actualQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    const _questions = <Map<String, Object>>[
      {
        'question': 'What\'s your favorite color?',
        'answers': [
          {'text': 'Red', 'score': 10},
          {'text': 'Black', 'score': 10},
          {'text': 'Blue', 'score': 10},
          {'text': 'White', 'score': 10}
        ]
      },
      {
        'question': 'What\'s your favorite animal?',
        'answers': [
          {'text': 'Dog', 'score': 10},
          {'text': 'Cat', 'score': 10},
          {'text': 'Horse', 'score': 10},
          {'text': 'Elephant', 'score': 10}
        ]
      },
      {
        'question': 'What\'s your favorite fruit?',
        'answers': [
          {'text': 'Apple', 'score': 10},
          {'text': 'Grape', 'score': 10},
          {'text': 'Orange', 'score': 10},
          {'text': 'Banana', 'score': 10}
        ]
      },
    ];

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Home Page'),
          ),
          body: _actualQuestionIndex > _questions.length - 1
              ? Result(
                  totalScore: _totalScore,
                  resetQuiz: _resetQuiz,
                )
              : Quiz(
                  answerQuestion: _answerQuestion,
                  questions: _questions,
                  actualIndexQuestion: _actualQuestionIndex,
                ),
        ));
  }
}
