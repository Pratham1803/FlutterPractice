// Importing necessary Flutter package for UI components.
import 'package:flutter/material.dart';

// Importing the DiceRoller widget from another file.
import 'package:first_flutter_app/dice_roller.dart';

// Defining constant alignment positions for the gradient.
const startAlign = Alignment.topLeft; // Gradient starts from the top-left.
const endAlign = Alignment.bottomRight; // Gradient ends at the bottom-right.

// A stateless widget that creates a container with a gradient background.
class GradientContainer extends StatelessWidget {
  // Constructor that takes a list of colors for the gradient background.
  const GradientContainer(this.colors, {super.key});

  // Declaring a final property to store the gradient colors.
  final List<Color> colors;

  @override
  Widget build(BuildContext context) {
    // Creating a container with a gradient background.
    return Container(
      decoration: BoxDecoration(
        // Applying a linear gradient with specified colors.
        gradient: LinearGradient(
          colors: colors, // List of colors passed from parent widget.
          begin: startAlign, // Gradient starts from top-left.
          end: endAlign, // Gradient ends at bottom-right.
        ),
      ),

      // Centering the child widget inside the container.
      child: const Center(
        // Using the DiceRoller widget (which should be defined in dice_roller.dart).
        child: DiceRoller(),
      ),
    );
  }
}
