import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_summary/result_summary.dart';

class ResultScreen extends StatelessWidget{
  const ResultScreen(this.selectedAnswers,{super.key,required this.restart});

  final List<String> selectedAnswers;
  final void Function() restart;

  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>> summary = [];

    for(var i = 0; i < selectedAnswers.length; i++){
      summary.add({
        'question_index':i,
        'question': questions[i].text,
        'correct_answer':questions[i].options[0],
        'user_answer':selectedAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(context){
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final correctAnswers = summaryData.where((data){
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return Container(
      margin: const EdgeInsets.all(40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('You answer $correctAnswers out of $totalQuestions correctly!',
          style: GoogleFonts.lato(
            color: const Color.fromARGB(255, 230, 200, 253),
            fontSize: 20,
            fontWeight: FontWeight.bold
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30,),
          ResultSummary(summaryData),
          const SizedBox(height: 30,),
          TextButton.icon(
            onPressed: restart, 
            style: TextButton.styleFrom(
              foregroundColor: Colors.white
            ),
            icon: const Icon(Icons.refresh),
            label: const Text(
              "Restart Quiz!",
            ),
          ),
        ],
      ),
    );
  }
}