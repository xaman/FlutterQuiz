import 'package:flutter/material.dart';
import 'quiz_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.greenAccent,
      child: InkWell(
        onTap: () => _navigateToQuizPage(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Let's Quizzz", style: TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold)),
            Text("Tap to start!", style: TextStyle(color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  void _navigateToQuizPage(BuildContext context) {
    Navigator.of(context).push(
      new MaterialPageRoute(builder: (BuildContext context) => QuizPage())
    );
  }

}
