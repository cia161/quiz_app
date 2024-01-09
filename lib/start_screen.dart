// create a custom widget for screens

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// stateless widget because the data in this class is not changing
class StartScreen extends StatelessWidget {
  // constructor function
  const StartScreen(this.startQuiz,{super.key});

  final void Function() startQuiz;
  @override
  Widget build(context) {
    // the cetner widget will cause it to take up the whole screen
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/question_mark.png',
            width: 300,
            height: 300,
            // color argument can add an overlay to image / a transparent overlay
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          // sized box creates space between the image and the text
          const SizedBox(
            height: 80,
          ),
           Text('Practice quiz on Flutter!',
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 229, 145, 244),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              // foregroundColor is the text color
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
