import 'package:flutter/material.dart';

import 'landing_page.dart';

class ScorePage extends StatelessWidget {

  final int score;
  final int totalQuestions;

  ScorePage(this.score, this.totalQuestions);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Your score: ",
            style: TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold)
          ),
          Text(score.toString() + "/" + totalQuestions.toString(),
            style: TextStyle(color: Colors.white, fontSize: 50.0, fontWeight: FontWeight.bold)
          ),
          IconButton(
            icon: Icon(Icons.arrow_right),
            color: Colors.white,
            iconSize: 50.0,
            onPressed: () => _navigateToLanding(context),
          )
        ],
      ),
    );
  }
  
  void _navigateToLanding(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LandingPage()), (route) => route == null);
  }

}