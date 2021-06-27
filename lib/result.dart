import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final VoidCallback resetQuiz;
  Result({required this.totalScore, required this.resetQuiz});

  String get resultText {
    String resultT;

    if (totalScore <= 8) {
      resultT = 'You are awesome and innocent!';
    } else if (totalScore <= 12) {
      resultT = 'Pretty likeable!';
    } else if (totalScore <= 16) {
      resultT = 'You are ... strange?';
    } else {
      resultT = 'You are so bad!';
    }

    return resultT;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultText,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: resetQuiz,
            child: Text('Reset Quiz!'),
          )
        ],
      ),
    );
  }
}
