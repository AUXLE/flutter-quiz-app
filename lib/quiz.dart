import 'package:flutter/material.dart';
import 'package:quiz_app/home_page.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/result_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{

  List<String> selectedAnswers = [];

  var activeScreen = 'home-page';

  // @override
  // void initState() {
  //   activeScreen = HomePage(switchState);
  //   super.initState();
  // }

  void switchState(){
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){
      setState(() {
        activeScreen = 'results-page';
      });
    }
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers = [];
      activeScreen = 'Home-page';
    });
  }

  @override
  Widget build(context){
    Widget screenWidget = HomePage(switchState);

    if(activeScreen == 'question-screen'){
      screenWidget = QuestionsScreen(onSelected: chooseAnswer);
    }
    else if(activeScreen == 'results-page'){
      screenWidget = ResultScreen(selectedAnswers,restart: restartQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color.fromARGB(255, 26, 2, 80), Color.fromARGB(255, 45, 7, 98)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )
      ),
      child: Center(child: screenWidget),
        ),
      ),
    );
  }
}