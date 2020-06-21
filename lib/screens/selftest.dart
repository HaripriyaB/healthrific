import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthrific/screens/homepage.dart';

var finalScore = 0;
var questionNumber = 0;
var quiz = new Quiz();

class Quiz {
  var questions = [
    "Are you experiencing any of the following symptoms?",
    "Have you ever had any of the following?",
    "Have you travelled anywhere internationally in the last 28-45 days?",
    "Which of the following apply to you?",
  ];
  var choices = [
    ["Cough", "Fever", "Difficulty in breathing", "None of the above"],
    [
      "Diabetes",
      "Hypertension",
      "Lung disease",
      "None of the above"
    ],
    ["Yes", "No","",""],
    [
      "I have recently interacted with a person tested COVID-19 positive.",
      "I'm a health care worker and examined a person without protection who was tested COVID-19 positive.",
      "None of the above",""
    ]
  ];
}

class SelfTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Quiz1State();
  }
}

class Quiz1State extends State<SelfTest> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          body: new Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(20.0)),
                new Container(
                  alignment: Alignment.centerRight,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        "Question ${questionNumber + 1} of ${quiz.questions.length}",
                        style: new TextStyle(fontSize: 22.0),
                      ),
                    ],
                  ),
                ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new Text(
                  quiz.questions[questionNumber],
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //button 1
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: () {
                        if (quiz.choices[questionNumber][0] !=
                            "None of the above") {
                          debugPrint("Correct");
                          finalScore++;
                        } else {
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(
                        quiz.choices[questionNumber][0],
                        style:
                            new TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                    new Padding(padding: EdgeInsets.all(10.0)),
                    //button 2
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: () {
                        if (quiz.choices[questionNumber][1] !=
                            "None of the above") {
                          debugPrint("Correct");
                          finalScore++;
                        } else {
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(
                        quiz.choices[questionNumber][1],
                        style:
                            new TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                new Padding(padding: EdgeInsets.all(10.0)),
                new Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    //button 3
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: () {
                        if (quiz.choices[questionNumber][2] == "Yes") {
                          debugPrint("Correct");
                          finalScore++;
                        } else {
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(
                        quiz.choices[questionNumber][2],
                        style:
                            new TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),

                    //button 4
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: () {
                        if (quiz.choices[questionNumber][3] !=
                            "None of the above") {
                          debugPrint("Correct");
                          finalScore++;
                        } else {
                          debugPrint("Wrong");
                        }
                        updateQuestion();
                      },
                      child: new Text(
                        quiz.choices[questionNumber][3],
                        style:
                            new TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }

  void updateQuestion() {
    setState(() {
      if (questionNumber == quiz.questions.length - 1) {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => new Summary(
                      score: finalScore,
                    )));
      } else {
        questionNumber++;
      }
    });
  }
}

class Summary extends StatelessWidget {
  final int score;
  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Risk Level: $score / 4",
                style: new TextStyle(fontSize: 35.0),
              ),
              new Padding(padding: EdgeInsets.all(30.0)),
              new MaterialButton(
                color: Colors.red,
                onPressed: () {
                  questionNumber = 0;
                  finalScore = 0;
                  Navigator.pop(context);
                  Navigator.pop(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                },
                child: new Text(
                  "Quit",
                  style: new TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
