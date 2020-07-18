import 'package:flutter/material.dart';
import 'quizz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizzbrain quizzBrain =Quizzbrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scorekeeper=[];
  void checkans(bool userans)
  {
    bool correctanswer=quizzBrain.getans() ;

    setState(() {
      if(quizzBrain.isFinished()==true){
        Alert(
          context:context,
          title: 'Finished!',
          desc: 'you\'ve reached the end of quiz.',
        ).show();
        quizzBrain.reset();
        scorekeeper=[];
      }
      else{
      if(userans==correctanswer)
      {
      // print('ans is correct');
      scorekeeper.add(Icon(Icons.check,color: Colors.green,),);
      }
      else
      {
      // print('ans is wrong');
      scorekeeper.add(Icon(Icons.close,color:Colors.red,),);
      }
      quizzBrain.nextquestion();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(

                quizzBrain.getquestiontext(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
               checkans(true);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkans(false);
              },
            ),
          ),
        ),
        Row(
           children: scorekeeper,

        )
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,

             Icon(
               Icons.check,
               color: Colors.green,),
*/
