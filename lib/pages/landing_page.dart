import 'package:flutter/material.dart';
import 'question_page.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.pink,
      child: new InkWell(
        onTap: () => Navigator.of(context).push(new MaterialPageRoute(
            builder: (BuildContext context) => new QuestionPage())),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              "이상형 월드컵",
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold),
            ),
            new Text(
              "시작",
              style: new TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
