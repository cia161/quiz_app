// return the material App
// should be stateful widget

import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer,});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {

    widget.onSelectAnswer(selectedAnswer);
    // updates build method
    setState(() {
     currentQuestionIndex  += 1; 
    });
    
  }
  
  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, // tells Dart to use as much width as possible
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // centers the column
          crossAxisAlignment: CrossAxisAlignment.stretch, // stretch items as wide as possible
          children: [
             Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 146, 169, 227),
                fontSize: 24,
                fontWeight: FontWeight.bold,

              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // ... spreading values - spreads the list as individual comma separated valeus
            ...currentQuestion.getShuffledAnswers().map((answer) {
              return AnswerButton(answerText: answer, onTap:() {
                answerQuestion(answer);
              });
            })
          ],
        ),
      ),
    );
  }
}
