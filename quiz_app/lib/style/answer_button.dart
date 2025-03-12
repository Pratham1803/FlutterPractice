import 'package:flutter/material.dart';
import 'package:quiz_app/style/text_style.dart';

/*
  AnswerButton:
  A reusable button widget designed for selecting answers in a quiz.

  Features:
  - Displays an answer option inside a styled button.
  - Calls a function when tapped.
  - Uses custom text styling from `TextStyleClass`.

  Parameters:
  - answer: The text to display on the button.
  - onTap: A callback function triggered when the button is pressed.
*/
class AnswerButton extends StatelessWidget {
  // Properties: the answer text and a function to handle button taps.
  final String answer;
  final void Function() onTap;

  /*
    Constructor:
    - Requires an answer string and an onTap function.
  */
  const AnswerButton(this.answer, this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5), // Adds spacing around the button
      child: ElevatedButton(
        onPressed: onTap, // Calls the provided function when tapped
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40), // Adds padding inside the button
          backgroundColor: const Color.fromARGB(255, 33, 1, 95), // Dark blue background
          foregroundColor: Colors.white, // White text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Rounded corners
          ),
        ),
        child: TextStyleClass(answer), // Uses the custom text styling class
      ),
    );
  }
}
