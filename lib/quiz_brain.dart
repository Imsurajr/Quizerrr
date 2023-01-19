import 'questions.dart';

int _questionNumber = 0;
class QuizBrain {
final List<Questions> _questionSource = [
  Questions('Some cats are actually allergic to humans', true),
  Questions('You can lead a cow down stairs but not up stairs.', false),
  Questions('Approximately one quarter of human bones are in the feet.', true),
  Questions('A slug\'s blood is green.', true),
  Questions('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
  Questions('It is illegal to pee in the Ocean in Portugal.', true),
  Questions(
      'No piece of square dry paper can be folded in half more than 7 times.',
      false),
  Questions(
      'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
      true),
  Questions(
      'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
      false),
  Questions(
      'The total surface area of two human lungs is approximately 70 square metres.',
      true),
  Questions('Google was originally called \"Backrub\".', true),
  Questions(
      'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
      true),
  Questions(
      'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
      true),

];
//19 1  6 8 photo a object will have this property and it would be able to perform this methods
// 19 1 8 20 photo this. lgate hi it'll refer to object
//   6 41 both ss are same

void crashCheck ()
{
  if(_questionNumber < _questionSource.length -1  )
    {
      _questionNumber++;
    }
  print('Question Number $_questionNumber ');
  // print(_questionSource.length);
}

// to prevent it from making changes in code afterward do this _ in front of list to make it private
  String setQuestionText (){
    return _questionSource[_questionNumber].question;
  }
  bool getQuestionText (){
    return _questionSource[_questionNumber].answer;
  }

  //  Part A - Create a method called isFinished() here that checks to see if we have reached the last question. It should return (have an output) true if we've reached the last question and it should return false if we're not there yet.

  bool isFinished() {
    if (_questionNumber >= _questionSource.length - 1) {
      // Use a print statement to check that isFinished is returning true when you are indeed at the end of the quiz and when a restart should happen.

      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  //Create a reset() method here that sets the questionNumber back to 0.
  void reset() {
    _questionNumber = 0;
  }
}

