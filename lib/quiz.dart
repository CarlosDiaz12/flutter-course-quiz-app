import 'package:flutter/material.dart';
import 'package:flutter_course_quiz/answer.dart';
import 'package:flutter_course_quiz/question.dart';

class Quiz extends StatelessWidget {
  final Function(int) answerQuestion;
  final List<Map<String, Object>> questions;
  final actualIndexQuestion;
  Quiz({
    required this.answerQuestion,
    required this.questions,
    required this.actualIndexQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Question(
          questionText: questions[actualIndexQuestion]['question'].toString(),
        ),
        ...(questions[actualIndexQuestion]['answers']
                as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
            answerText: answer['text'].toString(),
            selectHandler: () =>
                answerQuestion(int.parse(answer['score'].toString())),
          );
        }).toList(),
      ],
    );
  }
}
