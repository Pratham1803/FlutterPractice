// Importing required Flutter material package for UI components
import 'package:flutter/material.dart';

// Importing a custom text style class
import 'package:quiz_app/style/text_style.dart';

// Defining a StatelessWidget for the Start screen
class Start extends StatelessWidget {
  // Constructor accepting a function to start the quiz
  const Start(this.startQuiz, {super.key});

  // Function to be called when the "Start Quiz" button is pressed
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // Ensures column takes only required space
        children: [
          // Displays the quiz logo image
          Image.asset(
            'assets/images/quiz_logo.png', // Path to the logo image
            width: 300, // Set image width to 300 pixels
            color: const Color.fromARGB(151, 255, 255, 255), // Applies a white transparency effect
          ),

          const SizedBox(height: 80), // Adds spacing between image and text

          // Displays the heading text using a custom text style
          const TextStyleClass('Learn Flutter the fun Way!', textType: 'heading'),

          const SizedBox(height: 20), // Adds spacing between text and button

          // Button to start the quiz
          OutlinedButton.icon(
            onPressed: startQuiz, // Calls startQuiz function when clicked
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white, // Sets text color to white
            ),
            label: const TextStyleClass('Start Quiz'), // Button label with custom text style
            icon: const Icon(Icons.arrow_right_alt), // Adds an arrow icon next to text
          ),
        ],
      ),
    );
  }
}
