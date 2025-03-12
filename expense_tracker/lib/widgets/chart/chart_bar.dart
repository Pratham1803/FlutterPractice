// Importing the Flutter Material package for UI components.
import 'package:flutter/material.dart';

/// A stateless widget that represents a single bar in a chart.
class ChartBar extends StatelessWidget {
  /// Constructor that requires the `fill` value, which determines the bar height.
  const ChartBar({
    super.key, // Super key helps in widget tree optimizations.
    required this.fill, // `fill` determines how much the bar should be filled (0.0 - 1.0).
  });

  // A variable that stores the fill percentage for the bar.
  final double fill;

  @override
  Widget build(BuildContext context) {
    // Checking if the device is in dark mode by reading the platform brightness.
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Expanded(
      // Ensures that the bar takes up equal space in a flex layout (like a Row or Column).
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        // Adds horizontal spacing between bars for better visualization.

        child: FractionallySizedBox(
          heightFactor: fill,
          // Sets the height of the bar relative to its parent (0.0 = empty, 1.0 = full).

          child: DecoratedBox(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle, // Defines the shape as a rectangle.
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
              // Rounds only the top corners to make the bar visually appealing.

              color: isDarkMode
                  ? Theme.of(context).colorScheme.secondary
                  // Uses secondary color in dark mode.
                  : Theme.of(context).colorScheme.primary.withOpacity(0.65),
              // Uses primary color with opacity in light mode.
            ),
          ),
        ),
      ),
    );
  }
}
