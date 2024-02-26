import 'package:flutter/material.dart';
import 'package:quiz_app/answers.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key, required this.onSelected});

  final void Function(String answer) onSelected;

  @override
  State<QuestionsScreen> createState(){
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen>{

  var currentQuestionIndex = 0;

  void answerQuestion(String answer){
    widget.onSelected(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context){
    final currentQuestion = questions[currentQuestionIndex];

    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(currentQuestion.text,
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 201, 153, 251),
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30,),
          ...currentQuestion.getShuffleList().map((option) {
            return Answers(option, (){
              answerQuestion(option);
            });
          },),
      
      
          // Answers(currentQuestion.options[0], () { }),
          // Answers(currentQuestion.options[1], () { }),
          // Answers(currentQuestion.options[2], () { }),
        ],
      ),
    );
  }

}