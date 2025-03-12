// Importing necessary Flutter packages.
import 'package:flutter/material.dart';
import 'dart:math'; // Importing the math library to generate random numbers.

// Creating a Random object to generate random dice rolls.
final randomizer = Random();

// Defining a stateful widget for rolling dice.
class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key}); // Constructor with a constant key for optimization.

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState(); // Creates the state for the DiceRoller widget.
  }
}

// The state class for DiceRoller, which manages the dice roll logic.
class _DiceRollerState extends State<DiceRoller> {
  // Variable to store the current dice number, initialized to 2.
  var diceNumber = 2;

  // Function to roll the dice when the button is pressed.
  void onClick() {
    setState(() {
      // Generates a random number between 1 and 6 (inclusive).
      diceNumber = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // Ensures the column only takes necessary space.
      children: [
        // Displays an image of the dice based on the current dice number.
        Image.asset(
          'assets/images/dice-$diceNumber.png', // Dynamically loads dice images.
          width: 300, // Sets the width of the image.
        ),

        const SizedBox(height: 20), // Adds spacing between the image and the button.

        // Button to roll the dice.
        TextButton(
          onPressed: onClick, // Calls the onClick function when pressed.
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(10), // Adds padding to the button.
            foregroundColor: Colors.white, // Sets the text color to white.
            textStyle: const TextStyle(
              fontSize: 24, // Increases text size for better visibility.
            ),
          ),
          child: const Text("Roll Dice"), // Button label.
        ),
      ],
    );
  }
}
