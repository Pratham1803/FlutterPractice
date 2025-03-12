// Importing the Flutter material package to use UI components.
import 'package:flutter/material.dart';

// Defining a custom stateless widget called StyledText.
class StyledText extends StatelessWidget {
  // Constructor that takes a required text parameter and passes the key to the superclass.
  const StyledText(this.text, {super.key});

  // Declaring a final variable to store the text value.
  final String text; // This property holds the text to be displayed.

  @override
  Widget build(BuildContext context) {
    return Text(
      text, // Displaying the text passed as an argument.

      // Defining a text style for customization.
      style: const TextStyle(
        color: Colors.white, // Setting the text color to white.
        fontSize: 36, // Setting the font size to 36 pixels.
        fontWeight: FontWeight.bold, // Making the text bold.
      ),
    );
  }
}
