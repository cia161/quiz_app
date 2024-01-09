import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/start_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';


class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  //method that switches the screen
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  // executed when an answer is picked
  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        selectedAnswers = []; 
        activeScreen = 'results-screen';
      });
    }
  }

  @override
  Widget build(context) {

    // ternary expression
    Widget screenWidget = activeScreen == 'start-screen'// condition
              ? StartScreen(switchScreen) // value used if condition is met
              : QuestionsScreen(onSelectAnswer: chooseAnswer,); // value used if condition is not met ;

    if (activeScreen == 'questions-screen') {
      screenWidget =  QuestionsScreen(onSelectAnswer: chooseAnswer,);
    }

    if (activeScreen == 'results-screen') {
      screenWidget = const ResultsScreen();
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 97, 24, 166),
                Color.fromARGB(255, 125, 60, 186),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
