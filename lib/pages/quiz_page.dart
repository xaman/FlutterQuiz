import 'package:flutter/material.dart';

import '../utils/question.dart';
import '../utils/quiz.dart';

import '../ui/answer_button.dart';
import '../ui/question_text.dart';
import '../ui/correct_wrong_overlay.dart';

import '../pages/score_page.dart';

class QuizPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new QuizState();
}

class QuizState extends State<QuizPage> {

  Question currentQuestion;
  Quiz quiz = Quiz([
    Question("Elon Musk is human", false),
    Question("Pizza is healthy", false),
    Question("Flutter is awesome", true)
  ]);
  String questionText;
  int questionNumber;
  bool isCorrect;
  bool overlayShouldBeVisible = false;

  @override
  void initState() {
    super.initState();
    currentQuestion = quiz.nextQuestion;
    questionText = currentQuestion.question;
    questionNumber = quiz.questionNumber;
  }

  void handleAnswer(bool answer) {
    isCorrect = (answer == currentQuestion.answer);
    quiz.answer(isCorrect);
    this.setState((){
      overlayShouldBeVisible = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Column( // This is our main page
          children: <Widget>[
            AnswerButton(true, () => handleAnswer(true)), // true button
            QuestionText(questionText, questionNumber),
            AnswerButton(false, () => handleAnswer(false)) // false button
          ],
        ),
        overlayShouldBeVisible ? CorrectWrongOverlay(isCorrect,
          () {
            if (quiz.questionNumber == quiz.length) {
              _navigateToScorePage(context);
              return;
            }
            currentQuestion = quiz.nextQuestion;
            setState(() {
              overlayShouldBeVisible = false;
              questionText = currentQuestion.question;
              questionNumber = quiz.questionNumber;
            });
          }
        ) : Container()
      ],
    );
  }

  void _navigateToScorePage(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (context) => ScorePage(quiz.score, quiz.length)), (Route route) => route == null);
  }

}

