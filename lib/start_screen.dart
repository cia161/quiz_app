// create a custom widget for screens

import 'package:flutter/material.dart';

// stateless widget because the data in this class is not changing
class StartScreen extends StatelessWidget {
  // constructor function
  const StartScreen({super.key});

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
          const Text('Practice quiz on Flutter!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              )),
          const SizedBox(
            height: 30,
          ),
          OutlinedButton.icon(
            onPressed: () {
              //...
            },
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
