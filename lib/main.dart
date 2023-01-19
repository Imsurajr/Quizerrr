import 'package:flutter/material.dart';
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
    // make notes on dart list
    //this works because {List<Widget> children = const <Widget>[]} works for children and Icon is a widget
  ];
  // List<String> questions = [
  //  'There is no tomorrow',
  //  'Earth is Flat',
  //  'Starship can travel at light\'s speed',
  // ];
  //
  // List<bool> answer = [
  //   false,
  //   false,
  //   true,
  // ];
  //
  // Questions q1 = Questions(s:'There is no tomorrow',q: false);
  // print (q1.question),
  // print (q1.questionNum)


  //inheritance in dart is extends
  // 19 jan 11 51 photo polymorfism @overide and super

  // int questionNumber = 0;
  //ye naya bnaya quiz brain mai
  void userAnswer ( bool userAnswer){
    bool correctAnswer = quizBrain.getQuestionText();
    setState(() {
      if (quizBrain.isFinished() == true) {
        //- show an alert using rFlutter_alert,

        //This is the code for the basic alert from the docs for rFlutter Alert:
        //Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.").show();

        //Modified for our purposes:
        // Alert(
        //   context: context,
        //   title: 'Finished!',
        //   desc: 'You\'ve reached the end of the quiz.',
        // ).show();

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

        // scoreTracker.add(Icon(
        //   Icons.check_circle,
        //   color: Colors.green,
        // ));

        // print('For Question Number $questionNumber ');
        // print('True Pressed');
        // questionNumber += 1;
        quizBrain.crashCheck();
      }
    });
  }
  QuizBrain quizBrain = QuizBrain();
//pehla QuizBrain datatype (datatype is QuizBrain naam ka class) quizBrain is variable name, third QuizBrain is constructor
//   pehla is datatype, doosra is name, teesra is constructor
  @override
  Widget build(BuildContext context) {
    return Column(
      // a column widget can accept a data in form of list that's why it can have children while scaffold or safe area cant
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
                // bool correctAnswer = quizBrain.getQuestionText();
                // if (correctAnswer == false) {
                //   print('Answer is correct');
                // } else {
                //   print('Answer is incorrect');
                // }
                // setState(() {
                //   // scoreTracker.add(Icon(
                //   //   Icons.cancel,
                //   //   color: Colors.red,
                //   // ));
                //
                //   // print('For Question Number $questionNumber ');
                //   // print('False Pressed');
                //   // questionNumber += 1;
                //
                //   quizBrain.crashCheck();
                // });
                userAnswer(false);
              },
            ),
          ),
        ),
        Row(
          children: scoreTracker,
          //this works because {List<Widget> children = const <Widget>[]} works for children and Icon is a widget

        )
      ],
    );
  }
}
// ElevatedButton( onPressed(){
//
// }, child: child),
