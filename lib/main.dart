import 'package:flutter/material.dart';
//local package
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:quizerrr/quiz_brain.dart';

void main() => runApp(Quizzer());

class Quizzer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[800],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 11.0),
            child: Quiz(),
          ),
        ),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<Icon> scoreTracker = [
  ];
  void userAnswer ( bool userAnswer){
    bool correctAnswer = quizBrain.getQuestionText();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          // style: alertStyle,
          type: AlertType.info,
          title: "Quiz Ended",
          desc: "You\'ve reached the end of the quiz.",
          buttons: [
            DialogButton(
              child: Text(
                "COOL",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.pop(context),
              color: Color.fromRGBO(0, 179, 134, 1.0),
              radius: BorderRadius.circular(0.0),
            ),
          ],
        ).show();


        // reset the questionNumber,
        quizBrain.reset();

        //empty out the scoreKeeper.
        scoreTracker = [];
      }
      else {
        if (userAnswer == correctAnswer) {
          print('Answer is correct');
          scoreTracker.add(Icon(
            Icons.check_circle_sharp,
            color: Colors.green,
          ));
        } else {
          print('Answer is incorrect');
          scoreTracker.add(Icon(
            Icons.cancel_sharp,
            color: Colors.red,
          ));
        }

        quizBrain.crashCheck();
      }
    });
  }
  QuizBrain quizBrain = QuizBrain();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                quizBrain.setQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: Size.infinite,
                textStyle: const TextStyle(fontSize: 25, color: Colors.white),
              ),
              child: Text('True'),
              onPressed: () {
                userAnswer(true);

              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size.infinite,
                textStyle: const TextStyle(fontSize: 25, color: Colors.white),
              ),
              child: Text('False'),
              onPressed: () {
                userAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreTracker,
        )
      ],
    );
  }
}
